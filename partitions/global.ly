\version "2.18.2"  % necessary for upgrading to future LilyPond versions.

\include "IShotTheSheriff_Clarinette.ly"
\include "IShotTheSheriff_ClarinetteBasse.ly"
\include "IShotTheSheriff_Trombone.ly"

global = {
	\key bes \major
	\time 4/4
	\tempo 4 = 180
}
\book {
  \paper {
	print-all-headers = ##t
  }
  \header {
	title = "I Shot The Sheriff"
	subtitle = ""
	composer = "BOB MARLEY"
	arranger = "BdP Jazz Band"
	tagline = ##f
  }

  \score {
  \new Staff
	{
		\clef treble
		\key c \major
		\transpose bes c' \clarinet_notes
	}
	\header {
		piece = "Clarinet"
		breakbefore = ##t
	}
  }	
  \pageBreak

	
  \score {
    \new Staff
	{
		\clef treble
		\key c \major
		\transpose bes c' \bassClarinet_notes
	}
	\header {
		piece = "Bass Clarinet"
	}
}	


\pageBreak

  \score {
    \new Staff
	  {
		\clef bass
		\key bes \major
		\transpose c c,, \trombone_notes
	  }
	\header {
		piece = "Tombone"
	  }
  }	
  \pageBreak
	
  \score {
	<<
    \new ChordNames {
      \set chordChanges = ##t
      \chordmode {
  	    g1:m g1:m c1:m c1:m g1:m g1:m g1:m g1:m 
  	    g1:m g1:m c1:m c1:m g1:m g1:m g1:m g1:m 
		ees1 d g1:m g1:m
		ees1 d g1:m g1:m
		ees1 d g1:m g1:m
		ees1 d g1:m g1:m
		ees1 d g1:m g1:m
		ees1 d g1:m g1:m
      }
    }
		\new Staff \new Voice { \key bes \major \clarinet_notes}
		\new Staff \new Voice { \key bes \major \bassClarinet_notes}
		\new Staff \new Voice { \key bes \major \trombone_notes}
	>>
	\header {
		piece = "Conducteur"
	  }
  }	
}