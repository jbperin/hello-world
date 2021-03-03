#!/usr/bin/python3

import credentials
from credentials import IP_FILE, FTP_SERVER, FTP_LOGIN, FTP_PASSWD, WEB_URL, HTM_REDIRECT


# Retrieve Internet Box's Ip address from whatip.com
import urllib.request
contents = urllib.request.urlopen("http://www.whatip.org").read()

import re
result=re.compile(">([0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3})<").search(str(contents))
strCurrentIp=result.group(1)

print ("current IP = %s."%(strCurrentIp))


# Retrieve Former Internet Box's Ip address from web site
import urllib.request
contents = urllib.request.urlopen(WEB_URL+"/"+IP_FILE).read()

import re
result=re.compile("([0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3})").search(str(contents))
strPreviousIp=result.group(1)

print ("saved IP = %s."%(strPreviousIp))


if (strCurrentIp != strPreviousIp) :
    
    print ("IP address Out-of-date .. ")
    
    # write IP String to local file
    with open(IP_FILE, "w") as text_file:
        text_file.write(strCurrentIp)
    
    with open(HTM_REDIRECT, "w") as htm_file:
        htm_file.write('<head><meta http-equiv="refresh" content="0; URL=http://%s:8080/OricutronJS/index_nophp.html" /></head>'%strCurrentIp)
        
    print ("FTP updating ")

    # transfert IP File to 
    import ftplib 
    with ftplib.FTP_TLS(FTP_SERVER) as ftps:
        try:    
            ftps.login(FTP_LOGIN, FTP_PASSWD)
            ftps.prot_p() 
            print ("\tLogged In. Deleting old ipfile.")
            
            try:
                ftps.delete(IP_FILE)
                print ("\told ipfile deleted.")
            except ftplib.error_perm as e:
                print('FTP delete error:', e) 
                pass

            try:
                ftps.delete(HTM_REDIRECT)
                print ("\thtm redirect deleted.")
            except ftplib.error_perm as e:
                print('FTP delete error:', e) 
                pass

            print ("\tUploading new ipfile")
            with open(IP_FILE, 'rb') as fp:
                res = ftps.storlines("STOR " + IP_FILE, fp)
                
            print ("\tUploading HTML Redirect file")
            with open(HTM_REDIRECT, 'rb') as fp:
                res = ftps.storlines("STOR " + HTM_REDIRECT, fp)
                
            print ("\tQuiting FTP...")
            ftps.quit()
            
            print ('\tClosing FTP connection')
            ftps.close()
            
        except ftplib.all_errors as e:
            print('FTP error:', e) 

else:
    print ("IP address up-to-date ..  No need to update")
