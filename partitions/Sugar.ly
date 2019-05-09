% LilyBin

global = {
  \key ees \major
  \time 4/4
  \tempo 4 = 120
}
\header {
	title = "Sugar"
	composer = "Stanley Turrentine"
	piece = "Basse"
	tagline = "DJFR"  % removed
}
notes_theme = {
 g4~ 	 g8 	 f8 	 g16	 g16	 f8 	 ees8	 f8~ 	|
 f4~ f8 	 ees8 	 f8	 ees8 	 c8	 ees8~ 	|
ees1*1|
 ees4 r8	 c16	 r16 	 ees8	 f8 	 r8	 g8~ 	|
 g4~ g8 	 f8 	 g16	 g16	 f8 	 ees8	 f8~ 	|
 f4~ f8 	 g8 	 bes8	 g8 	 f8	 g8~ 	|
g1*1|
 g4 r8	 g16	 r16 	 bes8	 c'8 	 r8	 ees'8~ 	|
 ees'4~ ees'8 	 c'8 	 ees'16	 ees'16	 c'8 	 bes8	 c'8~ 	|
 c'4~ c'8 	 bes8 	 c'16	 c'16	 bes8 	 g8	 bes8~ 	|
 bes4~ bes8 	 g8 	 bes16	 bes16	 g8 	 f8	 g8~ 	|
 g4~ g8 	 f8 	 g16	 g16	 f8 	 ees8	 f8~ 	|
 f4~ f8 	 ees8 	 f16	 f16	 ees8 	 c8	 ees8~ 	|
 ees4~ ees8 	 c8 	 ees16	 ees16	 c8 	 bes,8	 c8~ 	|
c1*1|
}
notes_basse = {
c4 d ees d | d aes g d | c  ees g ees | d aes g d |
		\break
c d ees f | g aes bes c' | d' aes d aes | g f ees d |
		\break
c d ees f | ges aes ges ees | f g f d | ees f ees c |
		\break
d c bes, aes,| g, aes, bes, aes, | aes, bes, c d | ees d c bes, |
 \break
}

grille_accord = \chordmode {

c1:m7 d2:dim g:7 c1:m7 d2:dim g:7  c1:m7 c:m7 d:dim g:7
c1:m7 ges:7 f:m7 ees:7 d:dim7 g:7 aes:7 aes:7
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
		\set Staff.midiInstrument = #"Sax Tenor" 

		\transpose c c' \notes_theme 
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
