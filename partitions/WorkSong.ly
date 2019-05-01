% LilyBin

global = {
  \key bes \major
  \time 4/4
  \tempo 4 = 120
}
\header {
	title = "Work Song"
	composer = "Nat Adderly"
	piece = "Basse"
	tagline = "DJFR"  % removed
}

notes_basse = {
		f g aes bes | c des ees g | f ees des bes | c bes aes g |
		\break
        f aes c f 
}


grille_accord = \chordmode {

  f1:m7 f:m7 f:m7 f:m7  
  f:m7 f:m7 c:7  c:7 
  f:m7 f:m7 f:m7 f:m7  
  f:m7 bes:7 des2:7  c2:7 f1:m7
}

\score{
  <<
    \set Score.skipBars = ##t
    \set Score.markFormatter = #format-mark-box-alphabet

    \new ChordNames {
      \set chordChanges = ##t
      \grille_accord

    }

    \new Voice = "one" {
		\global 
		\clef bass
		\set Staff.midiInstrument = #"electric bass (finger)" 

		\relative \notes_basse 

    }
    
      
  >>
	\layout{
		indent = 0.0\cm
	}
	\midi{}
}


