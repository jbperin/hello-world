% LilyBin

global = {
  \key c \major
  \time 4/4
  \tempo 4 = 110
}
\header {
	title = "Ode To Billy Joe"
	composer = "Bobbie Gentry"
	piece = "Basse"
	tagline = "DJFR"  % removed
}
notes_theme = {
 g'4 	 g'8	 f'8 	 g'4 	 g'8	 f'8 	|
 g'4 	 g'8	 f'8 	 g'8	 a'8~ 	 a'8 	 f'8~ 	|
 f'8 	 d'8~ 	 d'8 	 r8 	 r2 |
 r2 r8 	 d'8 	 f'8	 g'8 	|
 g'4 	 g'8	 f'8 	 g'4 	 g'8	 f'8 	|
 g'4 	 g'8	 f'8 	 g'8	 a'8~ 	 a'8 	 f'8~ 	|
 f'8 	 d'8~ 	 d'8 	 r8 	 r2 |
 r2 r8 	 g'8 	 bes'8	 c''8 	|
 c''4 	 c''8	 bes'8 	 c''4 	 c''8	 bes'8 	|
 c''4 	 c''8	 bes'8 	 c''8	 d''8~ 	 d''8 	 bes'8~ 	|
 bes'8 	 g'8~ 	 g'4~ 	 g'8 	 r8 	 r4 |
 r2 r8 	 d'8 	 f'8	 g'8 	|
 g'4 	 g'8	 f'8 	 g'4 	 g'8	 f'8 	|
 g'4 	 g'8	 f'8 	 g'8	 a'8~ 	 a'8 	 f'8~ 	|
 f'8 	 d'8~ 	 d'8 	 r8 	 r2 |
 r2 r8 	 g'8 	 bes'8	 c''8 	|
 c''4 	 c''8	 bes'8 	 c''4 	 c''8	 bes'8 	|
 c''4 	 c''8	 bes'8 	 c''8	 d''8~ 	 d''8 	 bes'8~ 	|
 bes'8 	 g'8~ 	 g'4~ 	 g'8 	 r8 	 r4 |
 r2 r8 	 d'8 	 f'8	 d'8 	|
 a'8	 g'8 	 g'8	 f'8 	 g'8	 f'8 	 d'8	 bes8 	|
 c'8	 bes8 	 c'8	 bes8 	 c'8	 d'8~ 	 d'8 	 bes8~ 	|
 bes8 	 g8~ 	 g4~ 	 g2

}
notes_basse = {

g2.~ 	 g16 	 r16	 d16	 r16 	|
 g2.~ 	 g16 	 r16	 d16	 r16 	|
 g2.~ 	 g16 	 r16	 d16	 r16 	|
 g2.~ 	 g16 	 r16	 d16	 r16 	|
 g2.~ 	 g16 	 r16	 d16	 r16 	|
 g2.~ 	 g16 	 r16	 d16	 r16 	|
 g2.~ 	 g16 	 r16	 d16	 r16 	|
 g2.~ 	 g16 	 r16	 d8 	|
 c2.~ 	 c16 	 r16	 g,16	 r16 	|
 c2.~ 	 c16 	 r16	 g,16	 r16 	|
 c2.~ 	 c16 	 r16	 g,16	 r16 	|
 c4~ 	 c16 	 r16	 c8 	 c4~ 	 c8 	 c8 	|
 g2.~ 	 g16 	 r16	 d16	 r16 	|
 g2.~ 	 g16 	 r16	 d16	 r16 	|
 g2.~ 	 g16 	 r16	 d16	 r16 	|
 g,2.~ 	 g,16 	 r16	 g,16	 r16 	|
 c2.~ 	 c16 	 r16	 g,16	 r16 	|
 c2.~ 	 c16 	 r16	 g,16	 r16 	|
 c2.~ 	 c16 	 r16	 g,16	 r16 	|
 c4~ 	 c16 	 r16	 c8 	 c4~ 	 c8 	 c8 	|
 g,2.~ 	 g,16 	 r16	 g,16	 r16 	|
 f,2.~ 	 f,16 	 r16	 f,8 	|
 g2.~ 	 g16 	 r16	 d16	 r16 	|
}

grille_accord = \chordmode {

  g1:7 g:7 g:7 g:7
  g1:7 g:7 g:7 g:7
  c1:7 c:7 c:7 c:7
  g1:7 g:7 g:7 g:7
  c1:7 c:7 c:7 c:7
  g1:7 f:7 g:7 g:7

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

		%\transpose c c' \notes_theme
		\absolute \notes_theme

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
