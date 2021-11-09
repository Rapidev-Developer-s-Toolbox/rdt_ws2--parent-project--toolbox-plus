#! /usr/bin/env python
class Cph_Sh_Wrapper:
	'''An object designed to be loaded by CPH test-runner and then to load another program. To get the output back, it will create a FIFO pointed to it's own output, then call the command with an output rerout to the FIFO.'''
	rdt_script = ''
 	rdt_script_args = ''
	rdt_file = ''
	rdt_command = 'xargs '
 
	def _get_input (self):
 		rdt_inp = input()