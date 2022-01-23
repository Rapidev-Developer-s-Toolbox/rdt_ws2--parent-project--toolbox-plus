import os, sys, getopt 
from pathlib import Path

class RepoCracker:
   
    REPO_BASE_PATH = ''   
    FLAG_COMPUTE_PATH = False
       
    # args = (repobase, manually_computepath)
    def __init__(self, *args, **kwargs):
        self.REPO_BASE_PATH = pathlib.Path(*args[0])
        if(args[1] == True):
            self.FLAG_COMPUTE_PATH = True

    def crack_repo(path):
        repo_path = Path(path)
      
    def resolve_relativepath(self, basepath, drawerpath):
        '''returns a dictionary (rel_path_dict) containing a boolean (rel_path_dict['is_sub']) which is true when `drawerpath` is a sub-directory of `basepath`, and a string (rel_path_dict['path']) corresponding to the repative path for drawer directory from base directory.'''
        curr = os.getcwd()
        orig_path = pathlib.Path('.')
         
        drwr_path = pathlib.Path(drawerpath) 
        base_path = pathlib.Path(basepath)
      
        rel_path_dict = {'is_sub': '', 'path': ''}
         
        if(drwr_path.is_relative_to(base_path)):
            rp = drwr_path.relative_to(base_path)
            rel_path_dict['is_sub'] = True
            rel_path_dict['path'] = rp
            return rel_path_dict
        else:
            rel_path_dict['is_sub'] = False
            bpl = list(base_path.parts())
            dpl = list(drwr_path.parts())
            rpl = []
            common_dirs = 0
            backups = 0
            for i in range(len(bpl)):
                if(dpl[i] == bpl[i]):
                    common_dirs += 1
                else:
                    backups = len(bpl) - common_dirs
                    for j in range(backups):
                        rpl[j] = '..'
                    for m in range(common_dirs, len(dpl)):
                        rpl.append(dpl[k])
               rp = self.__list_to_path(rpl)
               rel_path_dict['path'] = rp
               return rel_path_dict
         #if this line is parsed, something is wrong
         raise Internal_Error('something went wrong')
 
   # make a local targetlist including all children of `parent` that match `pattern`
   def mk_local_targetlist_frmchldrn(self, parent, pattern):
      if(parent[0] == '/'):
         if(parent[-1] != '/'):
            parent.append('/')
            base_path = pathlib.Path(parent)
         locals = []

	# TODO uncomment & define for public version; not needed for the first version
   # make a local targetlist including all children of `parent` except excluded
   # def mk_local_trgtls_fromchildren(self,parent,pattern):

   def mk_drawerlist_remoted():
      True
   

   def __list_to_path(pathlist):
      '''private helper method. takes in a list rep. of PATH and outputs the pathlib.Path rep.'''
      res = ''
      beg = 0
      if(pathlist[0] == '/'):
         res = '/'
         beg = 1
      for i in range(beg, len(pathlist)):
         pathlist[i].append('/')
         res.append(pathlist[i])
      return pathlib.Path(res)

   def __is_repo(dirpath):
      os.scandir()
      
   def __cleanpath(path):
      return Path(path).with_suffix(suffix)