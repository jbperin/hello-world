% LilyBin

\version "2.18.2"  % necessary for upgrading to future LilyPond versions.

\header {
  title = "Autumn Leaves"
  composer = "Joseph Cosma"
  piece = "Basse"
  tagline = "Jean-Baptiste PERIN"  % removed
}

global = {
  \key g \major
  \time 4/4
  \tempo 4 = 102
}

grille_accord = \chordmode {

  r1 a1:m d:7 g:maj7 c:maj7
  fis:m7.5- b:7 e:m7 e:m7
  b:7 e:m7 e:m7 
  fis:m7.5- b:7 e:m7 e:m7
  a1:m d:7 g:maj7 c:maj7
  fis:m7.5- b:7 e2:m7 ees:7 d:m7 des:7
  c1:maj7 b:7 e:m7 e:m7
}

notes_melodie = {
r4 e fis g 
\repeat volta 2 {
\mark \default
\repeat volta 2 {
c'1 ~ | c'4 d e fis |
b2 b2 ~ | b4 c d e |
a1 ~ | 
}
\alternative {
{
a4 b, cis dis | g1 |
r4 e fis g 
}
{ a4 fis a g | e1 ~ | e4 r dis e |
 }
 }
\mark \default
fis b, fis2 ~ | fis4 fis e fis  | g1 ~ | g4 g fis g | a1 ~ | 
 a4 d d' c' | b1 ~ | b4 r ais b | 
 \mark \default
 c' c' a a | fis2. c'4 | b2 b2 ~ | b2 e2 |
 a2. g4 | fis2 g4 b,4 | e1 | r4 e fis g |
}
}

notes_basse = {
  r1 
\repeat volta 2 {
\repeat volta 2 {
  a,4 a, b, c 
  d d e fis
  g g b b 
  c' b a g \break 
  
  fis e d c
   
 
  
  %\mark \default
}
\alternative {
{
  b, a, g, fis,
  e, fis, g, a,
  b, c b, g, \break 

}
{
  b, a, a, e,
  e, fis, g, a,
  b, a, g, e, 
  \break
  
  

}
}
fis, g, a, c 
b, c e d
e fis g a
b b a g  
\break
a g fis e
d c b, a, 
g, g, a, b,
c d e g
\break
fis g a a 
b a g fis
e b ees b
d b des b \break
c e g a 
b a g fis
e, fis, g, a,
b, c b, g, \break 

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

    \new Voice = "one" {
      \global
      \clef treble

      %\unfold \transpose c' c \notes_basse
      \unfold \transpose c c' \notes_melodie

    }
    \new Voice = "two" {
      \global
      \clef bass

      %\unfold \transpose c' c \notes_basse
      \notes_basse

    }

  >>
  \layout {
    indent = 0.0\cm
  }

}


\score {
  <<
    \set Score.skipBars = ##t
    

    \new Voice = "one" {
      \global
      \clef treble
      \set Staff.midiInstrument = #"piano"

      %\transpose c' c \notes_basse
      \unfoldRepeats \notes_melodie

    }
    \new Voice = "two" {
      \global
      \clef bass
      \set Staff.midiInstrument = #"electric bass (finger)"

      %\transpose c' c \notes_basse
      \unfoldRepeats \notes_basse

    }

  >>
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



