#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - PostgreSQL create user test"

su - postgres -c 'createuser -S -R -D pg_test_user' > /dev/null 2>&1


t_CheckExitStatus $?
