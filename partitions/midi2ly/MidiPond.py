import MidiAnalyser

def MidiNumber2Note(number):
    #notes_txt=["c", "cis", "d", "ees", "e" , "f", "fis", "g", "gis", "a", "bes", "b"]
    notes_txt=["c,,", "cis,,", "d,,", "ees,,", "e,," , "f,,", "fis,,", "g,,", "gis,,", "a,,", "bes,,", "b,,", "c,", "cis,", "d,", "ees,", "e," , "f,", "fis,", "g,", "gis,", "a,", "bes,", "b,", "c", "cis", "d", "ees", "e" , "f", "fis", "g", "gis", "a", "bes", "b", "c'", "cis'", "d'", "ees'", "e'" , "f'", "fis'", "g'", "gis'", "a'", "bes'", "b'", "c''", "cis''", "d''", "ees''", "e''" , "f''", "fis''", "g''", "gis''", "a''", "bes''", "b''"]
    #print number
    #print "%d %s %d"%(number, notes_txt[number-48+12], number/12)
    #return ((notes_txt[number-24+12], number/12)) # For Basse
    return ((notes_txt[number-24], number/12)) # For Theme


def restUntil (midi_analyser, instant):
    res = ""
    [num_mesure, num_temps, [fn, fd]] = midi_analyser.measure(instant)
    if num_mesure != 1:
        res += " r1*%d |\n"%(num_mesure-1)
    ## insere des tps pleins si besoin
    # si
    r = (num_temps-1)
    #if fdn != 0: r-=1 # on a deja traite la fin du temps precedent donc on ne compte pas le tps precedent
    if r!=0:
        if r == 1 or r == 2 or r == 4:
            res += " r%d \t"%(midi_analyser.getTimeSignature(instant)[1]/r)
        elif r == 3 or r == 5:
            res += " r%d. \t"%(midi_analyser.getTimeSignature(instant)[1]/(r-1))
    ## rejoindre la fraction d'arrivee
    if fn!=0:
        if fn%2 != 0:
            res += " r%d \t"%(fd*midi_analyser.getTimeSignature(instant)[1])
            if fn-1 != 0:
                res += " r%d \t"%((fd*midi_analyser.getTimeSignature(instant)[1])/(fn-1))
        else:
            res += " r%d \t"%((fd*midi_analyser.getTimeSignature(instant)[1])/(fn))
    return res

def restFromTo (midi_analyser, instantFrom, instantTo):
    res = ""
    [td, [fdn, fdd]] = instantFrom
    [tf, [ffn, ffd]] = instantTo

    [num_mesure_d, num_temps_d, fraction_d] = midi_analyser.measure(instantFrom)
    [num_mesure_f, num_temps_f, fraction_f] = midi_analyser.measure(instantTo)
    #res = "From :%s %s, To: %s %s\n"%([td, [fdn, fdd]], [num_mesure_d, num_temps_d, fraction_d], [tf, [ffn, ffd]], [num_mesure_f, num_temps_f, fraction_f])

    # si le debut et la fin sont dans le meme temps
    if td == tf:
        #rejoindre
        reste = (fdd*midi_analyser.getTimeSignature(instantFrom)[1]) % (ffn-fdn)
        if reste == 0:
            res += " r%d\t"%((fdd*midi_analyser.getTimeSignature(instantFrom)[1]) / (ffn-fdn))
        else:
            if fdn%2 != 0:
                res += " r%d\t"%((fdd*midi_analyser.getTimeSignature(instantFrom)[1]) / reste )
                res += " r%d\t"%((fdd*midi_analyser.getTimeSignature(instantFrom)[1]) / (ffn-fdn-reste))
            else:
                res += " r%d\t"%((fdd*midi_analyser.getTimeSignature(instantFrom)[1]) / (ffn-fdn-reste))
                res += " r%d\t"%((fdd*midi_analyser.getTimeSignature(instantFrom)[1]) / reste )

    # si le debut et la fin ne sont pas dans le meme temps
    else:
        ## finir le temps si besoin
        # si on ne demarre pas sur un temps exactement
        if fdn != 0:
            #fdd*midi_analyser.getTimeSignature(instantFrom)[1])
            if (fdd-fdn) % 2 != 0:
                res += " r%d \t"%(fdd*midi_analyser.getTimeSignature(instantFrom)[1])
                if fdd-fdn-1 != 0:
                    res += " r%d \t"%((fdd*midi_analyser.getTimeSignature(instantFrom)[1])/(fdd-fdn-1))
            else:
                res += " r%d \t"%((fdd*midi_analyser.getTimeSignature(instantFrom)[1])/(fdd-fdn))
            #res += " r%d \t"%(fdd-fdn)
        # si le debut et la fin sont dans la meme mesure
        if num_mesure_d == num_mesure_f:

            ## insere des tps pleins si besoin
            # si
            r = (tf - td)
            if fdn != 0: r-=1 # on a deja traite la fin du temps precedent donc on ne compte pas le tps precedent
            if r!=0:
                if r == 1 or r == 2 or r == 4:
                    res += " r%d \t"%(midi_analyser.getTimeSignature(instantFrom)[1]/r)
                elif r == 3 or r == 5:
                    res += " r%d. \t"%(midi_analyser.getTimeSignature(instantFrom)[1]/(r-1))
            ## rejoindre la fraction d'arrivee
            if ffn!=0:
                if ffn%2 != 0:
                    res += " r%d \t"%(fdd*midi_analyser.getTimeSignature(instantFrom)[1])
                    if ffn-1 != 0:
                        res += " r%d \t"%((fdd*midi_analyser.getTimeSignature(instantFrom)[1])/(ffn-1))
                else:
                    res += " r%d \t"%((fdd*midi_analyser.getTimeSignature(instantFrom)[1])/(ffn))
        # si le debut et la fin ne sont pas dans la meme mesure
        else:
            ## finir la mesure (le temps est deja traite donc il ne reste plus qu'a inserer des temps pleins)
            r = midi_analyser.getTimeSignature(instantFrom)[1]- midi_analyser.measure ([td, [fdn, fdd]])[1]
            if fdn == 0: r+=1
            if r!=0:
                if r%2 != 0:
                    res += " r%d "%(midi_analyser.getTimeSignature(instantFrom)[1])
                    if r-1 != 0:
                        res += " r%d "%(midi_analyser.getTimeSignature(instantFrom)[1]/(r-1))
                else:
                    res += " r%d "%(midi_analyser.getTimeSignature(instantFrom)[1]/r)
            res +=  "|\n"
            ## inserer des mesures blanches si necessaire
            #print "%d %d"%(num_mesure_f , num_mesure_d)
            nb_mesure = num_mesure_f - num_mesure_d
            if num_temps_d != 1 or fraction_d != [0, 0]:  nb_mesure -= 1
            if nb_mesure != 0:
                res +=  " r1*%d"%(nb_mesure)
                res +=  "|\n"
            ## rejoindre le temps de instantTo
            if num_temps_f != 1:
                if (num_temps_f-1)%2!=0:
                    res += " r%d"%(midi_analyser.getTimeSignature(instantFrom)[1])
                    if num_temps_f-2 != 0:
                        res += " r%d"%(midi_analyser.getTimeSignature(instantFrom)[1] / (num_temps_f-1) )
                else:
                    #print "%d %d "%(midi_analyser.getTimeSignature(instantFrom)[1] , (num_temps_f-1))
                    res += " r%d"%(midi_analyser.getTimeSignature(instantFrom)[1] / (num_temps_f-1) )
            ## rejoindre la fraction de instantTo
            if ffn!=0:
                if ffn%2 != 0:
                    res += " r%d \t"%(fdd*midi_analyser.getTimeSignature(instantFrom)[1])
                    if ffn-1 != 0:
                        res += " r%d \t"%((fdd*midi_analyser.getTimeSignature(instantFrom)[1])/(ffn-1))
                else:
                    res += " r%d \t"%((fdd*midi_analyser.getTimeSignature(instantFrom)[1])/(ffn))
    return res

def noteFromTo (midi_analyser, note_number, instantFrom, instantTo):
    res = ""
    [td, [fdn, fdd]] = instantFrom
    [tf, [ffn, ffd]] = instantTo
    note_txt = MidiNumber2Note(note_number)[0]
    #print "%d => %s"%(note_number, note_txt)
    [num_mesure_d, num_temps_d, fraction_d] = midi_analyser.measure(instantFrom)
    [num_mesure_f, num_temps_f, fraction_f] = midi_analyser.measure(instantTo)
    #print "%s From :%s %s, To: %s %s\n"%(note_txt, [td, [fdn, fdd]], [num_mesure_d, num_temps_d, fraction_d], [tf, [ffn, ffd]], [num_mesure_f, num_temps_f, fraction_f])

    # si le debut et la fin sont dans le meme temps
    if td == tf:
        #rejoindre
        try :
            reste = (fdd*midi_analyser.getTimeSignature(instantFrom)[1]) % (ffn-fdn)
            if reste == 0:
                res += " %s%d~\t"%(note_txt,(fdd*midi_analyser.getTimeSignature(instantFrom)[1]) / (ffn-fdn))
            else:
                if fdn%2 != 0:
                    res += " %s%d~\t"%(note_txt, (fdd*midi_analyser.getTimeSignature(instantFrom)[1]) / reste )
                    res += " %s%d~\t"%(note_txt, (fdd*midi_analyser.getTimeSignature(instantFrom)[1]) / (ffn-fdn-reste))
                else:
                    res += " %s%d~\t"%(note_txt, (fdd*midi_analyser.getTimeSignature(instantFrom)[1]) / (ffn-fdn-reste))
                    res += " %s%d~\t"%(note_txt, (fdd*midi_analyser.getTimeSignature(instantFrom)[1]) / reste )
        except ZeroDivisionError:
            #print e
            print "Error when processing note %s to %s"%(instantFrom, instantTo)

    # si le debut et la fin ne sont pas dans le meme temps
    else:
        ## finir le temps si besoin
        # si ne demarre pas sur un temps exactement
        if fdn != 0:
            #fdd*midi_analyser.getTimeSignature(instantFrom)[1])
            if (fdd-fdn) % 2 != 0:
                res += " %s%d~ \t"%(note_txt, fdd*midi_analyser.getTimeSignature(instantFrom)[1])
                if fdd-fdn-1 != 0:
                    res += " %s%d~ \t"%(note_txt, (fdd*midi_analyser.getTimeSignature(instantFrom)[1])/(fdd-fdn-1))
            else:
                res += " %s%d~ \t"%(note_txt,(fdd*midi_analyser.getTimeSignature(instantFrom)[1])/(fdd-fdn))
            #res += " r%d \t"%(fdd-fdn)
        # si le debut et la fin sont dans la meme mesure
        if num_mesure_d == num_mesure_f:

            ## insere des tps pleins si besoin
            # si
            r = (tf - td)
            if fdn != 0: r-=1 # on a deja traite la fin du temps precedent donc on ne compte pas le tps precedent
            if r!=0:
                if r == 1 or r == 2 or r == 4:
                    res += " %s%d~ \t"%(note_txt, midi_analyser.getTimeSignature(instantFrom)[1]/r)
                elif r == 3 or r == 5:
                    res += " %s%d.~ \t"%(note_txt, midi_analyser.getTimeSignature(instantFrom)[1]/(r-1))
            ## rejoindre la fraction d'arrivee
            if ffn!=0:
                if ffn%2 != 0:
                    res += " %s%d~ \t"%(note_txt, fdd*midi_analyser.getTimeSignature(instantFrom)[1])
                    if ffn-1 != 0:
                        res += " %s%d~ \t"%(note_txt, (fdd*midi_analyser.getTimeSignature(instantFrom)[1])/(ffn-1))
                else:
                    res += " %s%d~ \t"%(note_txt, (fdd*midi_analyser.getTimeSignature(instantFrom)[1])/(ffn))
        # si le debut et la fin ne sont pas dans la meme mesure
        else:
            ## finir la mesure (le temps est deja traite donc il ne reste plus qu'a inserer des temps pleins)
            r = midi_analyser.getTimeSignature(instantFrom)[1]- midi_analyser.measure ([td, [fdn, fdd]])[1]
            if fdn == 0: r+=1
            if r!=0:
                if r%2 !=0:
                    res += " %s4~"%(note_txt)
                    if r-1 != 0:
                        res += " %s%d~"%(note_txt, midi_analyser.getTimeSignature(instantFrom)[1]/(r-1))
                else:
                    res += " %s%d~"%(note_txt, midi_analyser.getTimeSignature(instantFrom)[1] / r )
            res +=  "|\n"
            ## inserer des mesures blanches si necessaire
            #print "%d %d"%(num_mesure_f , num_mesure_d)
            nb_mesure = num_mesure_f - num_mesure_d
            if num_temps_d != 1 or fraction_d != [0, 0]:  nb_mesure -= 1
            if nb_mesure != 0:
                res +=  "%s1*%d"%(note_txt, nb_mesure)
                res +=  "|\n"
            ## rejoindre le temps de instantTo
            if num_temps_f != 1:
                if (num_temps_f-1)%2!=0:
                    res += " %s%d~"%(note_txt, midi_analyser.getTimeSignature(instantFrom)[1])
                    if num_temps_f-2 != 0:
                        res += " %s%d~"%(note_txt, midi_analyser.getTimeSignature(instantFrom)[1] / (num_temps_f-1) )
                else:
                    #print "%d %d "%(midi_analyser.getTimeSignature(instantFrom)[1] , (num_temps_f-1))
                    res += " %s%d~"%(note_txt, midi_analyser.getTimeSignature(instantFrom)[1] / (num_temps_f-1) )
            ## rejoindre la fraction de instantTo
            if ffn!=0:
                if ffn%2 != 0:
                    res += " %s%d~ \t"%(note_txt, fdd*midi_analyser.getTimeSignature(instantFrom)[1])
                    if ffn-1 != 0:
                        res += " %s%d~ \t"%(note_txt, (fdd*midi_analyser.getTimeSignature(instantFrom)[1])/(ffn-1))
                else:
                    res += " %s%d~ \t"%(note_txt, (fdd*midi_analyser.getTimeSignature(instantFrom)[1])/(ffn))
        ## Supprimer le dernier signe de liaison
    idx = res.rfind("~")
    res = "%s%s"%(res[0:idx], res[idx+1:])
    return res

def getLilyString (midi_analyser , num_channel, fraction_quantification, offset_subtrack = 0, nb_subtrack = 1):
    aLine = midi_analyser.getNotes(num_channel, fraction_quantification, offset_subtrack, nb_subtrack)
    #
    ##notes_txt=["c", "cis", "d", "ees", "e" , "f", "fis", "g", "gis", "a", "bes", "b"]
    res = ""
    for num_note in range(len(aLine)):#DEBUG range (20):
         note = aLine [num_note]
         if num_note == 0:
             res += restUntil (midi_analyser, note.start)
             res += noteFromTo (midi_analyser, note.midinumber , note.start, note.stop)
         else:
             prev_note = aLine [num_note-1]
             if note.start != prev_note.stop:
                 res += restFromTo (midi_analyser, prev_note.stop, note.start)
             res += noteFromTo (midi_analyser, note.midinumber, note.start, note.stop)
    return  res


if __name__ == "__main__":
    print "coucou"
    Filename = 'IShotTheSheriff_melody.mid'

#    main(sys.argv)
    m = MidiAnalyser.MidiAnalyser()

    m.open(Filename )
    m.read()
    m.close()


    # Test a l'interieur du meme temps
    print restFromTo (m, [0, [0, 4]], [0, [3, 4]])
    print restFromTo (m, [0, [1, 4]], [0, [3, 4]])

    # Test a cheval sur un ou plusieurs temps de la meme mesure
    print restFromTo (m, [0, [3, 4]], [1, [0, 4]])
    print restFromTo (m, [0, [2, 4]], [1, [2, 4]])
    print restFromTo (m, [0, [1, 4]], [2, [1, 4]])
    print restFromTo (m, [0, [2, 4]], [3, [1, 4]])

    # Test changement de mesure
    print restFromTo (m, [0, [1, 4]], [4, [1, 4]])
    print restFromTo (m, [0, [2, 4]], [5, [1, 4]])
    print restFromTo (m, [0, [3, 4]], [10, [2, 4]])

    print noteFromTo (m, 12, [0, [3, 4]], [10, [2, 4]])

