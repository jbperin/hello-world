#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      tbpk7658
#
# Created:     23/01/2020
# Copyright:   (c) tbpk7658 2020
# Licence:     <your licence>
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
        #print(sl)
        for i in range(len(sl)-1):
            res += "" if (i == 0) else ", "
            res += "%d, %d"%(sl[i][1], sl[i+1][0]-sl[i][0])
        res += ", 255,0}\n"
        return res

    def spread (self, nb, evtgetter, pattern):
        tims=[]
        for i in range (nb):
            nb_attempt = 0
            t=random.randrange(0, self.__duration__)
            while (t in tims and nb_attempt < 100):
                t=random.randrange(0, self.__duration__)
                nb_attempt += 1
            if (nb_attempt >= 100): break;
            tims.append (t)
        #print (tims)
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
    #print (S)
    #print (S.toCarray())
    S.spread (12, raindrop, "")
    S.spread (5, lightning, "")
    print (S)
    print (S.toCarray())

if __name__ == '__main__':
    main()
