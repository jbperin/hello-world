% LilyBin

global = {
  \key aes \major
  \time 4/4
  \tempo 4 = 104
}
\header {
	title = "One For Daddy-O"
	composer = "Nat Adderley"
	piece = "Basse"
	tagline = "DJFR"  % removed
}
notes_theme = {
r4 bes, des8. f16 g4 |
bes r4 r2|
r4  bes, des8. f16 g4 |
bes aes f8 ees r des |

 r4 bes, des8. f16 g4 |
 \break
bes r4 r2|
r4  bes, des8. f16 g4 |
bes aes f8 ees r des |
 r4 bes, des8. f16 g4 |


 \break
}
notes_basse = {


 \break
}

grille_accord = \chordmode {

r1 bes1:m7 c2:m7.5- f:7 bes1:m7 bes1:m7
ees:m7 ees:7 bes1:m7 bes1:m7
bes:m7 aes:7 ges:maj7 f:7
c1:m7.5- f:7+9 bes1:m7 c2:m7.5- f:7 

}

\score{
  <<
    \set Score.skipBars = ##t
    \set Score.markFormatter = #format-mark-box-alphabet

    \new ChordNames {
      \set chordChanges = ##t
      \grille_accord

    }

    \new Voice = "theme" {
		\global 
		\clef treble
		\set Staff.midiInstrument = #"tenor sax" 

		\transpose c c'' \notes_theme 
		%\absolute \notes_theme 

    }
    \new Voice = "one" {
		\global 
		\clef bass
		\set Staff.midiInstrument = #"electric bass (finger)" 

		%\transpose c' c \notes_basse 
		\absolute \notes_basse 

    }
    

      
  >>
	\layout{
		indent = 0.0\cm
	}
	\midi{}
}
