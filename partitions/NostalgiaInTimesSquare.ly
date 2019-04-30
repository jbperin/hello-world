% LilyBin

global = {
  \key f \major
  \time 4/4
  \tempo 4 = 120
}
\header {
	title = "Nostalgia In Times Square"
	composer = "Charles Mingus"
	piece = "Basse"
	tagline = "DJFR"  % removed
}

notes_basse = {
	r1 
	f4 e ees d | c4 b bes a | f4 c' ees bes | f'4 d ees c | 
	\break
	aes4 c des f | aes f des ees | f4 c ees bes | f4 c' ees c |
	\break
	d4 a4 g4 b4 | c4 g f a | bes d ees bes | f c' f ees |
	\break
	
}

grille_accord = \chordmode {
  r1 
  f2:7 ees:7 f2:7 ees:7 f2:7 ees:7 f2:7 ees:7 
  aes:m7 des:7 aes:m7 des:7 f2:7 ees:7 f2:7 ees:7 
  d:m7 g:7 c:m7 f:7 bes:m7 ees:7 f1
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

		%\transpose f bes \notes_basse 
		\relative \notes_basse 

    }
    
      
  >>
	\layout{
		indent = 0.0\cm
	}
	\midi{}
}