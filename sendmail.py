#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      tbpk7658
#
# Created:     18/12/2019
# Copyright:   (c) tbpk7658 2019
# Licence:     <your licence>
#-------------------------------------------------------------------------------

import credentials

import smtplib, ssl


### creates SMTP session
##s = smtplib.SMTP('smtp.gmail.com', 587)
##
### start TLS for security
##s.starttls()
##
### Authentication
##s.login(gmail_user, gmail_password)
##
### message to be sent
##message = "Message_you_need_to_send"
##
### sending the mail
##s.sendmail(gmail_user, "jbperin@gmail.com", message)
##
### terminating the session
##s.quit()



sent_from = 'amoa.obs@gmail.com'
to = ['adresse@mail.com', 'adresse2@mail.com']
subject = 'OMG Super Important Message'
body = "Hey, what's up?\n\n- You"

email_text = """\
From: %s
To: %s
Subject: %s

%s
""" % (sent_from, ", ".join(to), subject, body)

# Create a secure SSL context
context = ssl.create_default_context()
port = 485
smtp_server = "smtp.gmail.com"

with smtplib.SMTP_SSL(smtp_server, port, context=context) as server: #
    print ("server object created ");
    server.ehlo()
    print ("ehlo");
    server.login(gmail_user, gmail_password)
    print ("login");
    server.sendmail(sent_from, to, email_text)
    print ("send");
    server.close()

    print ('Email sent!')

def main():
    pass

if __name__ == '__main__':
    main()
