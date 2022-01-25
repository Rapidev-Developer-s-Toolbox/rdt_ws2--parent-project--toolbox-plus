#!/usr/bin/python

import argparse, re, os
from .sg_error_defs import *

class SgArgsContext:
    drwrs_ls = list()
    drwr_str = ''
    preflist = list()
    prefspec = None
    

class SgArgsContext_Resolver:
    
    cmd_ln_type = ''

    def __init__(self, configs_need_initialized:bool=False, argslist:list=sys.argv[1:]):
        '''
        returns a loaded SgArgsContext object to the caller. Loads it by setting it to the 
        argparse.Namespace object and letting argparse inject the resolved arguments directly into its properties. Params: 
                configs_need_initialized: boolean ~ True if the drawerpaths aren't yet set in
                    the local copies of `rdt-env.jsonc`(or .jsonA) and `scopes.rdt.conf`
                arglist: list[any] ~  the args to parse. almost always defaults to sys.argv[1:]
        '''
        
        parser = self._getparser()
        add_subcmds_add_args_and_parse(parser, arglist, configs_need_initialized)
        

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

    def _add_subp_and_parse(self, p: argparse.ArgumentParser, arglist: list):
        sp = p.add_subparsers()
        type = _determine_calltype()
        sp_p = sp.add_parser()
        if (self.cmd_ln_type == 'shortversion'):
            sp_p.add_argument('drawers', nargs='+', dest='drwrs_ls', action='append_const').parse_args(namespace='SgArgsContext')    
        else:
            sp_p.add_argument('--message-prefix', '-p', dest='SgArgsContext', action='store_const')
            if (self.cmd_ln_type == 'longversion_ls'):
                sp_p.add_argument('--drawers', '-D', nargs=1, dest='drwrs_ls', type='list', action='store').parse_args(namespace='SgArgsContext')
            elif (self.cmd_ln_type == 'longversion_str'):
                sp_p.add_argument('--drawer', '-d', nargs=1, dest='drwrs_ls', type='str', action='store').parse_args(namespace='SgArgsContext')
        
        
        self.drwrs_ls.extend(sp_p)
        return sp_p
        
    def add_subcmds_add_args_and_parse(self, 
                                       parser:argparse.ArgumentParser, 
                                       arglist:list[str], 
                                       is_initial_config:bool):
        '''
        After setting a couple of program-wide options, --version and --path-cfg-provider, parser immediately splits into 3 subcommand parsers, for sg-chip, sg-split, and sg-smash. Then for each, it sets 1 to 2 arg_groups, splitting the args specified for that subcommand into groups based on the effect they have on the program. The `autoprefix setters` are split from the specifiers. Each argument_group wraps a mutually_exclusive_group, which specifies a set of commands that cannot be called together (this is why they are grouped according to the outcome of each.) The reason for wrapping two seperate groups around each bunch of cmds is because the mutually exclusive_group currently doesn't let you set any group attributes, such as title, description, etc. 
        '''
        
        grp_global_args = parser.add_argument_group(title='global Args',
                                                    description='All args that are useable, and which have the same meaning all throughout the use-cases for the program. Their usage, the types of (and accepted sources for) IO, etc. all stay the same in every version of the command, or else they are `solo` options like --version. `--help` is not listed here, as the output is different for each context in which it is called')
        grp_global_args.add_argument('-V', '--version', action='version', version='%(prog)s 0.0')
        grp_global_args.add_argument('--verbose', '-v', action='count', default=0)
        
        subparsers = parser.add_subparsers(title='splitgit subcommands',
                                           description='valid subcommands',
                                           help='additional help')
    
        # create the parser for the "chip" command
        parser_chip = subparsers.add_parser('chip')
        parser_chip.set_defaults(func='splitone')
        
        grp_chip_pref = parser_chip.add_argument_group(title='Prefix Options ~ sg-split', 
                                                         description='Modifiers of the commit-autoprefix preset for the`splitgit split`command')
        meg_chip_pref = grp_chip_pref.add_mutually_exclusive_group(required=False)
        meg_chip_pref.add_argument('-P', '--prefix', type=list[str], default=None)
        meg_chip_pref.add_argument('-p', '--prefspec', type=str, default='%*drwrid*%')
        
        grp_chip_drwr = parser_chip.add_argument_group(title='drawer_specifiers ~ sg-chip: modifiers',
                                                         description='args used to specify the drawer on which the `splitgit chip` command will operate')
        meg_chip_drwr = grp_chip_drwr.add_mutually_exclusive_group(required=True)
        meg_chip_drwr.add_argument('drwr', type=os.pathlike, default=1)
        meg_chip_drwr.add_argument('-d', '--drawer', type=float)
        
        # create the parser for the "split" command
        parser_split = subparsers.add_parser('split')
        parser_split.set_defaults(func='split_n')
        
        grp_split_pref = parser_split.add_argument_group(title='Prefix Options ~ sg-split', 
                                                         description='Modifiers of the commit-autoprefix preset for the`splitgit split`command')
        meg_split_pref = grp_split_pref.add_mutually_exclusive_group(required=False)
        meg_split_pref.add_argument('-P', '--prefixlist', type=list[str], default=None)
        meg_split_pref.add_argument('-p', '--prefspec', type=str, default='%*drwrid*%')
        
        grp_split_drwrs = parser_split.add_argument_group(title='drawer_specifiers ~ split: modifiers',
                                                         description='args used to specify the drawers on which the `splitgit split` command will operate')
        meg_split_drwrs = grp_split_drwrs.add_mutually_exclusive_group(required=True)
        meg_split_drwrs.add_argument('drwr', type=os.pathlike, default=1)
        meg_split_drwrs.add_argument('-d', '--drawer', type=float)
        
        # create the parser for the "smash" command        
        parser_smash = subparsers.add_parser('smash')
        parser_smash.set_defaults(func='splitall')
        
        grp_smash_pref = parser_smash.add_argument_group(title='Prefix Options ~ sg-split', 
                                                         description='Modifiers of the commit-autoprefix preset for the`splitgit split`command')
        meg_smash = parser_smash.add_mutually_exclusive_group(required=False)
        meg_smash.add_argument('-P', '--prefixlist', type=list[str], default=None)
        meg_smash.add_argument('-p', '--prefspec', type=str, default='%*drwrid*%')
        
        resargs_ctx = SgArgsContext()
        parser.parse_args(argslist, namespace=resargs_ctx)
        return True 

        
    def _get_configsource_pref_fromfile():
        with open('../CONFIG/splitgit.conf') as cfgfile:
            pass # TODO: finish me!!!
        

    def process_namespace_obj(self):
        td = self._determine_calltype(argslist)     
        if td == True:
            p = self.getparser()
            
        else:
            raise UserInputError('If the command line includes positional \"dash-dash\" options, the first option must be either \"--drawer\", \"--drawers\", or the short form of one of these (\"-d\" or \"-D\"). For usage info, see \"splitgit --help\"')

    

    
#   
