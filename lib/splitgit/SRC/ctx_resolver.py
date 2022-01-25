

class ContextResolver:
    '''
    Returns a context struct (dictionary) to caller which contains (at a minimum) the commonpath for rdt_ws2, the tweenpath (usually "/dev-tool-box"), the drwr-prefix, the drwr-suffix, a list containing all of the drawer_codenames, and any other attributes which were listed in the request params (and to which it has access.)
    '''

    struct_basectx = {'commonpath': '', 
                  'tweenpath': '/dev-tool-box', 
                  'drwr-prefix': '', 
                  'drwr-suffix': '', 
                  'drawer_codenames': '', 
                  'fill1': '', 
                  'fill2': '', 
                  'fill3': ''}