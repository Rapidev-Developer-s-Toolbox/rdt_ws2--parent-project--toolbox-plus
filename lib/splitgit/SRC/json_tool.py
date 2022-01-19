class JsonCreateTool:
    '''
    Creates json representation of the program state, specifically the drawer locations, so they do not need to be resolved manually every time the program is run. It creates a string of {s, }s, [s, and ]s that represent layers of nesting needed, and gets values from the vals dict. Will only work for very simple objs.
    '''

    FLAG_no_open_arrays = True
    FLAG_no_open_objects = True
    state_list = []
    levels = 0
    # 'minified' (one-line), 'compact' ( "key": {\n ), or 'pretty' ( "key": \n{\n )
    write_format = 'pretty'
    
    
    def open_array(self):
       self.state_list.append('[')
       self.levels += 1
           
    def close_array(self):
       if (self.state_list[-1] != '['):
          if FLAG_no_open_arrays:
             raise JsonNestingError("Can not close array. There are no arrays opened.")
          else:
             raise JsonNestingError("Can not close array. There are open elements nested within. Close inner objects first.")
          return False
       else:
          self.state_list.pop(-1)
          self.levels -= 1
          
    def open_object():
       self.state_list.append('{')
           
    def close_object():
       if (self.state_list[-1] != '['):
          if FLAG_no_open_arrays:
             raise JsonNestingError("Can not close array. There are no objects opened.")
          else:
             raise JsonNestingError("Can not close object. There are open elements nested within. Close any inner arrays first.")
          return False
       else:
          self.state_list.pop(-1)
          self.levels -= 1
                
            
            
class JsonReader:
    
    def locate_obj_in_f(amt_layers_to_skip):
       f = open('demofile.txt', 'r')
       print(f.readline())
    
    def parse_object(file, firstline, lastline):
       for l in file:
          
       
    def parse_line(openedfile, index):
       for l in f:
          rl = f.readline()
       for cursor2pos in range(len(l)):
          e