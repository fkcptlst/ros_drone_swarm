# -*- coding:utf-8  -*-
#This module has some useful tool for coloring texts, used in logging

COLORS = {"default": "\033[0m", "red": "\033[31m", "green": "\033[32m", "yellow": "\33[1;33m"}
def color(name, text):
    return COLORS[name] + text + COLORS["default"]