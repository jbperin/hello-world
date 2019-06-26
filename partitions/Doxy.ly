% LilyBin

global = {
  \key bes \major
  \time 4/4
  \tempo 4 = 120
}

\header {
	title = "Doxy"
	composer = "Sony Rollins"
	piece = "Basse"
	tagline = "DJFR"  % removed
}

notes_theme = {
bes'8	 d''8 	 bes'8	 f'8 	 bes'4 	 r8	 f'8 	|
bes'8	 f'8 	 bes'8	 cis''8 	 r8	 g'8~ 	 g'16~ 	 g'8 	 r-16	 f'8 	|
e'8	 g'8 	 bes'8	 cis''8 	 c''16	 cis''8	 c''16 	 g'8	 bes'8 	|
r2. 	 r8 	 f'8 	|
bes'8	 d''8 	 bes'8	 e'8 	 bes'4 	 r8	 e'8 	|
bes'8	 e'8 	 bes'8	 cis''8 	 r8	 g'8~ 	 g'16~ 	 g'8 	 r-16	 f'8 	|
e'8	 g'8 	 bes'8	 cis''8 	 c''16	 cis''8	 c''16 	 g'8	 a'8 	|
r1 |
g''4 	 r8	 f''8 	 r4 	 cis''4~|
cis''4~ cis''8 	 g'8~ 	 g'16~ 	 g'8 	 r-16	 bes'8~ 	 bes'16~ 	 bes'8 	 r-16	 g'8 	|
cis''4 	 cis''8	 cis''8 	 g'4 	 c''4|
r2. 	 r8 	 f'8 	|
bes'8	 d''8 	 bes'8	 f'8 	 bes'4 	 r8	 e'8 	|
bes'8	 e'8 	 bes'8	 cis''8 	 r8	 g'8~ 	 g'16~ 	 g'8 	 r-16	 f'8 	|
e'8	 g'8 	 bes'8	 cis''8 	 c''16	 cis''8	 c''16 	 g'8	 bes'8 	|

 \break
}

notes_basse = {

 \break
}

grille_accord = \chordmode {

bes2:7 aes:7 g1:7 c2:7 f:7 bes1:7
bes2:7 aes:7 g1:7 c1:7 f:7
bes1:7 bes1:7 ees1:7 e1:m7.5-
bes2:7 aes2:7 g1:7  c2:7 f2:7 bes:7
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
