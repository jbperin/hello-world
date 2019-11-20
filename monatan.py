#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      tbpk7658
#
# Created:     12/11/2019
# Copyright:   (c) tbpk7658 2019
# Licence:     <your licence>
#-------------------------------------------------------------------------------
import math
def main():

    for x in range (0, 2**5):
        frac_part = x*(1.0/2**5);
        angle = math.atan(frac_part) * ((2**5) / (math.pi/4.0))
        #print ("%02x"%(x), frac_part, ".byt %d"%(round(angle)))
        print ("    .byt %d"%(round(angle)))

if __name__ == '__main__':
    main()
