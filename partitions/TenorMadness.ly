% LilyBin

global = {
  \key bes \major
  \time 4/4
  \tempo 4 = 120
}
\header {
	title = "Tenor Madness"
	composer = "Sonny Rollins"
	piece = "Basse"
	tagline = "DJFR"  % removed
}

notes_basse = {

	f2 a,2 | bes,4. d8 ees4 e | f2 c2 | f,4 c ees f |
	\break
	bes,2 f2 | bes4. d8 ees4 e | f2 c2 | f2 f4 fis | 
	\break
	g2 d4 des4 | c2 g,4 ges, | f,8 a,4. bes,4 b, |c d ees e |
	\break
	
    f4 ees d c | bes, d ees e | f a, bes, b, | c d ees f |
	\break
	bes, d f g | aes g f d | f c f ees | d c a, aes, | 
	\break
	g, a, bes, b, | c d ees e | f a, bes, b, | c d ees e |
	\break
}

grille_accord = \chordmode {

  bes1:7 ees:7 bes:7 bes:3 
  ees:7 ees:7  bes:7 bes:7 
  c:m7 f:7 bes:7 f:7
  
  bes1:7 ees:7 bes:7 bes:3 
  ees:7 ees:7  bes:7 bes:7
  c:m7 f:7 bes:7 f:7
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

		\transpose f bes \notes_basse 
		%\relative bes \notes_basse 

    }
    
      
  >>
	\layout{
		indent = 0.0\cm
	}
	\midi{}
}