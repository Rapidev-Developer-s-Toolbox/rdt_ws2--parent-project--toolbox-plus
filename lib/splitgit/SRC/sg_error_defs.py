class Internal_Error(Exception):
   pass

class UserInputError(IOError):
   pass

class NoDirectoryError(UserInputError):
   pass

class TooManyArgsError(UserInputError):
   pass