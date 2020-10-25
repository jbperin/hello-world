
# http://leonard.oxg.free.fr/ymformat.html#ymchip

#http://ym2149.org/resources/YM-format.txt


# Archive of musics: 
# https://bulba.untergrund.net/music_e.htm
# https://vgmrips.net/packs/chip/ay-3-8910
# https://www.smspower.org/uploads/Music/vgmspec160.txt


import struct


import struct
import binascii


YM_FILE_PATH = 'C:\\Users\\Public\\osdk_1_15\\sample\\basic\\tap2dsk-GameMusics\\data'
YM_FILE_NAME = 'alien_frame.ym'
YM_FILE_PATH = 'C:\\Users\\Public\\Git\\hello-world\\retro\\oric\\soundlabo'
YM_FILE_NAME = 'mySong.ym'


dRegisterName = { 
    'r0'  : "ToneAFine",
    'r1'  : "ToneACoarse",
    'r2'  : "ToneBFine",
    'r3'  : "ToneBCoarse",
    'r4'  : "ToneCFine",
    'r5'  : "ToneCCoarse",
    'r6'  : "NoiseGenerator",
    'r7'  : "Mixer",
    'r10' : "AmplitudeA",
    'r11' : "AmplitudeB",
    'r12' : "AmplitudeC",
    'r13' : "EnvelopeFine",
    'r14' : "EnvelopeCoarse",
    'r15' : "EnvelopeShapeCycle",
    'r16' : "IOA",
    'r17' : "IOB",
   
}
# s = struct.Struct('I 2s f')
# values = (1, 'ab', 2.7)
# print 'Original:', values

# print
# print 'ctypes string buffer'

# import ctypes
# b = ctypes.create_string_buffer(s.size)
# print 'Before  :', binascii.hexlify(b.raw)
# s.pack_into(b, 0, *values)
# print 'After   :', binascii.hexlify(b.raw)
# print 'Unpacked:', s.unpack_from(b, 0)

# print
# print 'array'

# import array
# a = array.array('c', '\0' * s.size)
# print 'Before  :', binascii.hexlify(a)
# s.pack_into(a, 0, *values)
# print 'After   :', binascii.hexlify(a)
# print 'Unpacked:', s.unpack_from(a, 0)



# 0 LWORD 4 File ID "YM6!"
# 4 STRING[8] 8 Check string "LeOnArD!"
# 12 LWORD 4	Nb of frame in the file
# 16 LWORD 4 Song attributes
# 20 WORD 2 Nb of digidrum samples in file (can be 0)
# 22 LWORD 4	YM master clock implementation in Hz .(ex:2000000 for ATARI-ST version, 1773400 for ZX-SPECTRUM)
# 26 WORD 2 Original player frame in Hz (traditionnaly 50)
# 28 LWORD 4	Loop frame (traditionnaly 0 to loop at the beginning)
# 32 WORD 2  Size, in bytes, of futur additionnal data. You have to skip these bytes. (always 0 for the moment)

# Then, for each digidrum: (nothing if no digidrum)
# 34 LWORD 4 Sample size
# 38 BYTES n Sample data (8 bits sample)

# Then some additionnal informations
def diffFrame (current_frame, fra):
    delta = []
    for reg in dRegisterName.keys():
        if (current_frame[reg] != fra[reg]):
            delta.append ([reg, current_frame[reg], fra[reg]])
    return delta
# ? NT-String ? Song name
# ? NT-String ? Author name
# ? NT-String ? 	Song comment
# ? BYTES ? YM register data bytes. (r0,r1,r2....,r15 for each frame). Order depend on the "interleaved" bit. It takes 16*nbFrame bytes.
# ? LWORD 4	End ID marker. Must be "End!"
def readNullTerminatedString(bytes_read, idx_data):
    chars = []
    idx=idx_data
    while True:
        c = bytes_read[idx]
        # print (idx_data, c)
        idx = idx+1
        if c == 0:
            res = "".join(chars)
            break
        
        chars.append(chr(c))
    return idx, res

def main():

    #BubbleBobble.ym alien_frame.ym
    with open(YM_FILE_PATH+'\\'+YM_FILE_NAME, "rb") as f:
        bytes_read = f.read()
    file_format = struct.unpack('4s',bytes_read[0:4])[0].decode("utf-8")
    # print (file_format[0].decode("utf-8"))
    if file_format == 'YM5!':
        s = struct.Struct('>4s 8s I I I I H I H')
        unpacked = s.unpack(bytes_read[0:s.size])
        header = {
            'idFormat':unpacked[0],
            'checkString':unpacked[1],
            'nbValidVBL':unpacked[2],
            'songAttributes':unpacked[3],
            'nbDigidrum':unpacked[4],
            'externalFrequency':unpacked[5],
            'playerFrequency':unpacked[6],
            'loopVBL':unpacked[7],
            'size':unpacked[8],
        }    
        print (header)
        idx_data = s.size

    elif file_format == 'YM6!':
        s = struct.Struct('>4s 8s I I H I H I H')
        unpacked = s.unpack(bytes_read[0:s.size])
        # print (unpacked)
        header = {
            'idFormat':unpacked[0],
            'checkString':unpacked[1],
            'nbFrames':unpacked[2],
            'songAttributes':unpacked[3],
            'nbDigidrum':unpacked[4],
            'masterClockHz':unpacked[5],
            'origPlayerFrames':unpacked[6],
            'loopFrame':unpacked[7],
            'size':unpacked[8],
        }    
        
        idx_data = s.size
        idx_data , header['songTitle']=readNullTerminatedString(bytes_read, idx_data)
        idx_data , header['authorName']=readNullTerminatedString(bytes_read, idx_data)
        idx_data , header['songComment']=readNullTerminatedString(bytes_read, idx_data)
        print (header)
        frames_data=[]
        if (header['songAttributes'] %  2 ==1):
            print ('interleaved')
            for ii in range (header['nbFrames']):
                frame= {'r0' : bytes_read[idx_data], 
                        'r1' : bytes_read[idx_data+ 1*header['nbFrames']],
                        'r2' : bytes_read[idx_data+ 2*header['nbFrames']],
                        'r3' : bytes_read[idx_data+ 3*header['nbFrames']],
                        'r4' : bytes_read[idx_data+ 4*header['nbFrames']],
                        'r5' : bytes_read[idx_data+ 5*header['nbFrames']],
                        'r6' : bytes_read[idx_data+ 6*header['nbFrames']],
                        'r7' : bytes_read[idx_data+ 7*header['nbFrames']],
                        'r10': bytes_read[idx_data+ 8*header['nbFrames']],
                        'r11': bytes_read[idx_data+ 9*header['nbFrames']],
                        'r12': bytes_read[idx_data+10*header['nbFrames']],
                        'r13': bytes_read[idx_data+11*header['nbFrames']],
                        'r14': bytes_read[idx_data+12*header['nbFrames']],
                        'r15': bytes_read[idx_data+13*header['nbFrames']],
                        'r16': bytes_read[idx_data+14*header['nbFrames']],
                        'r17': bytes_read[idx_data+15*header['nbFrames']]}
                idx_data = idx_data + 16
                # print (frame)
                frames_data.append(frame)
        else:
            print ('non interleaved not properly  handled')
            r = struct.Struct('>B B B B B B B B B B B B B B B B')
            for i in range(header['nbFrames']):
            
                unpacked = r.unpack(bytes_read[idx_data:idx_data+r.size])
                idx_data=idx_data+r.size
                # print (unpacked)
                frame= {'r0' : unpacked[0], 
                        'r1' : unpacked[ 1],
                        'r2' : unpacked[ 2],
                        'r3' : unpacked[ 3],
                        'r4' : unpacked[ 4],
                        'r5' : unpacked[ 5],
                        'r6' : unpacked[ 6],
                        'r7' : unpacked[ 7],
                        'r10': unpacked[ 8],
                        'r11': unpacked[ 9],
                        'r12': unpacked[10],
                        'r13': unpacked[11],
                        'r14': unpacked[12],
                        'r15': unpacked[13],
                        'r16': unpacked[14],
                        'r17': unpacked[15]}
                # print (frame)
                frames_data.append(frame)
        
    unpacked = struct.unpack(">4s", bytes_read[idx_data:idx_data+4] )
    print (unpacked)
        # unpacked = r.unpack(bytes_read[idx_data:idx_data+r.size])
        # print (unpacked)
    # FileID = struct.unpack('cccc', bytes_read[0:4])
    # print(str(FileID))

    ind = 0
    current_frame = frames_data[0]
    print (current_frame)
    for fra in frames_data[1:]:
        dfra = diffFrame(current_frame, fra)
        if len(dfra) != 0:
            print ("%04d"%ind, dfra)
        # print ("%04d"%ind, fra)
        current_frame = fra
        ind = ind+1

if __name__ == '__main__':
    main()
