% LilyBin

\header {
  title = "Billie Jean"
  composer = "Michael Jackson"
  piece = "Chant"
  tagline = "JiBe"  % removed
}

global = {
  \key a \major
  \time 4/4
  \tempo 4 = 120
}

grille_accord = \chordmode {

  %r1 a:m a:m g f
	fis4.:m gis2:m~ gis8:m
	a4. gis2:m~ gis8:m
	fis4.:m gis2:m~ gis8:m
	a4. gis2:m~ gis8:m
	b1:m
	b1:m
	fis4.:m gis2:m~ gis8:m
	a4. gis2:m~ gis8:m
}

notes_chant = {

  %r1
  \mark \default

 r4  cis'8	 cis'8 	 cis'8	 b8 	 a8	 b8  	|
 b8	 cis'8~	 cis'8	 b16	 a16 	 b8	 a8 	 cis'4	|
 r8 	 cis'8 	 cis'8	 cis'8 	 cis'8	 b8 	 a8	 b8~ 	|
 b8 a8	 cis'8 	 b8~ 	 b8 	 a8 	 gis8	 fis8~ 	|
 fis4 r4 r4 fis16 gis16 fis8~ |
 fis8 	 r8 	 fis16	 gis16	 fis8~ fis8 r8 fis16	 gis16	 fis8~ |
 fis8 r8 r4 r2 |
 r8 	 fis8 	 a8	 b8~ 	 b8	 a8 	 gis8	 fis8~ 	|
 fis4 r4 r4 	 fis16	 gis16	 fis8~ 	|
 fis8 r8 	 fis16 	 gis16	 fis8~ 	 fis8 	 r8 	 fis16 	 gis16	 fis8~ 	|
 fis4 r4  r2 |
 \break
 r8  cis'8	 cis'8	 cis'8 	 cis'8	 b8 	 a8	 b8  	|
 b8	 a'8~	 cis'8	 b16	 a16 	 b8	 a8 	 cis'4	|
 r8 	 cis'8 	 cis'8	 cis'8 	 cis'8	 b8 	 a8	 b8~ 	|
 b8 a8	 cis'8 	 b8  	 b8 	 a8 	 gis8	 fis8~ 	|
 fis4 r4 r4 fis16 gis16 fis8~ |
 fis8 	 r8 	 fis16	 gis16	 fis8~ fis8 r8 fis16	 gis16	 fis8~ |
 fis8 r8 r4 r2 |
 \break
r1*1|
 fis'8	 e'16	 fis'16~ 	 fis'16 	 e'16	 fis'8~ 	 fis'8	 a'8 	 r8 	 fis'8 	|
 a'8	 fis'16	 fis'16 	 fis'16 	 e'16	 fis'8 	 r4 	 r16 	 cis'16	 fis'8 	|
 e'16	 fis'16	 fis'8~ 	 fis'8 	 fis'16	 e'16 	 fis'8	 gis'4 	 fis'8~ 	|
 fis'16 (e'16 cis'8) 	 r4  r4  	 r8 	 e'8 	|
 fis'8	 e'16	 fis'16~ 	 fis'16 	 e'16	 fis'8~	 fis'8	 fis'8	 r8 	 fis'8 	|
 a'8	 fis'16	 fis'16 	 fis'16 	 e'16	 fis'16~ 	 e'16~ 	 cis'8 	 r8 r16	 cis'16	 fis'8 	|
 d'8	 d'16	 d'16 	 d'16	 e'16 	 fis'8~ 	 fis'4 	 r8	 fis'16 	fis'16 |
 eis'8	 eis'16	 eis'16~ 	 eis'16	 fis'16 	gis'8	 r8 	 fis'8	 (gis'8 	fis'8)|
 \break
 r4 	 fis'8	 fis'8 	 e'8	 (cis'8) 	 cis'4 	|
 fis'8	 fis'4 	 e'8~ 	 e'8 	 cis'8~ 	 cis'8 	 r8 	|
 r8 	 fis'8 	 fis'8	 fis'8 	 e'8	 (cis'8) 	 cis'4 	|
 fis'8	 a'8 	 r8	 b'8~ 	 b'8 	 a'8 	 gis'8	 fis'8~ 	|
 fis'4 	 r4 	 r8 	 fis'8 	 r8	 fis'8 	|
 cis''8	 (b'8) 	 b'4 	 fis'8	 d'8 	 (cis'8) 	 cis'8~ 	|
 cis'4 r4  r2 |
 r8 	 fis'8 	 a'8	 b'8~ 	 b'8 	 a'8 	 gis'8	 fis'8~ 	|
 fis'4 	 r4 	 r8 	 fis'8 	 r8	 fis'8 	|
 cis''8	(b'8) 	 b'4 	 fis'8	 d'8 	 (cis'8) 	 cis'8~ 	|
 cis'4 r4  r2 |
 r1



}
paroles_chant = \lyricmode {
  She was more like a beau -- ty queen from a mov -- ie scene
I said don't mind, but what do __ you mean, I am the one
Who will dance on the floor in the round
She said I am the one, who will dance on the floor in the round
She told me her name was Bil -- lie Jean, as she caused a scene
Then ev -'ry head turned with eyes that dreamed of be -ing the one
Who will dance on the floor in the round
Peo -- ple al -- ways told me be care -- ful of what you do
And don't go a -- round break -- ing young girls' hearts
And mo -- ther al -- ways told me be care -- ful of who you love
And be care -- ful of what you do 'cause the lie be -- comes the truth. Hey
Bil -- lie Jean is not my lo -- ver
She's just a girl who claims that I am the one
But the kid is not my son
She says I am the one, but the kid is not my son

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


    \new Voice = "one" {
      \global
      \clef treble
      \set Staff.midiInstrument = #"electric bass (finger)"

    \new ChordNames {
      \set chordChanges = ##t
      \grille_accord

    }
      %\transpose c' c \notes_chant
      \unfoldRepeats \notes_chant

    }\addlyrics \paroles_chant

  >>
  \midi {

  }

}
