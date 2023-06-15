#!/bin/bash
DISPLAY=:0 zenity --info --text="You are $(expr `date +%Y` - 1986) years old today!"
