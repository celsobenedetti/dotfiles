#!/bin/bash

truncate -s 0 /tmp/tmp.md 2>/dev/null
nvim /tmp/tmp.md
truncate -s 0 /tmp/tmp.md 2>/dev/null
