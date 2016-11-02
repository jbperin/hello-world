import os, sys
import platform

runLocal = False

def main(argv):

    sys.stdout.write('OS       :' + os.name+'\n')
    sys.stdout.write('platform :' + sys.platform+'\n')
    sys.stdout.write('system   :' + platform.system()+'\n')
    sys.stdout.write('node     :' + platform.node()+'\n')
    sys.stdout.write('release  :' + platform.release()+'\n')
    sys.stdout.write('version  :' + platform.version()+'\n')
    sys.stdout.write('machine  :' + platform.machine()+'\n')
    sys.stdout.write('processor:' + platform.processor()+'\n')
    #i=1/0
    if sys.platform == 'linux-armv7l':
        import sl4a
        droid = sl4a.Android()
        print(dir(droid))
        #droid.ttsSpeak('Je suis sur un tel android')
    
    sys.stdout.write("FIN\n")


























import zlib, base64
import threading
import time

import paho.mqtt.publish as publish
import paho.mqtt.client as mqtt

resultReceived = False

def on_connect(client, userdata, rc):
    #sys.stdout.write("Connected with result code "+str(rc))
    client.subscribe("$SYS/broker/jibeply")

def on_message(client, userdata, msg):
    global resultReceived
    #print(msg.topic+" "+str(msg.payload))
    sys.stdout.write(zlib.decompress(base64.b64decode(msg.payload)).decode('utf-8'))
    resultReceived = True

class mThread(threading.Thread): 
    def __init__(self,param): 
        threading.Thread.__init__(self) 
        self.param = param
        self.Terminated = False 
    def run(self): 
        while (self.Terminated == False):
            self.param.loop()
            time.sleep(0.5)
    
    def stop(self): 
        self.Terminated = True

if __name__ == '__main__':

    calling_name =  os.path.basename(sys.argv [0])
    #sys.stdout.write(calling_name + "\n")
    #sys.stdout.write( __file__ + '\n')
    #if calling_name == "mytb.py":
    if ('runLocal' in vars().keys()) and (vars()['runLocal'] == False) and (calling_name == "mytb.py"):
        #if (calling_name == "mytb.py"):

        client = mqtt.Client()
        client.on_connect = on_connect
        client.on_message = on_message

        client.connect("test.mosquitto.org", 1883, 60)
        mqThread = mThread(client)
        mqThread.start()
        #sys.stdout.write (os.path.realpath(__file__) + "\n")
        with open(os.path.realpath(__file__),'r') as scrfile:
            S=base64.b64encode(zlib.compress(str.encode(scrfile.read())))
        publish.single("$SYS/broker/jibe", bytearray(S), hostname="test.mosquitto.org")
        #main(sys.argv)
        while (resultReceived != True):
            time.sleep(1)
        mqThread.stop()
        mqThread.join()
        
    else:
        main(sys.argv)
