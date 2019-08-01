% LilyBin

\header {
  title = "Titre"
  composer = "Composer"
  piece = "Basse"
  tagline = "Jean-Baptiste PERIN"  % removed
}

global = {
  \key f \major
  \time 4/4
  \tempo 4 = 100
}

grille_accord = \chordmode {

  r1 a:m a:m g f


}

notes_chant = {

  %a,8. e16~ e16 a8 b16~ b2 |
  %aes,8. ees16~ ees16 aes8 bes16~ bes2 |
  %a,8. e16~ e16 a8 b16~ b16 b32 cis'32 b8~ b4 |
  r2. a4
  \mark \default
  % =====
  \repeat volta 2 {
    a2 f4 a4 |
    a2 f4 a4 |
    g2 c4 c4 |

    \break
  }

  \alternative {
    {f2 r4 a4 |}
    {f2 r4 d4 |}

  }
  \mark \default
  a2 f4 a4 |
  a2 f4 a4 |
  g2 c4 c4 |
  f2 r4 f4 |
  \break

}
paroles_chant = \lyricmode {
  Ve -- nez, mes en -- fants, ac -- cou -- rez, ve -- nez tous!

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

      \unfold \transpose c c' \notes_chant

    }\addlyrics \paroles_chant

  >>
  \layout {
    indent = 0.0\cm
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
