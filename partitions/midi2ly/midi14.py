#!/usr/bin/env python
# -*- coding: cp1252 -*-
import MidiAnalyser
from MidiPond import getLilyString
import subprocess

LilyFile_trailer ="""
 \\break
		}
	%}
  }
}
>>
\\layout { indent = 0.0\\cm }
}


"""


LilyFile_bass_header ="""
\\version "2.18.2"  % necessary for upgrading to future LilyPond versions.

\\markup {
Titre .. Auteur
}

\\score {
<<
\\new ChordNames {
  \\set chordChanges = ##t
  \\chordmode {
	a1
  }
}
\\new Staff {
  \\clef treble
  \\time 4/4
  \\key bes \major
  \\tempo 4 = 122
  \\new Voice {
	%\\partial 2
	%\\relative c {
		\\repeat volta 2{

"""
LilyFile_lead_header ="""
\\version "2.18.2"  % necessary for upgrading to future LilyPond versions.

\\markup {
Titre .. Auteur
}

\\score {
<<
\\new ChordNames {
  \\set chordChanges = ##t
  \\chordmode {
	a1
  }
}
\\new Staff {
  \\time 4/4
  \\key c \major
  \\tempo 4 = 122
  \\new Voice {
	%\\partial 2
	%\\relative c {
		\\repeat volta 2{

"""


def runLilyPond():

    sb = subprocess.Popen(args= "launch.bat" # 'lilypond.exe -v > toto.txt' 'javac -h' 'lilypond.exe ists.ly' subprocess.list2cmdline (["dir", "/p"])
                          #, executable='C:\\Program Files\\Java\\jdk1.8.0_20\\bin\\javac.exe'
                          #, executable='C:\\Program Files (x86)\\LilyPond\\usr\\bin\\lilypond.exe'
                          , executable='C:\\Users\\root\\Documents\\midi2ly\\launch.bat'
                          , cwd='C:\\Users\\root\\Documents\\midi2ly'
                          )

    #, stdin= subprocess.PIPE
                          #, stdout= subprocess.PIPE
                          #, stderr= subprocess.STDOUT)

    output = sb.communicate('')
    print output

def main():
    #Filename = 'IShotTheSheriff_melody.MID'
    #Filename = 'IShotTheSheriff_3melody.MID'
    #Filename = 'JeTexhalte.mid'
    Filename = 'Doxy.MID'

#    main(sys.argv)
    m = MidiAnalyser.MidiAnalyser()

    m.open(Filename )
    m.read()
    m.close()
    nbTracks=m.getNbTracks()
    print "%s \n\t %s ticks per quarter note\n\t %s ticks Per Second\n\t %d tracks : "%(m.file, m.ticksPerQuarterNote, m.ticksPerSecond, nbTracks)
    list_event = []
    for num_track in range(nbTracks):
        abs_time = 0
        nbChannel=m.getNbChannels(num_track)# len(m.tracks[num_track].channels)
        print "track %d length = %d on %d channels "%(num_track, m.getLength(num_track), nbChannel)
        for ev in m.tracks[num_track].events:
            if ev.type == "DeltaTime":
                abs_time = abs_time + ev.time
            list_event.append([abs_time, ev])

    print "TimeSignature = %s"%(m.getTimeSignature(0))

    list_key_sig = [ [at,ev] for [at,ev] in list_event if ev.type == "KEY_SIGNATURE"]
    if len (list_key_sig) != 0:
        print list_key_sig[-1]
        key_sig_data = list_key_sig[-1][1].data

    #Cat_Instru["Piano", "Percu", "Orgue", "Guitare", "Basse", "Corde", "Ensembles", "Cuivre", "Anche", "Vent", "Synth Sol", "Synth Set", "Synth Eff", "Ethno", "Percu", "Bruit"]
    print "Tempo = %s"%(m.getTempo(0))

    list_prog_change = [ [at,ev] for [at,ev] in list_event if ev.type == "PROGRAM_CHANGE"]
    for [at,ev] in list_prog_change:
        print "%04d: ch %02d -> %s (%s) %d noton %d notoff " %(at, ev.channel,MidiAnalyser.Cat_Instru [ev.data / 8], MidiAnalyser.Instru[ev.data]
                                                               ,  len([ [tat,tev] for [tat,tev] in list_event if (tev.type == "NOTE_ON") and (tev.channel == ev.channel)])
                                                              , len([ [tat,tev] for [tat,tev] in list_event if (tev.type == "NOTE_OFF") and (tev.channel == ev.channel)]))
    #bass_channels = [ev.channel for [at,ev] in list_prog_change if ev.data >= 32 and ev.data <= 39]
    #bass_channel = bass_channels[-1]

    #print "**** Choix de la basse ****"
    #bass_channel = raw_input ("Quel channel doit etre graver (sugg = %d)?"%(bass_channel))
    selected_channel = raw_input ("Quel channel doit etre graver?")
    list_prog_change_of_selected_channel = [ [at,ev] for [at,ev] in list_event if ev.type == "PROGRAM_CHANGE" and ev.channel == int(selected_channel)]
    if len(list_prog_change_of_selected_channel) > 1:
        selected_sub_channel = raw_input ("Quel sous channel (sur %d)?"%len(list_prog_change_of_selected_channel))
        res = getLilyString(m, int(selected_channel), 4, int(selected_sub_channel),len(list_prog_change_of_selected_channel))
    else:
        res = getLilyString(m, int(selected_channel), 4)
        selected_sub_channel= ""

    if selected_sub_channel == "":
        output_filename = "%s_%d.ly"%(Filename[0:Filename.find('.')],int(selected_channel))
    else:
        output_filename = "%s_%d_%d.ly"%(Filename[0:Filename.find('.')],int(selected_channel),int(selected_sub_channel))

    output = open(output_filename,"w")
    output.write ("%s\n%s\n%s"%(LilyFile_bass_header, res.replace("r1*-","r1*"), LilyFile_trailer))
    output.close()

    cmd_file = open("launch.bat","w")
    cmd_file.write('"C:\Program Files\LilyPond\usr\\bin\lilypond.exe" %s 2>toto.txt\n'%(output_filename))
    #cmd_file.write('"C:\Program Files (x86)\LilyPond\usr\\bin\lilypond.exe" %s 2> toto.txt\n'%(output_filename))
    cmd_file.close()

    sb = subprocess.Popen(args= "launch.bat" # 'lilypond.exe -v > toto.txt' 'javac -h' 'lilypond.exe ists.ly' subprocess.list2cmdline (["dir", "/p"])
                          #, executable='C:\\Program Files\\Java\\jdk1.8.0_20\\bin\\javac.exe'
                          #, executable='C:\\Program Files (x86)\\LilyPond\\usr\\bin\\lilypond.exe'
                          , executable='C:\\Users\\tbpk7658\\Documents\\Partition\\midi2ly\\launch.bat'
                          #, cwd='C:\\Users\\root\\Documents\\midi2ly'
                          , cwd='C:\\Users\\tbpk7658\\Documents\\Partition\\midi2ly'
                          , stdin= subprocess.PIPE
                          , stdout= subprocess.PIPE
                          , stderr= subprocess.STDOUT)


    output = sb.communicate('')
    print output
##    print "**** Choix de la voix ****"
##    lead_channel = raw_input ("Quel channel doit etre graver?")
##    res = getLilyString(m, int(lead_channel), 4)
##
##    output = open("%s_lead.ly"%(Filename[0:Filename.find('.')]),"w")
##    output.write ("%s\n%s\n%s"%(LilyFile_lead_header, res, LilyFile_trailer))
##    output.close()


if __name__ == "__main__":
    print "coucou"
    main()


