\version "2.18.2"  % necessary for upgrading to future LilyPond versions.

\header {
  title = "English Man In New-York"
  composer = "Sting"
  piece = "Chant"
  tagline = "JiBe"  % removed
}

global = {
  \key d \major
  \time 4/4
  \tempo 4 = 102
}

grille_accord = \chordmode {

  %r1 a:m a:m g f
  e2:m a b2.:m a4
  e2:m a b2.:m a4
  e2:m a b2.:m a4
  e2:m a b2.:m a4

}

notes_chant = {

  \mark \default
  r8. 	 fis16 	 b16	 d'8	 e'16~ e'16  cis'8	 a16~ a16	 g8	 fis16~ 	|
  fis16 	 cis'8	 cis'16~ 	 cis'2 	 r4 |
  r8. 	 fis16 	 b16	 d'8	 e'16~ e'16  cis'8	 a16~ a16	 g8	 fis16~ 	|
  fis2. r4 	|
  \break
  r8. 	 fis16 	 b16	 d'8	 e'16~ e'16  cis'8	 a16~ a16	 g8	 fis16~ 	|
  fis16 	 cis'8	 cis'16~ 	 cis'16 b16 cis'8~ cis'4 	 \tuplet 3/2 { r8 b8 cis'8 } |
  d'8.	 d'16~	 d'8 	 d'8 	 cis'8.	a16~ 	 a8 	 cis'16	 (b16~) 	|
  b2. r4 	|
  \break
  r8. 	 fis16 	 b16	 d'8	 e'16~ e'16  cis'8	 a16~ a16	 g8	 fis16~ 	|
  fis16 	 cis'8	 cis'16~ 	 cis'2 	 r4 |
  r8. 	 fis16 	 b16	 d'8	 e'16~ e'16  cis'8	 a16~ a16	 g8	 fis16~ 	|
  fis2. r4 	|
  \break
  r8. 	 d'16 	 g'16	 g'8	 a'16~ a'16  g'8	 fis'16~ fis'16	 e'8	 fis'16~ 	|
  fis'2. 	\tuplet 3/2 { r8 b8 cis'8 } |
  d'8.	 d'16~	 d'8 	 d'8 	 cis'8.	a16~ 	 a8 	 cis'16	 (b16~) 	|
  b2 r4  fis'	|
  \break
  d'8	 r8	 d'8 d'16  d'16~ d'16 	 cis'16	 b8 	 r4 |
  cis'8 cis'16	 e'16~ 	e'16 e'8 d'16~ 	 d'16 	 cis'16	 b8 	 b8	 cis'8 	|
  d'8.	 d'16~ 	 d'8	 d'8 	 cis'8.	 a16~ 	 a8 	 b8~ 	|
  b2 r4  fis'	|
  \break
  d'8	 r8	 d'8 d'16  d'16~ d'16 	 cis'16	 b8 	 r4 |
  cis'8 cis'16	 e'16~ 	e'16 e'8 d'16~ 	 d'16 	 cis'16	 b8 	 b8	 cis'8 	|
  d'8.	 d'16~ 	 d'8	 d'8 	 cis'8.	 a16~ 	 a8 	 b8~ 	|
  b2 r2 |
  \break

  fis'16	 fis'16	 r16	 fis'16 	 r16	 fis'16	 r16	 a'16~ 	 a'16 	 a'16	 fis'8~ 	 fis'16 	 r8	 fis'16 	|
  e'16	 e'16	 r16	 e'16 	 r16	 e'16	 r16	 g'16~ 	 g'16 	 g'16	 e'8~ 	 e'16 	 r16 	 r8 	|
  d'16	 d'16	 r16	 d'16 	 r16	 d'16	 r16	 fis'16 	 r16	 fis'16	 r16	 d'16 	 r16	 d'16	 r16	 cis'16~ 	|
  cis'2~ cis'16 	 r16 	 r8 	 r4 |
  b16	 b16	 r16	 b16 	 r16	 b16	 r16	 d'16~ 	 d'16 	 d'16	 b8 	 r8	 r16	 b16 	|
  cis'16	 cis'16	 r16	 cis'16 	 r16	 cis'16	 r16	 e'16 	 r16	 e'16	 cis'8 	 r8	 r16	 b16 	|
  e'16	 e'16	 r16	 e'16 	 r16	 fis'16	 r16	 g'16 	 r16	 fis'16	 r16	 e'16~ 	 e'16 	 fis'16	 fis'8~ 	|
  fis'2 r2 |
  \break

}
paroles_chant = \lyricmode {
  I don't drink cof -- fee I take tea my dear
  I like my toast done on one side

  And you can hear it in my ac -- cent when I talk
  I'm an En -- glish -- man in New York

  You see me wal -- king down Fifth Av -- e -- nue
  A wal -- king cane here at my side

  I take it ev -- 'ry -- where I walk
  I'm an En -- glish -- man in New York
  Wha -- o,
  I'm an a -- li -- en I'm a le -- gal a -- li -- en
  I'm an Eng -- lish -- man in New York
  Wha -- o,
  I'm an a -- li -- en I'm a le -- gal a -- li -- en
  I'm an Eng -- lish -- man in New York


}


\score {
  <<
    \set Score.skipBars = ##t
    \set Score.markFormatter = #format-mark-box-alphabet

		\new ChordNames {
		  \set chordChanges = ##t
		  \grille_accord

		}


    \new Voice = "one" {
      \global
      \clef treble
		\set Staff.midiInstrument = #"electric bass (finger)"

      \unfold \transpose c c' \notes_chant
    }\addlyrics \paroles_chant

  >>
  \layout {
    indent = 0.0\cm
  }
  \midi {

  }

}


\score {
  <<
    \set Score.skipBars = ##t
    \set Score.markFormatter = #format-mark-box-alphabet

    \new ChordNames {
      \set chordChanges = ##t
      \grille_accord

    }


  >>
  \midi {

  }

}



\score {
  <<
    \set Score.skipBars = ##t


    \new Voice = "one" {
      \global
      \clef treble
      \set Staff.midiInstrument = #"electric bass (finger)"

      %\transpose c' c \notes_chant
      \unfoldRepeats \notes_chant

    }\addlyrics \paroles_chant

  >>
  \midi {

  }

}
