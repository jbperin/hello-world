#-------------------------------------------------------------------------------
# Name:        multiThreadPost
# Purpose:     This program attempts to overload a server by saturating massive parralels
#              POST Request
#
# Author:      Jean-Baptiste
#
# Created:     19/08/2019
#-------------------------------------------------------------------------------

import threading
import sys
import urllib.request
import credentials

NB_THREAD = 100
NB_REQ_BY_THREAD = 100
THE_REQUEST_PARAMS = urllib.parse.urlencode({"a":"jea"}).encode('ascii')
THE_REQUEST_URL = "http://%s/resto/checkaddr.php"%(credentials.ADR_SERVER)
CONNECTION_TIMEOUT =  0.5

class myThread (threading.Thread):
   def __init__(self, ):
      threading.Thread.__init__(self)

   def run(self):
        for ii in range (0,NB_REQ_BY_THREAD):
            try:
                req = urllib.request.Request(THE_REQUEST_URL, data=THE_REQUEST_PARAMS)
                response = urllib.request.urlopen(req, timeout=CONNECTION_TIMEOUT)
            except:
                print("Unexpected error:", sys.exc_info()[0])
                pass

def main():
    threads = []

    for ii in range (0,NB_THREAD):
        threads.append(myThread())
        threads[-1].start()

    for t in threads:
        t.join()


if __name__ == '__main__':
    main()
