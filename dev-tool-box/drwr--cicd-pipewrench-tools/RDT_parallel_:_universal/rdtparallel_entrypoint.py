#! /usr/bin/env python3

from sys import argv, stdin, stdout, stderr
import argparse

# ~! GLOBALS !~
# These are to be mapped to the environment variables used by the program.

def cli_entrypoint_main(self, argv):
    argp = argparse.ArgumentParser()
    argp.add_argument("echo")

if __name__=='__main__':
    cli_entrypoint_main()
