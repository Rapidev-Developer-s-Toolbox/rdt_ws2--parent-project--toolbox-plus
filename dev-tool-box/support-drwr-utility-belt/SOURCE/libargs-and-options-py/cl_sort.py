# logic for sorting out possible values for each position on the command line. For example, may decide that $2 can be an opt or an arg. Or, it may decide that it must be an arg. It may even decide that it can only exist 1.) as an arg, and 2.) if $1 is an opt that takes a param. 

# it makes these calls based on the user input in the form of configuration statements. Each round of input is a configuration. The user specifies multiple config stmts. by making multiple calls to `argopt add-conf`. A call will look like:

# ...~$  argopt add-conf [A_SINGLE_CONFIGURATION]

# for example:

# ...~$  argopt add-conf 'SUB-CMD{1}  --OPT{0:4}  ARG{1:3}' 

# Additionally an alias may be added to either the whole configuration, as in:
# 
# ...~$  argopt add-conf 'as[config1]~~ SUB-CMD{1}  --OPT{0:4}  ARG{1:3}'
# 
# ...or any of the argopt config-items with:

#...~$  argopt add-conf 'SUB-CMD{1}~as[sub]  --OPT{0:4}~as[optgrp1]  ARG{1:3}~as[A_]'

# Remember that these are program-wide aliases, so names must be unique along that scope.

# These aliases are used with `argopt add-detail` to specify additional attributes for an itemgroup, an item, or a config. e.g.:

#...~$  argopt add-detail {optargs:{0:3}; shortopt: [True, first-letter, scheme=[caps,next-const]]; partial: True; vals: [opt-a, opt-b, opt-c]} argopt-grp-1

# This says that this group of argopts can have 0 to 3 optargs (more on the vocab below), they will accept short-option alternatives (the first value of True accepts them and the remaining items configure their accepted values to the 1st letter of the associated long option and specify a resolution scheme for cases where 'first-letter' will not work.), the user can enter partial longopts (unless more than one opt shares the partial word that they give, as in supplying `--bas` for a command-line that accepts both `--base` and `--basin`.)

# the values can also be supplied with:

#...~$  argopt add-vals '[opt-a, opt-b, opt-c, base, basin]  sub'

# as the argopt command, when run as a py module, works hand-in-hand with argparse, you dont need to give values here. You can give the values directly to argparse and let argopt worry about the structure. However, It is much more convenient and much cleaner to specify the accepted configurations in just one spot. Technically, you could skip adding value based constraints altogether, but I doubt a program like that would be of any use to anyone. XD

# Once you have specified all of the configurations that you plan to allow, you are ready to start passing in args. Just call:

#...~$  argopt optarg '<ARGS ... ... >'

# For use as a py module, the values returned are the same as argparse. For the commandline, you will want to pass in a namespace with:

#...~$  argopt add-namespace  '<NAMESPACE>'

# All variables returned will be shell variables of the format NAM_LONGOPT-NAME, where NAM is the first 3 letters of the namespace. This ensures uniqueness and also makes them easier to grep later! Note that the program first scans the environment to ensure the namespace is not in use already. If it is, an alternative will be picked based on a strategy configurable via $XDG_CONFIG_HOME/argopt/conf.conf. 

#SYNTAX FOR PYTHON SOURCE CODE INVOCATION

# To un in a .py file, you more or less just need to substitute the spaces outside the quotes for a period if after the module name, or an underscore otherwise, and then trade out the quotes themselves for parentheses to make a function call. For example: 

#...~$  argopt add-namespace  '<NAMESPACE>'

# ..on the command-line will become:

#...~$  argopt.add_namespace(namespace)

# All other conventions, except where explicitly noted above, are the same for both implementations.