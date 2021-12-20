#! /usr/bin/env python3

from sys import argv, stdin, stdout, stderr
import argparse
import errtypes


class OptArgResolver:
    
    oar_acceptedflags =[]

    def addflags(self, *flagsandflaglists):
        '''Function to populate oar'''
        for flagorlist in flagsandflaglists
        if type(flagorlist) == str:
            '''block gets ran when addflags("string") or addflags(mystringreference) is called'''
            (self.oar_flags.append(f) for f in flagsandflaglists)
        elif type(flagorlist) == list:
            '''block gets ran when addflags(['some', 'list']) or addflags(mylist) is called'''
            (self.oar_flags.append(f) for f in flagsandflaglists)
        else:
            raise errtypes.ParamTypeException('The type of the param passed to OptArgResolver.addflags() needs to be a list or 1 or more strings')

class cliInterface:

    def cli_entrypoint_main(self, argv):
        argp = argparse.ArgumentParser()
        argp.add_argument("echo")

if __name__=='__main__':
    cliInterface.cli_entrypoint_main(argv)

