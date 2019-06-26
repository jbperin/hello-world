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

notes_theme = {

r4 	 f'8	 f'8 	 gis'8	 bes'16	 r16 	 r8 	 c''8~ 	|
 c''4 c''8	 bes'8 	 c''4 	 ees''16	 r16 	 r8 	|
 r4 f'8	 f'8 	 gis'8	 bes'16	 r16 	 r8 	 f'8~ 	|
 f'4 f'8	 ees'8 	 f'2|
 r4 	 f'8	 f'8 	 gis'8	 bes'16	 r16 	 r8 	 c''8~ 	|
 c''4 c''8	 bes'8 	 c''4 	 ees''16	 r16 	 r8 	|
 r4 c''8	 c''8 	 ees''8	 c''16	 r16 	 r8 	 e''8~ 	|
 e''4 c''8	 bes'8 	 c''2|
 r4 	 f''8~	 f''16	 r16 	 b'16	 bes'8	 gis'16 	 bes'8	 gis'8~ 	|
 gis'4 gis'8	 f'8 	 gis'4 	 bes'16	 r16 	 r8 	|
 r4 f'8	 f'8 	 gis'8	 bes'16	 r16 	 r8 	 f'8~ 	|
 f'4 f'8	 ees'8 	 f'8	 ees'8 	 f'16	 r16 	 r8 	|
 b'8	 c''8~ 	 c''4 	 r4 	 f'4|
 bes'8	 b'8~ 	 b'4 	 r8	 f'8 	 gis'8	 b'16	 r16 	|
 r8 	 bes'16	 r16 	 r8 	 gis'8 	 bes'8~	 bes'16	 gis'16 	 f'16	 ees'16	 f'8 	|
f'1*1|

}
notes_basse = {


	%f4 g aes bes | c des ees g | f ees des bes | c bes aes g |
	%	\break
    %    f aes c f
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

		\absolute \notes_basse

    }


  >>
	\layout{
		indent = 0.0\cm
	}
	\midi{}
}
