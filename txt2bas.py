
import re

# dest_file = "C:\\Users\\Public\\Git\\hello-world\\retro\\oric\\gloric\\main.bas"
dest_file = "C:\\Users\\tbpk7658\\Documents\\Projets\\hello-world\\retro\\oric\\main.bas"
dest_build = "C:\\Users\\tbpk7658\\Documents\\Projets\\hello-world\\retro\\oric\\build.bat"

build_content=r"""
ECHO #file main.bas  1>%OSDK%\TMP\main.bas

TYPE main.bas  1>>%OSDK%\TMP\main.bas

%OSDK%\BIN\Bas2Tap -b2t1 -color1 %OSDK%\TMP\main.bas build\main.tap
copy build\main.tap %OSDK%\Oricutron\
PUSHD %OSDK%\Oricutron
START oricutron.exe -t main.tap
POPD

"""
#

##scr_content=r"""
##    HIRES
##    FOR Y=0 TO 199
##    S=INT(SIN(Y/10)*8)
##    FOR I=0 TO 39
##    P=#A000+Y*40+X
##    Q=(S+X)-INT((S+X)/8)*8+16
##    POKE P,Q
##    NEXT
##    NEXT
##"""

##scr_content=r"""
##    HIRES
##    PAPER 1 : INK 3
##    A$ ="TARTEMOLLE"
##    FORW=0 TO 20
##        CURSET 20,50+W*3,3
##        GOSUB label
##    NEXT
##    END
##label:
##    REM ... CHAINE AVEC ESPACES
##    FOR I=1 TO LEN(A$)
##        CHAR ASC(MID$(A$,I)),0,1
##        DRAW W,0,3
##    NEXT I
##    RETURN
##"""

scr_content=r"""

"""

class script:
    def __init__ (self):
        self.__content__= []
        self.__labels__= {}

    def __valuelabels__ (self):
        result = ""
        line_number  = 10
        for li in self.__content__:
            if li.strip() == '': continue
            # If line is a label
            label = re.compile("^([a-z_]{1,15}):").match(li)
            if label :
                self.__labels__[label.groups()[0]] = line_number
            else :
                # If line is a numbered label
                numbered_label = re.compile("^([a-z_]{1,15})[ ]*([0:9]{1,7}):").match(li)
                if numbered_label :
                    pass
                else :
                    line_number += 10

    def __buildoutput__ (self):
        result = ""
        line_number  = 10
        self.__valuelabels__()

        for li in self.__content__:
            if li.strip() == '': continue
            # If line is a label
            label = re.compile("^([a-z_]{1,15}):").match(li)
            if label :
                pass
            else :
                # If line is a numbered label
                numbered_label = re.compile("^([a-z_]{1,15})[ ]*([0:9]{1,7}):").match(li)
                if numbered_label :
                    pass
                else :
                    # If line contains GOXXX

                    go_call = re.compile("^.*[ :](GO[A-Z]{1,15})[ ]*(([a-z_]{1,15}))").match(li)
                    if go_call :
                        def gorepl(match):
                            gotype = match.groups()[0]
                            dest_label = match.groups()[1]
                            if dest_label in self.__labels__.keys():
                                dest_line = str(self.__labels__[dest_label])
                            else:
                                dest_line = "UNFOUND LABEL %s"%(dest_label)
                            return "%s %s"%(gotype, dest_line)
                        p = re.compile("[ :](GO[A-Z]{1,15})[ ]*(([a-z_]{1,15}))")
                        tmpstr = p.sub(gorepl, li)
                        #go_type = go_call.groups()[0]
                        #dest_label = go_call.groups()[1]
                        #if dest_label in self.__labels__.keys():
                        result += "%d %s\n"%(line_number, tmpstr)  #"%d %s %d\n"%(line_number, go_type, self.__labels__[dest_label])

                    else :
                        result += "%d %s\n"%(line_number, li)
                    line_number += 10
        return result

    def addContent (self, txt_content):
        for li in txt_content.split('\n'):
            self.__content__.append (li)
            # If line is a label
            label = re.compile("^([a-z_]{1,15}):").match(li)
            if label :
                label = label.groups()[0]
                if label in self.__labels__.keys():
                    print ("LABEL ALREADY EXIST")
                else:
                    self.__labels__[label] = 0
            else :
                # If line is a numbered label
                numbered_label = re.compile("^([a-z_]{1,15})[ ]*([0:9]{1,7}):").match(li)
                if numbered_label :
                    label = numbered_label.groups()[0]
                    line_number = numbered_label.groups()[1]
                    self.__labels__[label] = line_number


    def toStr (self,):
        return self.__buildoutput__()

import subprocess
import os

def main():
    thescript = script ()
    thescript.addContent(scr_content)
    with open(dest_file, "w") as ficout:
        ficout.write(thescript.toStr())
    with open(dest_build, "w") as ficout:
        ficout.write(build_content)
    os.chdir(os.path.dirname(os.path.abspath(dest_file)))
    #C:\Users\tbpk7658\Documents\Projets\hello-world\retro\oric\gloric\
    subprocess.call([r'build.bat'])


if __name__ == '__main__':
    main()
