#! /usr/bin/env python3

from sys import argv, stdin, stdout, stderr
import argparse
import errtypes


class OptArgResolver:
    '''Service Class for validation of user input. Takes in a json object representing and describing the accepted flags. 
        TERMS:
            flag: user input... word that will be validated and either changed to opt/arg or dropped
            word: character group in the form of ( -[a-zA-Z0-9] | --[a-zA-Z0-9]* | [a-zA-Z0-9]* )
            modifier: Word that triggers action, or a change in action of a program. Option or argument
            opt: option 
            arg: argument
            optarg: an option that expects an argument (optarg-opt) followed by the expected argument (optarg-arg).'''
    
    oar_acceptedflags =[]

    def addflags(self, *flagsandflaglists):
        '''Function to populate oar'''
        ((self.oar_acceptedflags.append(flag) for flag in flaglist) for flaglist in flagsandflaglists if type(flagorlist) == list)
        (self.oar_acceptedflags.append(flag) for flag in flagsandflaglists if type(flag) == str)

        for flagorlist in flagsandflaglists:
            if type(flagorlist) == str:
            #block gets ran when addflags("string") or addflags(mystringreference) is called'''
                for f in flagsandflaglists:
                    self.oar_acceptedflags.append(f) 
            elif type(flagorlist) == list:
                #block gets ran when addflags(['some', 'list']) or addflags(mylist) is called
                for f in flagorlist:
                    self.oar_acceptedflags.append(f) 
            else:
                raise errtypes.ParamTypeException('The type of the param passed to OptArgResolver.addflags() needs to be a list or 1 or more strings')



