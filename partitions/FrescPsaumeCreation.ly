\version "2.18.2"  % necessary for upgrading to future LilyPond versions.
notes_communes = {
  r8 cis'8 cis'8 cis'8 b8 cis'8 | 
  a2.~ |
  a8 d'8 d'8 d'8 cis'8 d'8 |
  b2.~ |
  b8 e'8 e'8 e'8 d'8 e'8 |
  cis'2.~ |
  cis'8 fis'8 fis'8 fis'8 gis'8 a'8 |
  gis'2.~ |
  gis'8 fis'8 gis'8 a'8 gis'8 fis'8 |
  a'2.~ |
  a'8 fis'8 gis'8 a'8 gis'8 fis'8 |
  a'2.~ |
  a'8 gis'8 a'8 b'8 a'8 gis'8 |
  b'2. |
  \break
}
paroles_communes = \lyricmode {
  Par les cieux de -- vant toi
  splen -- deur et ma -- jes -- té
  par l'in -- fi -- ni -- ment grand
  l'in -- fi -- ni -- ment pe -- tit
  et par le fir -- ma -- ment
  ton man -- teau é -- toi -- lé
  et par frè -- re so -- leil
}
notes_soprano = {
  b'8 b'8 b'8 b'4 cis''8 |
  cis''2.~ |
  cis''8 b' cis'' d'' b' gis'  |
  a'2.~ |
  a'8 fis' gis' a' gis' fis' |
  a'2.~ |
  a'8 a' a' a' a' b' |
  b'2.~ |
  b'4.~ b'4 cis''8 |
  cis''2.~ |
  cis''8 b' cis'' d'' b' gis' |
  a'2.~ |
  a'8 fis' gis' a' gis' fis' |
  a'4.~ a'8 a' a' |
  b'2.~ |
  b'8 e' e' e' e' e'  |
  e'2. |
}

paroles_soprano = \lyricmode {
  je veux cri -- er mon Dieu
  tu es grand tu es beau
  Dieu vi -- vant Dieu très haut
  tu es le Dieu d'a -- mour
  mon Dieu
  tu es grand tu es beau
  Dieu vi -- vant Dieu très haut
  Dieu pré -- sent
  en tou -- te cré -- a -- tion
}
notes_alto = {
  b'8 b'8 b'8 b'4 a'8 |
  a'4.~ a'4 a'8 |
  gis'2.  |
  fis'4.~ fis'4 fis'8 |
  fis'2.  |
  fis'4.~ fis'4 fis'8 |
  fis'2.  |
  gis'2.~ |
  gis'4.~ gis'4 a'8 |
  a'4.~ a'4 a'8 |
  gis'2.  |
  fis'2.~ |
  fis'4. (cis'4.) |
  d'2.~ |
  d'4.~ d'8 e'e' |
  d'8 d' d' b cis' d'  |
  cis'2. |
}

paroles_alto = \lyricmode {
  je veux cri -- er mon Dieu
  mon Dieu
  ô mon Dieu
  ô mon Dieu
  ô mon Dieu
  mon Dieu
  ô ô 
  Dieu pré -- sent
  en tou -- te cré -- a -- tion
}
notes_tenor = {
  b'8 b'8 b'8 b'4 e''8 |
  e''4.~ e''4 e''8 |
  e''2. |
  cis''4.~ cis''4 cis''8 |
  cis''2. |
  d''4.~ d''4 d''8 |
  d''2. |
  e''2.~ |
  e''4.~ e''4 e''8 |
  e''4.~ e''4 e''8 |
  e''2. |
  cis''2.~ |
  cis''4. a'4. |
  fis'2.~ |
  fis'8 fis'8 a'8 gis'4.~
  gis'8 gis'8 gis'8 gis'8 gis'8 gis'8 |
  a'2. |
}
paroles_tenor = \lyricmode {
  je veux cri -- er mon
  Dieu mon
  Dieu
  Ô mon Dieu
  Ô mon Dieu
  Ô mon Dieu
  mon Dieu
  Ô Ô Ô Dieu pré -- sent
  en tou -- te cré -- a -- tion

}
notes_basse = {
  b8 b8 b8 b4 a8 |
  a4.~ a4 a8 |
  e2. |
  fis4.~ fis4 fis8 |
  fis2. |
  d4.~ d4 d8 |
  d4.~ d4 b,8 |
  e8 e8 e8 e8 e8 e8|
  e4.~ e4 a8 |
  a4.~ a4 a8 |
  e2. |
  fis8 fis8 gis8 a8 gis8 fis8 |
  a4.( fis4.) |
  d8 e8 cis8 b,4. |
  e2.~ |
  e8 e8 e8 e8 e8 e8 |
  a,2. |
}
paroles_basse = \lyricmode {
  je veux cri -- er mon
  Dieu mon
  Dieu
  Ô mon Dieu
  Ô mon Dieu
  Ô ô tu es le Dieu d'a -- mour
  mon Dieu
  mon Dieu
  Ô tu es grand tu es beau
  Ô dieu très haut
  Ô en tou -- te cré -- a -- tion

}
global = {
  \key a \major
  \time 6/8
  \tempo 4 = 120
}

\score {
  \new StaffGroup {
    <<
      \new ChordNames {

        \set chordChanges = ##t
        \chordmode {a2. fis:m b:m e e e e fis:m fis:m fis:m fis:m e e e }
      }
      \new Voice ="one" {
        \global 
        \set Staff.midiInstrument = #"flute" 
        
        \notes_communes 
        
      } 
      
    >>
    
    <<  
      
      \new ChordNames {
        \set chordChanges = ##t
        \chordmode {e a e fis:m fis:m d d e e a e fis:m fis:m d e e a}
      }
      \new Voice {
        \set Staff.midiInstrument = #"flute"
        \once \set Staff.explicitKeySignatureVisibility = #end-of-line-invisible
        \key a \major
        \once \omit Staff.TimeSignature
        \notes_soprano
      }
      \addlyrics \paroles_soprano
      
      \new Staff {
        \set Staff.midiInstrument = #"violin" 
        \once \set Staff.explicitKeySignatureVisibility = #end-of-line-invisible
        \key a \major
        \once \omit Staff.TimeSignature
        \notes_alto
        
      } \addlyrics \paroles_alto
      
      \new Staff {
        \set Staff.midiInstrument = #"ocarina" 
        \once \set Staff.explicitKeySignatureVisibility = #end-of-line-invisible
        \key a \major
        \once \omit Staff.TimeSignature
        \notes_tenor
        
      } \addlyrics \paroles_tenor

      \new Staff {
        \set Staff.midiInstrument = #"cello" 
        \once \set Staff.explicitKeySignatureVisibility = #end-of-line-invisible
        \key a \major
        \clef bass
        \once \omit Staff.TimeSignature
        \notes_basse
        
      } \addlyrics \paroles_basse
      
    >>

  }
  
  \layout {
    indent = 0.0\cm
  }
  \midi {
  
  }
  
}
  \header {
      title = "Psaume de la création"
  composer = "Patrick Richard"
    piece = "Conducteur"
  tagline = "Chorale Eglise Réformée de Romans"  % removed
  }


