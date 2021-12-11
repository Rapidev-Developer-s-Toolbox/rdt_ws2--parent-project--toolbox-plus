SUPERuser(7)                                            RDT Drawers: SUPERuser-tools                                         SUPERuser(7)

### NAME
        Rapidev Developer's Toolbox: SUPERuser-tools Drawer

### DESCRIPTION

#####         Drawer-name: *drwr-SUPERuser-tools*
#####         Drawer-description:  

.       This drawer is what will make the RDT Shell so special! This includes the "extras" to which we refer in
.       the main documentation. The tools provided in the standard linux environment can do alot, but can they, for
.       provide some functionality that is not available in linux out of the box. The goal is to make sh a language
.       with all of the features of any other language, at least for working with Linux.
.       example, return a file descriptor for a directory and give back its metadata? To be clear, these tools each
.
.       Is there a tool that you have always wished Linux had available? If you have any ideas or suggestions for 
.       tools to create for this drawer, email me at $EMAIL."
.       Drawer-dependencies: 
.       drawer-level-interface(s):
.         01:
.           name:
.           synopsis:
.             1:
.             2:  
.             3:
.           options:
.           description: This drawer is reserved for storing tools that work with config files in some way.
.
### TOOLS
.
.       Tools-List:
.         Top-level:
.           01:
.             name: cfgtemp 
.             synopsis: cfgtemp [options] < create | locate | delete | to-parser | copy | delete >
.             options:
.             description:
.           02:
.             name: cfgbuild
.             synopsis: interface [options] [args]
.             options:
.             description:
.           03:
.             name: cbsettings 
.             synopsis: cfgtemp [options] < create | locate | delete | to-parser | copy | delete >
.             options:
.               --version:
.               --menus
.               --interactive
.               --
.             description: Confbuild settings via command, selectable options, or interactive mode
.           04:
.             name: csawdefaults
.             synopsis: interface [options] [args]
.             options: --version || --menus || --interactive || --
.             description: Tool for configuration of default 'fallback' values for configsaw configuration options
.
### AUTHORS
.
. - - - - - **R***apidev*
. - - - - - - - **D***evelopment*
. - - - - - - - - - **T***eam - - !!!!*

.
### SEE ALSO

        **Rapidev(7)**          **codemode(7)**          **codemode(1)**           **splitgit(1)**    