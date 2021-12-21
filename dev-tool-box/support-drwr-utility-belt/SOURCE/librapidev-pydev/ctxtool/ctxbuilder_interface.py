from __future__ import annotations
from abc import ABC, abstractmethod
from typing import Any
from pathlib import Path
from random import random



class ContextBuilderIntfc(ABC):
    """
    The Builder interface specifies the process of building a context by defining each step with an
    abstract method. The definition of context is vague, and I plan on there being a significant variation
    between definitions for a given step. The main rule to follow is that all methods (except build()) need 
    to be chainable, so they need to accept and return a builder object.
    """

    def ctx_resolver():
        pass