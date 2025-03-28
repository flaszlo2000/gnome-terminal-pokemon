#!/usr/bin/env python3

from subprocess import run, PIPE
from re import sub as re_sub

proc = run("pokemon-colorscripts -r 1-8".split(), stdout = PIPE)

pokemon_data = proc.stdout.decode()
pokemon_name = pokemon_data[:pokemon_data.find("\n")]
shiny = pokemon_name.endswith("(shiny)")

cleaned_ascii_art = re_sub(r'\x1b\[[0-9;]*m', '', pokemon_data) # remove every ascii art metadata
# get the longest line with the name (that might be the longest if its shiny)
longest_line = max(map(lambda line: len(line), cleaned_ascii_art.split("\n") + [pokemon_name])) 

if shiny:
    pokemon_name = pokemon_name.replace(" (shiny)", "")

print(
    pokemon_name,
    longest_line,
    shiny or ""
)
