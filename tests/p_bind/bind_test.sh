#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - bind test."

dig +timeout=1 +short @127.0.0.1 localhost | grep -q '127.0.0.1'

t_CheckExitStatus $?
