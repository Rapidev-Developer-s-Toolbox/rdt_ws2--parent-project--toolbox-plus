**ABOUT**

Drawer-name: drwr-codemode-tools
Drawer-description: 
Drawer-dependencies: DirecTree, 
drawer-level-interface(s): 
  01:
    name: CodeMode
    synopsis: 
      1: cfgsaw [options] [create | replace | copy | ] output
      2: cfgsaw --help (short: -h)  
      3: cfgsaw --version  (short: -v)  
    options: 
      for-create: --verbose --from-temp (TEMPLATE) --type (rc | json | yml | directives-1) --language (LANGUAGE)  -vVftl
      for-copy: --input-file     -i
    description: This drawer is reserved for storing tools that work with config files in some way.

**TOOLS**

Tools-List:
  Top-level:
    01:
      name: cfgtemp 
      synopsis: cfgtemp [options] < create | locate | delete | to-parser | copy | delete >
      options:
      description:
    02:
      name: cfgbuild
      synopsis: interface [options] [args]
      options:
      description:
    03:
      name: cbsettings 
      synopsis: cfgtemp [options] < create | locate | delete | to-parser | copy | delete >
      options:
        --version:
        --menus
        --interactive
        --
      description: Confbuild settings via command, selectable options, or interactive mode
    04:
      name: csawdefaults
      synopsis: interface [options] [args]
      options: --version || --menus || --interactive || --
      description:

**AUTHORS**

**SEE ALSO**