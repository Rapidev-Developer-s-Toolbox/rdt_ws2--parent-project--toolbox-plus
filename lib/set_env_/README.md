# set_env_

This is sort of like a header file for other RDT tools. It sets common variables, so you can just source in a process and be confident that all is set.

To activate, when using shellscript, you only need to source with `. /path/to/set_env_`. You can also include it in any shebang line using `usr/bin/env `

Current vars list for RDT scope:
RDT_BASE
RDT_PARENT
RDT_CURRENTDIR
RDT_USER

##### Codemode / CM_Settings

CM_HOMEDIR