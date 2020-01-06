#!/bin/bash

if ! ss -tnlp | grep nginx &>/dev/null; then
    exit 1
else
    exit 0
fi
