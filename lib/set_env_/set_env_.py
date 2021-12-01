#! /usr/bin/env python

import os

class Environment_Builder:       
   '''Contains the logig for initializing the RDT environment on a linux system. Any time you run an instance of an rdt script, it should be run using `rdt_run(script)`. When importing RDT modules, immediately after the imports, include the line `rdt_configure()`. Most scripts / modules contain logic that ensures they are run in this way, but to be sure, config functions should be explicitly called.'''
   pref = 'RDT_CONF=( '
   suf = ' )'
   ev_list = []

   def __fmt_key(key):
          return '['+ key + ']'

   def __fmt_assignment(self, key, value):
      fk = self.__fmt_key(key)
      res = fk + '=' + value + ' '
      
   def __set_envstr(self):
      for i in ev_list:
         varstr += i
      envstr = pref + varstr + suf
      return envstr
   
   def __add_from_varslist_file(path):
      return True

   def __add_to_varslist_file(path):
      vlf = openvlf(path)   
      

   def __init__(self, ev_dict):
      '''accepts any amt of params. Each must be in a dict in the form {'k': 'v', ...}'''
      kl = keys(ev_dict)
      vl = values(ev_dict)        
      for i in range(vl):
         self.addev_tolist(kl[i], vl[i])
      return True
      if(os.getenv('RDT_CONF') == None):
         self.addlist_toenv(self.ev_list)
             
   def addev_tolist(self, key, value):
      ev = self.__fmt_assignment
      self.evf_list.append(ev)

   def addlist_toenv(self, key, value):
      if(self.envstr == None):
         os.environ(self.__set_envstr())
      
   
   