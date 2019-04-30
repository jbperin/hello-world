% LilyBin

global = {
  \key f \minor
  \time 4/4
  \tempo 4 = 120
}

notes_basse = {
		f g aes bes | c des ees g | f ees des bes | c bes aes g |
        f aes c f 
}


\score{
      \new Voice = "one" {
        \global 
        \clef bass
        \set Staff.midiInstrument = #"cello" 
        
        %\transpose c' c \notes_basse 
        \relative c \notes_basse 
      
      }
      

	\layout{
		indent = 0.0\cm
	}
	\midi{}
}


