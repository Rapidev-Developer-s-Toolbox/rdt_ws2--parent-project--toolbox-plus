**ABOUT**

Contains resources, such as libraries and common files, that need to be shared 
among two or more tools. Note that this is different than the "rdt_workspaces/lib/" directory, which sits outside the RDT tool-box completely and is reserved for tools dedicated to the maintainence and development of the RDT platform, framework, and toolsets / tools. 

**TOOLS**

- N/A

**LIBRARIES**

  - librapi-dev
      - Shared library exposes api to support development of RDT
  - librdt
      - This is a shared library that exposes RDT's core abstractions
  - librdtsettings
      - Desc= exposses an api for creating options lists (for user settings, etc.)
  - librdtinteract
      - Exposes api for defining and displaying interactive menus in other tools
  - libargs-and-options-py
      - Provides a very user-friendly interface to the argparse module, for both source and shell
  - libargs-and-options-sh
	  - Source-able argopt solution for shell scripts; written in bash