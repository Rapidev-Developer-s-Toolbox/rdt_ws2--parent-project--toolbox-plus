#!/usr/bin/python

'''
USAGE:
#      splitgit DRWR [DRWR ...]                                              ~ create new git repository for each DRWR with DRWR as base directory
#      splitgit all                                     ~ same as running an instance of `splitgit DRWR` for every SG_drawer
#      splitgit (-d|--drawer) DRWR                                 ~ create a new git repository with DRWR as base directory
#      splitgit (-d|--drawer) DRWR (-p|--message-prefix) PRFX                ~ create a new git repository with DRWR as base 
#                                                                        directory and PRFX used as a prefix for any commits
#
#      Anywhere DRWR is listed above, it can be a path to an RDT drawer, a drawer's base directory filename, or the string 
#      'all' as in the second version. If a path is given, the drawer at that path will be the resulting repo's base. If the
#      given argument is a filename, splitgit will use its available resources to try and find a drawer with that filename. 
#      if 'all' is passed, it will search for the parent directory of the drawers, and it will then create a repo in each of 
#      its subdirectories with a name matching the pattern '[drwr,]--.*-tools'. 
'''

import argparse, re

class cmdline_validator:

    def combine_args_tolist(*argsandarglists):
        combined_arglist = list()
        for argorlist in argsandarglists:
            if type(argorlist) == str:
                combined_arglist.append(argorlist)
            elif type(argorlist) == list:
                combined_arglist.extend(argorlist)
            else:
                raise argparse.ArgumentTypeError('args must be strings, options or lists')

class CustomNamespace:
    pass

class CustomAction(argparse.Action):
    pass
class ArgumentHandler:

    drwrs_list = list()
    prefix = None

    def getparser():
        progepilogue_msg = 'Anywhere DRWR is listed above, it can be a path to an RDT drawer, \
            a drawer`s base directory filename, or the string `all` as in the \
            second version. If a path is given, the drawer at that path will be the \
            resulting repo`s base. If the given argument is a filename, splitgit \
            will use its available resources to try and find a drawer with that \
            filename. If `all` is passed, it will search for the parent directory \
            of the drawers (usually `.../dev-tool-box/`), and it will then create \
            a repo in each of its subdirectories with a name matching the pattern \
            `drwr--*-tools` or `support-drwr--*`, where * is the actual rdt drawer name.'
        progdesc_msg = 'splitgit is an interface to the git subtree command. The idea \
            is to make it more user friendly. To use, simply enter one of the formats \
            listed below. Be sure to read the info below the list of usages. See the \
            manual with `man splitgit` for more info.'
        progusage_msg = '\n    %(prog)s -v|--version\n    %(prog)s -h|--help\n    %(prog)s DRAWER  [DRWR ...]\n    %(prog)s all\n    %(prog)s [options]'
        p = argparse.ArgumentParser(
                prog='splitgit',
                usage=progusage_msg, 
                description=progdesc_msg,
                epilog=progepilogue_msg)
        return p

    def determine_calltype(argslist: list):
        if argslist[1] == 
        sp = argparse.add_subparsers()

        p_shortversion = sp.add_parser()
        p_longversion = sp.add_parser()
    
        p_shortversion.add_argument('drawer', nargs='+', action='')

        p_longversion.add_argument('--drawer', '-d', nargs=1, type='str', action='')




