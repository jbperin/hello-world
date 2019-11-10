
import re

dest_file = "C:\\Users\\Public\\Git\\hello-world\\retro\\oric\\gloric\\main.bas"

scr_content=r"""
    LET ADRBASE = # 800

    ' Je stocke mes donnees en memoire
    FOR N=0TO5
    : READ DTA: POKE ADRBASE+N,DTA
    NEXT N

    ' Je relis mes donnees depuis la memoire
    LET OFFSET = 0
    V1 = DEEK (ADRBASE + OFFSET): OFFSET = OFFSET + 2
    V2 = DEEK (ADRBASE + OFFSET): OFFSET = OFFSET + 2
    V3 = DEEK (ADRBASE + OFFSET): OFFSET = OFFSET + 2
    PRINT "V1 = ";V1;", V2 = ";V2;", V3 = ";V3

    ' Mes donnees
    DATA 3, 0, #FE, 0, 2, 0
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
    os.chdir(os.path.dirname(os.path.abspath(dest_file)))
    #C:\Users\tbpk7658\Documents\Projets\hello-world\retro\oric\gloric\
    subprocess.call([r'build.bat'])


if __name__ == '__main__':
    main()
