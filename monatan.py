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

    for x in range (256):
        print (x, round(math.atan(x) * (127/(math.pi / 2.0))))

if __name__ == '__main__':
    main()
