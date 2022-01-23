import os, pathlib, random
from pathlib import Path

class Drwrpath:
    ''' this is for setting the context path of a drawer. contains drwrpath, a list containing the RDT basepath, the "between" path, and the drawername'''
    
    basepath: pathlib.Path = ''
    tweenpath: pathlib.Path = ''
    drwrname: str = ''
    
    def __init__(self, base, tween, drawername):
        self.set_basepath(base)
        self.set_tweenpath(tween)
        self.set_drwrname(drawername)
        self.set_drwrpath(self.get_basepath(), self.get_tweenpath(), self.get_drwrname())
    
    def set_basepath(self, basepath_str: str):
        self.basepath = self.str_to_normalized_path(basepath_str)
    
    def set_tweenpath(self, pathlike):
        self.tweenpath = self.str_to_normalized_path(basepath_str)
        
    def set_drwrname(self, str_name):
        self.basepath = self.str_to_normalized_path(str_name)
        
    def set_drwrpath(self, base, tween, drwrname):
        b = str(self.get_basepath())
        t = str(self.get_tweenpath())
        d = str(self.get_drwrname())
        trypath = self.str_to_normalized_path(b + t + d)
        if os.path.isdir(trypath):
            self.drwrpath = trypath
        else: 
            raise NoDirectoryError('The directory resulting from the specified args does not exist.')
        
    def get_basepath(self):
        return self.basepath
        
    def get_tweenpath(self):
        return self.tweenpath
        
    def get_drwrname(self):
        return self.drwrname
    
    def get_drwrpath(self):
        return self.drwrpath
    
    def get_parent(self):
        '''Returns the full path of the directory that holds the drawer. '''
        return os.path.dirname(drwrpath)

    def to_list(self):
        drwr_pathlist = list(self.drwrpath.parts)
        drwr_pathlist.append()  
        
    def str_to_normalized_path(istring: str)-> Path:
        if istring == '' or istring == ' ':
            raise TooFewArgsError('Must provide a pathname to this method.')
            exit(1)
        elif istring.startswith('/'):
            output = istring
        else:
            output = '/' + istring
        return Path(output)
        

class Drawer:
    '''If the base directory is unknown, it can be omitted in constructor calls, but it must be replaced with an empty string.'''
    drwr_pref = ''
    drwr_id = ''
    drwr_suff
    drwr_dirname = ''
    locationpath: pathlib.Path= ''
    list
    locpath_parts: list[str] = ''
       
    def __init__(self, basedir_path,tweendir_path):
        self.id = random
        self.parentpath = basedir
        self.poss_locationpaths = pathlib.glob(basedir.append('/**/*drwr-*'))
        self.locpath_parts = list().append('/').extend(list(self.locationpath.split('/')))
        
    def build_drwr_dirname_from_drwr_id(self, id, pref, suff):
        pass
        
    def set_drwr_pref(self, str_pref):
        self.drwr_pref = str_pref
               
    def set_drwr_id(self, str_id):
        self.drwr_id = str_id
        
    def set_drwr_suff(self):
        self.drwr_suff = str_suff
        
    def get_drwr_pref(self):
        return self.drwr_pref

    def get_drwr_id(self):
        return self.drwr_id
        
    def get_drwr_suff(self):
        return self.drwr_suff