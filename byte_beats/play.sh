#!/bin/bash

gcc $1 -lm && ./a.out | aplay
rm a.out
