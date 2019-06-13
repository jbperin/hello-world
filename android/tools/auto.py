#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      tbpk7658
#
# Created:     13/06/2019
# Copyright:   (c) tbpk7658 2019
# Licence:     <your licence>
#-------------------------------------------------------------------------------
import sys

import pexpect
from pexpect.popen_spawn import PopenSpawn

def main():

    child = pexpect.popen_spawn.PopenSpawn('cmd', timeout=3)

    child.logfileread = sys.stdout

    keytcmd = "C:\\Users\\tbpk7658\\Applis\\ideaIC-2016.3\\ideaIC-2016.3\\jdk\\bin\\keytool.exe -genkeypair -validity 365 -keystore akey.keystore -keyalg RSA -keysize 2048"


    print ("done1")
    child.sendline(keytcmd)
    print ("done2")
    try:
        # Password
        child.expect(':', timeout=5)
        child.sendline("mot2passe")

        # Repeat password
        child.expect('Ressaisissez le nouveau mot de passe :', timeout=3)
        child.sendline("mot2passe")

        # Nom Prenom
        child.expect(":", timeout=3)
        child.sendline("Nom Prenom")

        # unite organisationelle
        child.expect(":", timeout=3)
        child.sendline("unite organisationelle")

        # Entreprise
        child.expect(":", timeout=3)
        child.sendline("entreprise")

        # Ville de résidence
        child.expect(":", timeout=3)
        child.sendline("ville de residenc")

        # Etat province
        child.expect(":", timeout=3)
        child.sendline("etat province")

        # Code Pays
        child.expect(":", timeout=3)
        child.sendline("FR")

        # Validation
        child.expect(":", timeout=3)
        child.sendline("oui")
        print ("Validation")

        # Pas de mot de passe => c'est celuid de la cle
        child.expect(":", timeout=3)
        child.sendline("")



    except:
        print(str(child))




    print ("done3")

if __name__ == '__main__':
    main()
