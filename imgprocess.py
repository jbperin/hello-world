#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      tbpk7658
#
# Created:     10/10/2019
# Copyright:   (c) tbpk7658 2019
# Licence:     <your licence>
#-------------------------------------------------------------------------------

from os import listdir
from os.path import isfile, join



from PIL import Image



def main():
    mypath = "C:\\Users\\tbpk7658\\Documents\\Projets\\hello-world\\casio\\images"
    onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]
    print (onlyfiles)
    for fil in onlyfiles:
        im = Image.open(mypath+"\\"+fil)
        width, height = im.size
        #print ((width, height))
        cssline = '%s { background-image:url("images/%s"); display:inline-block; padding:0px;margin:0px;height:%dpx;width:%dpx;}'%(fil.split(".")[0], fil, height, width)
        print (cssline)
    pass

if __name__ == '__main__':
    main()
