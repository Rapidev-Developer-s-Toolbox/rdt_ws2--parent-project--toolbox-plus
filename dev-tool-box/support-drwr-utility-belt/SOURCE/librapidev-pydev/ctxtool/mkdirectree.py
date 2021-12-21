#! /usr/bin/env python3

import os, pathlib, subprocess

def resolvecontext(context: pathlib.Path) -> pathlib.Path:
    for root, dirs, subdirs in os.walk(context):
       base = [d for d in dirs]




