% LilyBin

global = {
  \key bes \major
  \time 4/4
  \tempo 4 = 120
}
\header {
	title = "Love For Sale"
	composer = "Cole Porter"
	piece = "Basse"
	tagline = "DJFR"  % removed
}

notes_basse = {
    ees' des c bes | aes ges f ees | des f aes g | f aes bes f |
	\break
    ees des c bes | aes c ees d | des f fis g | aes g f ees |
	\break
    bes d f d | bes d f d | ees ges bes ges | ees ges bes ges |
	\break
    g des g, des' | c ees f g | fis a b fis | f aes bes f |
	\break
}

grille_accord = \chordmode {

  ees1:m7 aes:7 des:maj7 f2:m7 bes:7
  ees1:m7 aes:7 des:maj7 des:maj7
  bes:7 bes:7 ees:m7 ees:m7
  g:dim c:7.9- fis2:m7 b:7 f:dim7 bes:7
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

		%\transpose c' c \notes_basse
		\relative c \notes_basse

    }


  >>
	\layout{
		indent = 0.0\cm
	}
	\midi{}
}
