#!/usr/bin/python

'''
USAGE:
#      splitgit DRWR                                              ~ create a new git repository with DRWR as base directory
#      splitgit all                                     ~ same as running an instance of `splitgit DRWR` for every SG_drawer
#      splitgit (-d|--drawer) DRWR                                 ~ create a new git repository with DRWR as base directory
#      splitgit (-d|--drawer) DRWR (-p|--message-prefix) PRFX                ~ create a new git repository with DRWR as base 
#                                                                        directory and PRFX used as a prefix for any commits
#
#      Anywhere DRWR is listed above, it can be a path to an RDT drawer, a drawer's base directory filename, or the string #      'all' as in the second version. If a path is given, the drawer at that path will be the resulting repo's base. If the
#      given argument is a filename, splitgit will use its available resources to try and find a drawer with that filename. 
#      if 'all' is passed, it will search for the parent directory of the drawers, and it will then create a repo in each of #      its subdirectories with a name matching the pattern '[drwr,]--.*-tools'. 
'''

import argparse

