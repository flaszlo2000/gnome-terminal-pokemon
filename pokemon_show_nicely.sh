#!/bin/sh
POKEMON_NAME_WITH_LONGEST_LINE=$(python3 ./pokemon-colorscripts-wrapper.py)

POKEMON_NAME=$(echo $POKEMON_NAME_WITH_LONGEST_LINE | cut -d " " -f 1)
LONGEST_LINE=$(echo $POKEMON_NAME_WITH_LONGEST_LINE | cut -d " " -f 2)
SHINY=$(echo $POKEMON_NAME_WITH_LONGEST_LINE | cut -d " " -f 3)

LINE_COUNT=$(pokemon-colorscripts -n $POKEMON_NAME | wc -l)

if [ -n "$SHINY"  ]; then
    LINE_COUNT=$(($LINE_COUNT+1))
fi

gnome-terminal --profile=pokemon --geometry=$LONGEST_LINE"x"$LINE_COUNT -- pokemon_show_and_wait $POKEMON_NAME $SHINY
