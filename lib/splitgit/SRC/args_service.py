#!/usr/bin/python

import argparse, re
from .sg_error_defs import *

class SgArgsContext:
    drwrs_ls = list()
    drwr_str = ''
    prefix = None
    

class SgArgsContext_Resolver:
    
    cmd_ln_type = ''

    def __init__():
        pass

    usage_body = '''
    #             COMMAND-LINE-USAGE:
    #  splitgit (-h|--help)
    #               ~ print this Usage message and exit with status 0
    #  
    #  splitgit DRWR [DRWR ...]
    #               ~ create new git repository for each DRWR with DRWR as base 
    #                 directory.
    #
    #  splitgit all                                                               
    #               ~ same as running an instance of `splitgit DRWR` for every 
    #                 SG_drawer.
    #
    #  splitgit (-d|--drawer) DRWR                                                
    #               ~ create a new git repository with DRWR as base directory
    #
    #  splitgit (-d|--drawer) DRWR (-p|--message-prefix) PRFX                            
    #               ~ create a new git repository with DRWR as base directory 
    #                 and PRFX used as a prefix for any commits
    #
    #             PYTHON-SCRIPT-SPECIFIC-USAGE
    #
    #  splitgit (-D|--drawers) list(DRWR, [DRWR, ...])       
    #               ~ Takes in a Python list of DRWRs, and creates a new git 
    #                 repository for each item listed therein. 
    #
    #  splitgit (-D|--drawers) list(DRWR, [DRWR, ...])  (-p|--message-prefix) PRFX       
    #               ~ Same as above, but with a commit prefix supplied 
    #
    '''

    def printusage(): 
        print(usage_body)
        return True
    
    def _getparser():
        progepilogue_msg = '''Anywhere DRWR is listed above, it can be a path to an RDT drawer, 
        a drawer`s base directory filename, or the string `all` as in the 
        second version. If a path is given, the drawer at that path will be the 
        resulting repo`s base. If the given argument is a filename, splitgit 
        will use its available resources to try and find a drawer with that 
        filename. If `all` is passed, it will search for the parent directory 
        of the drawers (usually `.../dev-tool-box/`), and it will then create 
        a repo in each of its subdirectories with a name matching the pattern 
        `drwr--*-tools` or `support-drwr--*`, where * is the actual rdt drawer name.'''
        progdesc_msg = '''splitgit is an interface to the git subtree command. The idea 
        is to make it more user friendly. To use, simply enter one of the formats 
        listed below. Be sure to read the info below the list of usages. See the 
        manual with `man splitgit` for more info.'''
        #progusage_msg = '\n    %(prog)s -v|--version\n    %(prog)s -h|--help\n    %(prog)s DRAWER  [DRWR ...]\n    %(prog)s all\n    %(prog)s [options]'
        p = argparse.ArgumentParser(prog='splitgit', usage=self.usage_body, description=progdesc_msg, epilog=progepilogue_msg)
        return p

    def _determine_calltype(self, argslist: list):
        if argslist[1] == '--drawer':
            self.cmd_ln_type = 'longversion_str'
        elif argslist[1] == '-d':
            self.cmd_ln_type = 'longversion_str'            
        elif argslist[1] == '--drawers':
            self.cmd_ln_type = 'longversion_ls'
        elif argslist[1] == '-D':
            self.cmd_ln_type = 'longversion_ls'
        elif argslist[1][0] != '-':
            for arg in argslist[2:]:
                if arg[0] == '-':
                    raise ArgsFormatError("detected an option\(i.e. of th form \"-f || --foo\"\) indide a short-form command-line. If you wish to specify a prefix, you must use one of the long forms. To do this, follow the command immediately with one of the following \"--drawer(s)\" | \"-D\" | \"-d\" ", )
            self.cmd_ln_type = 'shortversion'
        else:
            return False
        return True

    def _add_subp_and_parse(self, p: argparse.ArgumentParser, arglist):
        sp = p.add_subparsers()
        type = _determine_calltype()
        sp_p = sp.add_parser()
        if (self.cmd_ln_type == 'shortversion'):
            sp_p.add_argument('drawers', nargs='+', dest='drwrs_ls', action='append_const').parse_args(namespace='SgArgsContext')    
        elif (self.cmd_ln_type != 'shortversion'):
            sp_p.add_argument('--message-prefix', '-p', dest='SgArgsContext')
            if (self.cmd_ln_type == 'longversion_ls'):
                sp_p.add_argument('--drawers', '-D', nargs=1, dest='drwrs_ls', type='list', action='store_const').parse_args(namespace='SgArgsContext')
            elif (self.cmd_ln_type == 'longversion_str'):
                sp_p.add_argument('--drawer', '-d', nargs=1, dest='drwrs_ls', type='str', action='store_const').parse_args(namespace='SgArgsContext')
        else:
            raise Internal_Error('args_service__:__line 93')
        
        self.drwrs_ls.extend(sp_p)
        return sp_p
        
        

        

    def parse(self, arglist, p):
        td = self._determine_calltype(argslist)     
        if td == True:
            p = self.getparser()
            
        else:
            raise UserInputError('If the command line includes positional \"dash-dash\" options, the first option must be either \"--drawer\", \"--drawers\", or the short form of one of these (\"-d\" or \"-D\"). For usage info, see \"splitgit --help\"')

    

    
