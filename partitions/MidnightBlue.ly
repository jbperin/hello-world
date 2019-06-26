% LilyBin

global = {
  \key ees \major
  \time 4/4
  \tempo 4 = 120
}

\header {
	title = "Midnight Blue"
	composer = "Kenny Burrell"
	piece = "Basse"
	tagline = "DJFR"  % removed
}

notes_theme = {
f'4 	 gis'16	 r8	 f'16 	 bes'16	 b'8	 bes'16 	 f'16	 r8	 ees'16 	|
f'4 	 r4 	 r8 	 f'8 	 gis'16	 r8	 c''16~ 	|
c''4 ees''16	 r8	 f''16 	 bes'16	 b'8	 bes'16 	 f'16	 r8	 ees'16 	|
f'8	 r8 	 r4  r2 |
f'4 	 gis'16	 r8	 f'16 	 bes'16	 b'8	 bes'16 	 f'16	 r8	 ees'16 	|
f'4 	 r4 	 r8 	 f'8 	 gis'16	 r8	 c''16~ 	|
c''4 ees''16	 r8	 f''16 	 bes'16	 b'8	 bes'16 	 f'16	 r8	 ees'16 	|
f'8	 r8 	 r4 	 r8 	 f'8 	 gis'16	 r8	 ees''16~ 	|
ees''2~ ees''8 	 cis''8 	 ees''16	 r8	 cis''16~ 	|
cis''2~ cis''8 	 c''8 	 cis''16	 r8	 c''16~ 	|
c''4~ c''1 f'16	 r8	 gis'16~ 	|
gis'4 r4 	 r8 	 f'8 	 gis'16	 r8	 c''16~ 	|
c''2~ c''8 	 bes'8 	 c''16	 r8	 bes'16~ 	|
bes'2~ bes'8 	 gis'8 	 bes'16	 r8	 gis'16~ 	|
gis'4 f'16	 r8	 ees'16 	 c'16	 r8	 ees'16 	 f'8	 f'8 	|



 \break
}

notes_basse = {

 \break
}

grille_accord = \chordmode {

f2:m7 g:m7 aes:maj7 g:m7
f:m7 g:m7 aes:maj7 g:m7
f:m7 g:m7 aes:maj7 g:m7
f:m7 g:m7 aes:maj7 g:m7

g1:m7.5- c:7 f:m7 bes:7
bes:m7 aes:m7 g2:m7 c:7 f1:m7


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

		%\transpose c c'' \notes_theme
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
