#!/bin/sh

if [ -n "$2" ]; then
    pokemon-colorscripts -s -n $1 && python3 -c "input()"
else
    pokemon-colorscripts --no-title -n $1 && python3 -c "input()"
fi
