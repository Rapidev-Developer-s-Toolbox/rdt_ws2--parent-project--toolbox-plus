class Internal_Error(Exception):
    '''
    Errors not caused by user, caused by a program bug
    '''
    pass

class UserInputError(IOError):
    '''
    Raised when user input is not in the correct format
    '''
    pass

class ArgsCountError(UserInputError):
    '''
    Too few or too many args given when calling splitgit
    '''
    pass

class ArgsFormatError(UserInputError):
    '''
    Too few args given when calling splitgit
    '''
    pass

class NoDirectoryError(UserInputError):
    '''
    Directory arg that is given when calling splitgit, and which needs to resolve to an actual dir location, does not point to a directory
    '''
    pass

class TooManyArgsError(ArgsCountError):
    '''
    Too few args given when calling splitgit
    '''
    pass

class TooFewArgsError(ArgsCountError):
    '''
    Too few args given when calling splitgit
    '''
    pass
class DrawerpathError(Exception):
    '''
    For all errors raised within The Drawerpath class
    '''
    pass
class DrawerpathNotInitializedError(DrawerpathError):
    '''
    Raise if Drawerpath instance is somehow used without instance vars first being initialized with provided setters
    '''
    raise InternalError('Were all params set for Drawerpath instance?')
