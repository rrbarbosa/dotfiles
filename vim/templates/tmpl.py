#!/usr/bin/env python

'''

SYNOPSIS

    TODO 

DESCRIPTION

    TODO This describes how to use this script.
    This docstring will be printed by the script if there is an error or
    if the user requests help (-h or --help).

AUTHOR

    Rafael R. R. Barbosa <r.barbosa@utwente.nl>

LICENSE

    This script is in the public domain.

'''

'''
VERSION

TODO
    
'''

import sys
import os
import getopt
import traceback
#Use debug_here() for ipython "breakpoint"
#import IPython
#try: #ugly hack to find IPython debugger
    ##version 0.11 or before (?)
    #debug_here = IPython.Debugger.Tracer()
    ##print ".11"
#except AttributeError: 
    ##version 0.12  
    #debug_here = IPython.core.debugger.Tracer()
    ##print ".12"


def usage():
    print __doc__

def parse(argv):
    try:
        opts, args = getopt.getopt(argv, "h")
    except getopt.GetoptError,e:
        print "Error: ",e
        usage()
        sys.exit(2)
    # If options are passed, overwrite globals
    if len(opts) > 0:
        #global 
        pass

    for opt, arg in opts:
        if opt in ("-h", "--help"):
            usage()
            sys.exit(0)
        #elif:
            #something

if __name__ == '__main__':
    try:
        parse(sys.argv[1:])

        ####
        ##main code comes here
        ####

    #except KeyboardInterrupt, e: # Ctrl-C
        #raise e
    #except SystemExit, e: # sys.exit()
        #raise e
    except Exception, e:
        raise e

