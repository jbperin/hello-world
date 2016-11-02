#!/usr/bin/python
import os, sys, time
import threading
import traceback
#2.7
#import __main__ as main

EMAIL = 'toto@gmail.com'
PASSWD = "password"

class anInterface():
    def __init__(self, handler):
        self.__handler__ = handler
    def init(self):
        sys.stdout.write ("mail int\n")
    def poll(self):
        sys.stdout.write ("mail poll\n")
    def write(self):
        sys.stdout.write ("mail read\n")

import paho.mqtt.client as mqtt
import paho.mqtt.publish as publish
import zlib, base64
class mqttInterface(anInterface):
    def __init__(self, handler, mqtt_server="test.mosquitto.org"):
        anInterface.__init__(self, handler)
        self.__client__ = mqtt.Client()
        self.__mqtt_server__ = mqtt_server
        self.__client__.on_connect = self.__on_connect__
        self.__client__.on_message = self.__on_message__

    def __str__(self):
        return ''
    def __on_connect__(self, client, userdata, rc, onemore):
        sys.stdout.write ("mqtt Connected with result code "+str(rc) + "\n")
        self.__client__.subscribe("$SYS/broker/jibe")
    def __on_message__( self, client, userdata, msg):
        #sys.stdout.write ("mqtt Message" +msg.topic+" "+str(msg.payload) + '\n')
        res = self.__handler__(zlib.decompress(base64.b64decode(msg.payload)).decode('utf-8'))
        self.write(res)
    def init(self,):
        self.__client__.connect(self.__mqtt_server__, 1883, 60)
        #sys.stdout.write ("mqtt init\n")
    def poll(self):
        sys.stdout.write ("mqtt poll\n")
        self.__client__.loop()
    def write(self, content, ):
        #sys.stdout.write ("mqtt write\n")
        #S=base64.b64encode(zlib.compress(str.encode(content.encode('utf-8'))))
        S=base64.b64encode(zlib.compress(content.encode('utf-8')))
        publish.single("$SYS/broker/jibeply", bytearray(S), hostname=self.__mqtt_server__)

import imaplib,smtplib
    
class mailInterface(anInterface):
    def __init__(self, handler,  login, password, imap_server="imap.gmail.com" , smtp_server= "smtp.gmail.com"):
        anInterface.__init__(self, handler)
        self.__login__ = login
        self.__password__ = password
        self.__imap_server__ = imap_server
        self.__smtp_server__ = smtp_server
        self.__last_mail_num__ = None
        self.__last_mail_from__ = None
    def __str__(self):
        return ''
    def init(self,):
        sys.stdout.write ("mail init\n")
        mc=imaplib.IMAP4_SSL(self.__imap_server__, 993) 
        mc.login(self.__login__, self.__password__) 
        mc.select() 
        typ, data = mc.search(None, '(HEADER Subject "scr.py")' ) 
        self.__last_mail_num__ = int(data[0].split()[-1])
        sys.stdout.write("last_mail_num = %d \n"%self.__last_mail_num__)
    def poll(self):
        sys.stdout.write ("mail poll\n")
        mc=imaplib.IMAP4_SSL(self.__imap_server__, 993) 
        mc.login(self.__login__, self.__password__) 
        mc.select() 
        typ, data = mc.search(None, '(HEADER Subject "scr.py")' ) 
        mail_num = data[0].split()[-1]
        sys.stdout.write("mail_num = %d \n"%int(mail_num))
        
        if (self.__last_mail_num__ != int(mail_num)):
            typ,data = mc.fetch(mail_num, '(BODY[TEXT])')
            typ,issuer=mc.fetch(mail_num,'(BODY[HEADER.FIELDS (From)])')
            try:
                self.__last_mail_from__ =issuer[0][1].decode('utf-8').split('<')[1].split('>')[0]
            except IndexError:
                self.__last_mail_from__ =issuer[0][1].decode('utf-8').split(':')[1].strip()
            self.__last_mail_num__ = int(mail_num)
            sys.stdout.write("last_mail_num = %d \n" %self.__last_mail_num__)
            mc.close()
            mc.logout()
            mailContent = data[0][1][0:-2]
            ll = mailContent.decode('utf-8').split ('\r\n')
            idx_parts = [ii for ii in range (len(ll)) if ll[ii].startswith("--")]
            if len(idx_parts) != 0:
                scriptLines = mailContent.decode('utf-8').split ('\r\n')[idx_parts[0]+3:idx_parts[1]]
            else:    
                scriptLines = mailContent.decode('utf-8').split ('\r\n')
            self.__handler__("\n".join(scriptLines))

    def write(self, content, toaddr = None):
        sys.stdout.write ("mail write\n")
        
        to = None
        if toaddr != None:
            to = toaddr
        elif self.__last_mail_from__ != None:
            to = toaddr
            
        if to != None:
            server=smtplib.SMTP("%s:587"%(self.__smtp_server__))
            server.ehlo()
            server.starttls()
            server.ehlo
            server.login(self.__login__,self.__password__)
            msg =header + '\n%s\n'%content
            server.sendmail(self.__login__, to, msg)
            server.close()


class nThread(threading.Thread): 
    def __init__(self,period, interface): 
        threading.Thread.__init__(self) 
        self.__period__ = period
        self.__interface__ = interface
        self.__interface__.init()
        self.__terminated__ = False
    def run(self): 
        while (self.__terminated__ == False):
            #sys.stdout.write("Polling\n")
            try:
                self.__interface__.poll()
            except:
                sys.stdout.write ("Unexpected error: %s %s %s\n"%(sys.exc_info()[0], sys.exc_info()[1], sys.exc_info()[2]))
                sys.stdout.write (traceback.format_exc())
            time.sleep(self.__period__)
    
    def stop(self): 
        self.__terminated__ = True

import tempfile, subprocess 
       
def processScript(script):
    #sys.stdout.write( script+ "\n")
    scriptFile = tempfile.NamedTemporaryFile('w', delete=False)
    scriptFile.write(script)
    scriptFile.close()
    result = ''
    try:
        sys.stdout.write ("1" + "\n")
        proc = subprocess.Popen([sys.executable, scriptFile.name], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        sys.stdout.write ("2" + "\n")
        result = result + proc.stdout.read().decode("utf-8")
        if (proc.stderr != None):
            result = result + proc.stderr.read().decode("utf-8")
        sys.stdout.write ("3" + "\n")
    except:
        result = result + "Unexpected error: %s %s %s\n"%(sys.exc_info()[0], sys.exc_info()[1], sys.exc_info()[2])
        result = result + traceback.format_exc()
    os.unlink(scriptFile.name)
    #print (result)
    return (result)
    
def main(argv):
    #mailIn = mailInterface (receiveScript, EMAIL, PASSWD, "imap.gmail.com" , "smtp.gmail.com")
    #theThread = nThread(2,mailIn)
    mqttIn = mqttInterface (processScript)
    theThread = nThread(2,mqttIn)
    theThread.daemon = True
    theThread.start()
    time.sleep(4)
    try:
        a=input('Entrez pour quitter\n')
    except:
        pass
            
    theThread.stop()
    theThread.join()
    
    sys.stdout.write("FIN\n")

if __name__ == '__main__':
    main(sys.argv)
