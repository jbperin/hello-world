#-------------------------------------------------------------------------------
# Name:        Level Generator
# Purpose:     Wave Generator for Rain Panic
#
# Author:      Jean-Baptiste PERIN
#
# Created:     23/01/2020
# Copyright:   (c) Jean-Baptiste PERIN 2020
#-------------------------------------------------------------------------------
import random

class sequence ():
    def __init__(self, duration):
        self.__duration__= duration
        self.__seq__=[(duration, 255)]

    def __repr__(self):
        pass

    def __str__(self):
        return (str(self.__seq__))

    def insert (self, tim, evt):
        if (tim < self.__duration__):
            self.__seq__.append((tim, evt))

    def toCarray(self):
        res = "unsigned char rain[] = {\n"
        sl = sorted(self.__seq__, key=lambda evt: evt[0])

        for i in range(len(sl)-1):
            res += "" if (i == 0) else ", "
            res += "%d, %d"%(sl[i][1], sl[i+1][0]-sl[i][0])
        res += ", 255,0};\n"
        return res

    def spread (self, nb, evtgetter, pattern):

        def dop_random (thePattern):
            if (thePattern == "UNIFORM"):
                return random.randrange(0, self.__duration__)
            elif (thePattern == "GAUSS"):
                return max(self.__duration__-1, abs(int(random.gauss(self.__duration__/2, self.__duration__/3))))
            elif (thePattern == "TRIANGULAR"):
                return int(random.triangular(1, self.__duration__, self.__duration__*0.85))

        tims=[]
        for i in range (nb):
            nb_attempt = 0
            t=dop_random (pattern)
            while (t in tims and nb_attempt < 100):
                t=dop_random (pattern)
                nb_attempt += 1
            if (nb_attempt >= 100): break;
            tims.append (t)

        for t in tims:
            self.insert(t,evtgetter())

def raindrop(): return random.randrange(0,13)*2 + 7

def lightning(): return random.randrange(0,13)*2 + 200

def life(): return random.randrange(0,13)*2 + 180

def ice(): return random.randrange(0,13)*2 + 150

def cat(): return random.choice([250, 251])

def fireball(): return random.choice([252, 253])

def main():
    S=sequence(123)
    S.insert(12, 35)
    S.spread (12, raindrop, "UNIFORM")
    S.spread (5, lightning, "UNIFORM")
    S.spread (5, cat, "GAUSS")
    S.spread (5, ice, "TRIANGULAR")

    print (S.toCarray())

if __name__ == '__main__':
    main()
