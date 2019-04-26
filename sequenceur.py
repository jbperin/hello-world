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


import paho.mqtt.client as mqtt
from datetime import datetime

SERVER = "liveobjects.orange-business.com"
PORT = 1883
API_KEY   = "e36519a3c5474778a0f0d2a867843eba"
USERNAME  = "json+device"
CLIENT_ID = "urn:lo:nsid:flexy205:JBP0475410668"


#Publications parameters
TOPIC="dev/data" # topic to publish to
qos = 1


# The callback for when the client receives a CONNACK response from the server.
def on_connect(client, userdata, rc):
    print("Connected with result code "+str(rc))
    # Subscribing in on_connect() means that if we lose the connection and
    # reconnect then subscriptions will be renewed.
    client.subscribe("$SYS/#")

# The callback for when a PUBLISH message is received from the server.
def on_message(client, userdata, msg):
    print(msg.topic+" "+str(msg.payload))

sampleClient = mqtt.Client(CLIENT_ID, clean_session=True, userdata = None, protocol=mqtt.MQTTv311, transport="tcp")
sampleClient.on_connect = on_connect
sampleClient.on_message = on_message

sampleClient.username_pw_set(USERNAME,password = API_KEY) # use device mode and set the password
# now connect to LO
sampleClient.connect(SERVER, PORT, 60)

sampleClient.loop_start()

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
    msg = msg + '"m":"Flexy205" '					## model (for indexation)
    msg = msg + ', "value":{'
    msg = msg + ' "variable" : "' + row[0] + '"'
    msg = msg + ', "valeur" : ' + row[2]
    msg = msg + ', "timestamp2": ' + str(float(row[4].replace(',', '.')))  	## timestamp
    msg = msg + ', "timestamp": "' + dtformated + 'Z"';  	## timestamp
    msg = msg + '} '								## data (json format)
    msg = msg + ', "loc":[45.759723,4.84223]'       ## loc
    msg = msg + ', "t": ["MyTag"]'
    msg = msg + ', "ts": "' + dtformated + 'Z"';  	## timestamp
    msg = msg + '}'									## tags

    if row[0] in [ "ibo_Zen_A1-A2_rel_R" ]:
        sampleClient.publish(TOPIC, msg, qos)
        print ("%s, %f, %s"%(dtformated, offset_time, msg) )
    #msg = '{"s":"urn:lo:nsid:flexy205:0475410668!uplink", "m":"sample01", "value":{"engineOn":true,"tempC":-2.39, "ts": "2018-06-21T09:55:47Z"}, "t": ["sample.01"], "loc":[45.759723,4.84223]}'

    #timedt = datetime.datetime.fromordinal(timest)
    #offset_time = timest - ref_time
     #(', '.join(row))


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
    litCSV(FILEPATH, 2400000)
