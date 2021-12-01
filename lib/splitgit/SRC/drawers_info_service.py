
from os import walk
from os.path import splitext
from re import compile, search, fullmatch

class DrawerInfoService:
   '''Contains the logic for storage and retrieval of drawer info'''
   
   def __init__ (self):
      self.rejson = compile('.*\.json')
   
   def _findjsonfile(start, name):
      '''The same as unix `find START -type f -name NAME`. Searches (using walk in top-down mode) all subdirs of `start` for json file with the name provided. params: start = the root of the search; name = the file to look for; name can omit the ext., the function will append it if it is not there.'''
      res_str = ''
      if(search(self.rejson, name) == None):
   #  if(count('.json', os.path.splitext(name)) == 0)
         name = name + '.json'
      for root, dirs, files, rootfd in os.walk(start):
         for fname in files:
            if(fullmatch(name, string) != None):
               res_str = dir + name
      return res_str
            fullmatch(string[, pos[, endpos]])
   