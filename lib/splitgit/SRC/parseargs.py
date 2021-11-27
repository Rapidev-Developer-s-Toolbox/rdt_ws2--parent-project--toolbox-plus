#!/usr/bin/python

'''
USAGE:
#      splitgit DRWR                                               ~ create a new git repository with DRWR as base directory
#      splitgit all                                     ~ same as running an instance of `splitgit DRWR` for every SG_drawer
#      splitgit (-d|--drawer) DRWR                                 ~ create a new git repository with DRWR as base directory
#      splitgit (-d|--drawer) DRWR (-p|--message-prefix) PRFX                ~ create a new git repository with DRWR as base 
#                                                                        directory and PRFX used as a prefix for any commits
#
#      Anywhere DRWR is listed above, it can be replaced with 'all' as in the second version.
#
'''

import argparse

