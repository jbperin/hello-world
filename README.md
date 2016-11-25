# hello-world
tutorial github
essai de modif pour tester le pull request

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





