#!/bin/sh

nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits | awk '{printf "%.1fGB\n", $1 / 1024}'

