#!/bin/sh

task context | grep '^[a-z]*' --only-matching | dmenu | xargs task context
