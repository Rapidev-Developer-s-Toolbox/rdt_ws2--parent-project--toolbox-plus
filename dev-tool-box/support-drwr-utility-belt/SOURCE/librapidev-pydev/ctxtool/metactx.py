from pathlib import Path  
# from random import getrandbits
from string import ascii_letters, digits
from secrets import choice

class MetaContext:
    ctx_opts = dict()

    def __init__(self):
         
        self._setctxid()
        self.set_basepath()
        self.shellpath = None
        env_vdict = dict()

    def set_basepath(self, path: Path):
        bp: Path = path
        self.ctx_opts['basepath'] = bp

    def addenvvar(self, key, value):
        self.env_vdict[key] = value
        return True

    def _setctxid(self):
        if self.ctx_opts['id'] != None:
            return self.ctx_opts['id']
        alphabet = ascii_letters + digits
        while True:
            self.id = ''.join(choice(alphabet) for i in range(10))
            if (any(c.islower() for c in self.id)
                    and any(c.isupper() for c in self.id)
                    and sum(c.isdigit() for c in self.id) >= 3):
                break
        self.ctx_opts['id']