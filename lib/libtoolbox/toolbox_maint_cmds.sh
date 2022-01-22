#! /usr/bin/bash

mkdoc () { echo 'hello'; }


_mkdoc_man1style_txt () {
	content="(1)                                                                                              (1)

NAME
       ::MKD_PROG:: - ::MKD_DESC_ONELINER::

SYNOPSIS
       ::MKD_CMD:: ::MKD_SUBCMD::  [<::MKD_CMD_OPTIONS::>] [::MKD_CMD_ARGS::]

DESCRIPTION
       ::MKD_DESC_LONGDESC::

OPTIONS
       --::MKD_OPT:: \"\"      ::MKD_DESC_OPTIONDESC::

OPTIONS INHERITED FROM PARENT COMMANDS
       --help[=false]      Show help for command
	   --verbose           Display more detailed output
	   --::MKD_OPT:: \"\"	  ::MKD_DESC_OPTIONDESC::

RELATED FORMATS
	   ::MKD_SECTION_TXT--RELATED::

SEE ALSO
	   ::MKD_SECTION_TXT--SEE-ALSO::

KEYWORDS
	   ::MKD_SECTION_TXT--KEYWORDS::

CATEGORY
	   ::MKD_SECTION_TXT--KEYWORDS::

COPYRIGHT
	   ::MKD_SECTION_TXT--KEYWORDS::

::MKD_METAPKG::                                          ::MKD_PRG-VERSION::                                           
"
	echo "${content}"
}