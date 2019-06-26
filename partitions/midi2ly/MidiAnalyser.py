import wwmidi2
from wwmidi2 import *

Cat_Instru= ["Piano", "Percu", "Orgue", "Guitare", "Basse", "Corde", "Ensembles", "Cuivre", "Anche", "Vent", "Synth Sol", "Synth Set", "Synth Eff", "Ethno", "Percu", "Bruit"]

Instru = ["Acoustic Grand Piano"
,"Bright Acoustic Piano"
,"Electric Grand Piano"
,"Honky-tonk Piano"
,"Electric Piano 1"
,"Electric Piano 2"
,"Harpsichord"
,"Clavinet"
,"Celesta"
,"Glockenspiel"
,"Music Box"
,"Vibraphone"
,"Marimba"
,"Xylophone"
,"Tubular Bells"
,"Dulcimer"
,"Drawbar Organ"
,"Percussive Organ"
,"Rock Organ"
,"Church Organ"
,"Reed Organ"
,"Accordion"
,"Harmonica"
,"Tango Accordion"
,"Acoustic Guitar (nylon)"
,"Acoustic Guitar (steel)"
,"Electric Guitar (jazz)"
,"Electric Guitar (clean)"
,"Electric Guitar (muted)"
,"Overdriven Guitar"
,"Distortion Guitar"
,"Guitar Harmonics"
,"Acoustic Bass"
,"Electric Bass (finger)"
,"Electric Bass (pick)"
,"Fretless Bass"
,"Slap Bass 1"
,"Slap Bass 2"
,"Synth Bass 1"
,"Synth Bass 2"
,"Violin"
,"Viola"
,"Cello"
,"Contrabass"
,"Tremolo Strings"
,"Pizzicato Strings"
,"Orchestral Harp"
,"Timpani"
,"String Ensemble 1"
,"String Ensemble 2"
,"Synth Strings 1"
,"Synth Strings 2"
,"Choir Aahs"
,"Voice Oohs"
,"Synth Choir"
,"Orchestra Hit"
,"Trumpet"
,"Trombone"
,"Tuba"
,"Muted Trumpet"
,"French Horn"
,"Brass Section"
,"Synth Brass 1"
,"Synth Brass 2"
,"Soprano Sax"
,"Alto Sax"
,"Tenor Sax"
,"Baritone Sax"
,"Oboe"
,"English Horn"
,"Bassoon"
,"Clarinet"
,"Piccolo"
,"Flute"
,"Recorder"
,"Pan Flute"
,"Blown bottle"
,"Shakuhachi"
,"Whistle"
,"Ocarina"
,"Lead 1 (square)"
,"Lead 2 (sawtooth)"
,"Lead 3 (calliope)"
,"Lead 4 (chiff)"
,"Lead 5 (charang)"
,"Lead 6 (voice)"
,"Lead 7 (fifths)"
,"Lead 8 (bass + lead)"
,"Pad 1 (new age)"
,"Pad 2 (warm)"
,"Pad 3 (polysynth)"
,"Pad 4 (choir)"
,"Pad 5 (bowed)"
,"Pad 6 (metallic)"
,"Pad 7 (halo)"
,"Pad 8 (sweep)"
,"FX 1 (rain)"
,"FX 2 (soundtrack)"
,"FX 3 (crystal)"
,"FX 4 (atmosphere)"
,"FX 5 (brightness)"
,"FX 6 (goblins)"
,"FX 7 (echoes)"
,"FX 8 (sci-fi)"
,"Sitar"
,"Banjo"
,"Shamisen"
,"Koto"
,"Kalimba"
,"Bagpipe"
,"Fiddle"
,"Shanai"
,"Tinkle Bell"
,"Agogo"
,"Steel Drums"
,"Woodblock"
,"Taiko Drum"
,"Melodic Tom"
,"Synth Drum"
,"Reverse Cymbal"
,"Guitar Fret Noise"
,"Breath Noise"
,"Seashore"
,"Bird Tweet"
,"Telephone Ring"
,"Helicopter"
,"Applause"
,"Gunshot"
]


class Note:
    
    def __init__ (self, midinumber, start, stop):
        self.pitch = midinumber%12
        self.octave = midinumber/12
        self.midinumber = midinumber
        self.stop = stop
        self.start = start
        
    def __repr__(self):
        notes_txt=["c", "cis", "d", "ees", "e" , "f", "fis", "g", "gis", "a", "bes", "b"]
        return "%s %s %s %d "%(self.start, self.stop, notes_txt[self.pitch],self.octave)

        

class MidiAnalyser(MidiFile):
    def __init__(self):
        MidiFile.__init__(self)
        self.__list_event__ = []
        self.__notelist__ = [ ]
        
    def __register_note__(self, t, c, p, v, t1, t2):
        self.__notelist__.append((t, c, p, v, t1, t2))
    


    def read(self):
        self.__notelist__ = [ ]
        wwmidi2.register_note = self.__register_note__
        MidiFile.read(self)
        
        nbTracks=self.getNbTracks()
        #print "%s \n\t %s ticks per quarter note\n\t %s ticks Per Second\n\t %d tracks : "%(m.file, m.ticksPerQuarterNote, m.ticksPerSecond, nbTracks)
        self.__list_event__ = []
        for num_track in range(nbTracks):
            abs_tick = 0
            nbChannel=self.getNbChannels(num_track)# len(m.tracks[num_track].channels)
            #print "track %d length = %d on %d channels "%(num_track, m.getLength(num_track), nbChannel)
            #for num_channel in range (m.tracks[num_track].channels):
            #    list_chan _ev = [ ev for ev in m.tracks[0].events[:60] if ev.channel == None ]
            for ev in self.tracks[num_track].events:
                #print ev
                if ev.type == "DeltaTime":
                    abs_tick = abs_tick + ev.time
                self.__list_event__.append([abs_tick, ev])

    def measure(self,instant):
        [Time_Num, Time_Den] = self.getTimeSignature(0) # !!! BUG
        num_mesure = instant[0]/Time_Den + 1
        num_temps = instant[0] % Time_Den + 1
        fraction =  instant[1]
        return [num_mesure, num_temps, fraction]

    def instant(self,num_tick, fraction_quantification):
        pas_2_quantification = self.ticksPerQuarterNote/fraction_quantification
        nval = num_tick % pas_2_quantification
        if nval > (pas_2_quantification/2): num_tick_quant = ((num_tick / pas_2_quantification)+1)*pas_2_quantification
        else: num_tick_quant = (num_tick / pas_2_quantification)*pas_2_quantification
        num_temps = num_tick_quant / self.ticksPerQuarterNote
        remaining = (num_tick_quant % self.ticksPerQuarterNote)/pas_2_quantification
        
        return ([num_temps , [remaining,fraction_quantification]])

    def getNbTracks(self):
        return (len(self.tracks))

    def getNbChannels(self, num_track):
        return (len(self.tracks[num_track].channels))

    def getLength(self, num_track):
        return (self.tracks[num_track].length)

    def getTimeSignature(self,abs_tick):
        list_time_sig = [ [at,ev] for [at,ev] in self.__list_event__ if ev.type == "TIME_SIGNATURE"]
        ii=0
        while ii < len(list_time_sig) and list_time_sig[ii][0]<= abs_tick:
            ii=ii+1
        if ii >= len(list_time_sig) > abs_tick : ii = ii-1
        [tick, ev] = list_time_sig[ii-1]
        [Time_Num, Time_Den] = [ord(ev.data[0]), 2**ord(ev.data[1])]
        return [Time_Num, Time_Den]
    
    def getTempo(self,abs_tick):
        list_tempo = [ [at,ev] for [at,ev] in self.__list_event__ if ev.type == "SET_TEMPO"]
        ii=0
        while ii < len(list_tempo) and list_tempo[ii][0]<= abs_tick:
            ii=ii+1
        if ii >= len(list_tempo) > abs_tick : ii = ii-1
        print list_tempo[ii][1]
        inter = (ord(list_tempo[ii][1].data[0])*256 + ord(list_tempo[ii][1].data[1])) * 256 + ord(list_tempo[ii][1].data[2])
        Tempo = (1000000*60) / inter
        return Tempo

    def getNotes(self, num_channel, fraction_quantification, offset_subtrack = 0, nb_subtrack = 1):
        
        score = []
        list_note = [(p, t1, t2) for (t, c, p, v, t1, t2) in self.__notelist__ if c==num_channel]
        list_note.sort (key=lambda note: note[1])
        #for note_idx in range(len(list_note)): # DEBUG [:40]
        note_idx = offset_subtrack
        while note_idx < len(list_note):
            note = list_note[note_idx]
            print "note = %s => %d %s %s"%(note,note[0], self.instant(note[1],fraction_quantification), self.instant(note[2],fraction_quantification))
            score.append (Note(note[0], self.instant(note[1],fraction_quantification), self.instant(note[2],fraction_quantification)))
            note_idx = note_idx + nb_subtrack
        return (score)
        

    def oldgetNotes(self, num_channel, fraction_quantification):
        events= [ [at,ev] for [at,ev] in self.__list_event__ if (ev.type == "NOTE_OFF" or ev.type == "NOTE_ON") and (ev.channel == num_channel)]

        def instant_min (instant_off, instant_on):
            res = instant_off
            if instant_off[0] > instant_on[0]:
                res = instant_on
            elif instant_off[0] < instant_on[0]:
                res = instant_off
            else:
                if instant_off[1][0] > instant_on[1][0]:
                    res = instant_on
            return res

        pas_2_quantification = self.ticksPerQuarterNote/fraction_quantification
        event_counter=0
        score = []
        while event_counter < len(events): # DEBUG   range ( 60): 
            note = events[event_counter]
            minstant_courant = self.instant(note[0],fraction_quantification)

##            print "%d %s\t %d %d %s %d \t%d"%(note[0], note[1].type, note[1].pitch, note[1].velocity
##                               ,minstant_courant
##                               , minstant_courant[0]*self.ticksPerQuarterNote + minstant_courant[1][0]* pas_2_quantification
##                               , note[0]-(minstant_courant[0]*self.ticksPerQuarterNote + minstant_courant[1][0]* pas_2_quantification))
            if note[1].type == "NOTE_ON" and note[1].velocity != 0:
                    
                #recherche du note off correspondant
                idx_off = event_counter +1
                ##try :
                while idx_off < len(events) and (events[idx_off][1].type != "NOTE_OFF" or events[idx_off][1].pitch != note[1].pitch) and (events[idx_off][1].type != "NOTE_ON" or events[idx_off][1].pitch != note[1].pitch or events[idx_off][1].velocity != 0):
                    idx_off = idx_off+1
                #instant_off = computeInstant(events[idx_off], pas_2_quantification, m.ticksPerQuarterNote, Time_Den) + 0.25
                if (idx_off < len(events)) : minstant_off = self.instant(events[idx_off][0]+self.ticksPerQuarterNote/(fraction_quantification), fraction_quantification) #+m.ticksPerQuarterNote/fraction_quantification
                else :
                    print "unfound note off"
                    minstant_off = self.instant(events[-1][0], fraction_quantification)  ## HACK Pourquoi n'a-t-on pas trouve de note off
                    #print events[-1]
                    idx_off = event_counter
                ##except IndexError:
                ##    print "EXCEPT: %d : %s"%(idx_off, events[idx_off])
                ##    raise IndexError
                
                #recherche d'un prochain note on de l'instrument
                idx_on = event_counter +1
                while idx_on < len(events) and (events[idx_on][1].type != "NOTE_ON" or events[idx_on][1].velocity != 0):
                    idx_on = idx_on+1
                if (idx_on < len(events)) : minstant_on = self.instant(events[idx_on][0], fraction_quantification)
                else: minstant_on = minstant_off

                # si l'instant de debut de la prochaine note est avant la fin de la note courante,
                if (idx_on < idx_off):
                    print "overlapping note"
                    score.append(Note(note[1].pitch, minstant_courant, minstant_off))
                    event_counter = idx_off ### HACK !! fix this smartly 
                else:
                    #enregistrement de la note
                    score.append(Note(note[1].pitch, minstant_courant, instant_min (minstant_off, minstant_on)))
                    #print "%d %s %s"%(note[1].pitch, minstant_courant, instant_min (minstant_off, minstant_on))

            event_counter = event_counter+1
        return (score)

if __name__ == "__main__":
    print "coucou"

##    notelist = [ ]
##    def register_note(t, c, p, v, t1, t2):
##        notelist.append((t, c, p, v, t1, t2))
##    wwmidi.register_note = register_note

    m = MidiAnalyser()
        
    m.open('onestop.mid')
    #m.open('Frank & Orchestra Sinatra - Autumn Leaves.mid')
    m.read()
    m.close()
    nbTracks=m.getNbTracks()
    print "%s \n\t %s ticks per quarter note\n\t %s ticks Per Second\n\t %d tracks : "%(m.file, m.ticksPerQuarterNote, m.ticksPerSecond, nbTracks)
    list_event = []
    for num_track in range(nbTracks):
        abs_time = 0
        nbChannel=m.getNbChannels(num_track) 
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

        print "%04d: ch %02d -> %s (%s) %d noton %d notoff" %(at, ev.channel,Cat_Instru [ev.data / 8], Instru[ev.data]
                                                              , len([ [tat,tev] for [tat,tev] in list_event if (tev.type == "NOTE_ON") and (tev.channel == ev.channel)])
                                                              , len([ [tat,tev] for [tat,tev] in list_event if (tev.type == "NOTE_OFF") and (tev.channel == ev.channel)]))

    aLine1 = m.oldgetNotes(1, 4) #channel 2, fraction_quantification = 4 (=> 1/4 de temps)
    aLine2 = m.getNotes(1, 4) #[(t, c, p, v, t1, t2) for (t, c, p, v, t1, t2) in m.__notelist__ if c==2]
    print aLine1 [:30]
    print aLine2 [:30]
