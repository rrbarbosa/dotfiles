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


def parse():
    global threshold,argus_file
    parser = argparse.ArgumentParser()
    #Examples
    #parser.add_argument('argus_file')
    #parser.add_argument('-w', dest='fname', type=str, default='services.txt',
            #help="output file (default=services.txt)")
    #parser.add_argument('-t', dest='threshold', type=int, default=0, 
            #help="threshold for heuristic method (default=0)")
    args = parser.parse_args()
    #argus_file = args.argus_file
    #threshold = args.threshold

####
##main code comes here
####

parse(sys.argv[1:])


