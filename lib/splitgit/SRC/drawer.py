import os, pathlib, random

class Drawer:
    '''If the base directory is unknown, it can be omitted in constructor calls, but it must be replaced with an empty string.'''
    drwr_id = ''
    drwr_name = ''
    locationpath: pathlib.Path= ''
    locpath_parts: list[str] = ''
       
    def __init__(self, basedir):
        self.id = random
        self.parentpath = basedir
        self.poss_locationpaths = pathlib.glob(basedir.append('/**/*drwr-*'))
        self.locpath_parts = list().append('/').extend(list(self.locationpath.split('/')))