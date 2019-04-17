#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      tbpk7658
#
# Created:     17/04/2019
# Copyright:   (c) tbpk7658 2019
# Licence:     <your licence>
#-------------------------------------------------------------------------------

CLIENT_ID = "urn:lo:nsid:flexy205:0475410668"


import sched, time

def publish (data):
    print ("%s: %s"%(time.time(), data))

def schedule():
    s=sched.scheduler(time.time, time.sleep)
    s.enter(2, 1, publish, argument=('chaine de donnée',))
    s.enter(3, 2, publish, argument=('chaine de donnée',))
    s.run()

import datetime
from datetime import date



def processRow (row, offset_time ):

    date_time_str = row[1]
    date_time_obj = datetime.datetime.strptime(date_time_str, '%d/%m/%Y  %H:%M:%S')
    dtformated = date_time_obj.strftime("%Y-%m-%dT%H:%M:%S")

    msg = '{"s":"'+CLIENT_ID+'!uplink",'            ## source
    msg = msg + '"m":"MyModel" '					## model (for indexation)
    msg = msg + ', "value":{'
    msg = msg + ' "variable" : "' + row[0] + '"'
    msg = msg + ', "valeur" : ' + row[2]
    msg = msg + ', "timestamp": "' + dtformated + 'Z"';  	## timestamp
    msg = msg + '} '								## data (json format)
    msg = msg + ', "loc":[45.759723,4.84223]'       ## loc
    msg = msg + ', "t": ["MyTag"]'
    msg = msg + '}'									## tags

    #msg = '{"s":"urn:lo:nsid:flexy205:0475410668!uplink", "m":"sample01", "value":{"engineOn":true,"tempC":-2.39, "ts": "2018-06-21T09:55:47Z"}, "t": ["sample.01"], "loc":[45.759723,4.84223]}'

    #timedt = datetime.datetime.fromordinal(timest)
    #offset_time = timest - ref_time
    print ("%s, %f, %s"%(dtformated, offset_time, msg) ) #(', '.join(row))


import csv

def litCSV(filepath, nb = None):
    with open(filepath, newline='') as csvfile:
        spamreader = csv.reader(csvfile, delimiter=';', quotechar='"')
        nbval = 0
        for row in spamreader:
            if nbval == 0:
                pass
            else:
                if nbval == 1:
                    reftime = float(row[4].replace(',','.'))
                    offsettime = 0.0
                else:
                    currtime = float(row[4].replace(',','.'))
                    offsettime = currtime - reftime
                processRow (row, offsettime)
            nbval = nbval + 1
            if (nb != None) and (nbval > 100) : break

if __name__ == '__main__':

    FILEPATH = "C:\\Users\\tbpk7658\\Documents\\Projets\\STIB\\data\\Inputs and Outputs0_20181009_105730_HMI_Panel.csv"
    litCSV(FILEPATH, 12)
