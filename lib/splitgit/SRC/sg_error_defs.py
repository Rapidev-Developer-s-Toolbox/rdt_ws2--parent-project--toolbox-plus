class Internal_Error(Exception):
    pass

class UserInputError(IOError):
    pass

class ArgsCountError(UserInputError):
    pass

class ArgsFormatError(UserInputError):
    pass

class NoDirectoryError(UserInputError):
    pass

class TooManyArgsError(ArgsCountError):
    pass

class TooFewArgsError(ArgsCountError):
    pass
