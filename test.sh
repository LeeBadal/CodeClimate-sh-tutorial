#!/usr/bin/env bash
cDIR=$(pwd)
DIR="/home/$USER/codeclimate-master"
if [ -d "$DIR" ];
then
  python3 tests/test.py
  codeclimate analyze
else
  curl -L https://github.com/codeclimate/codeclimate/archive/master.tar.gz | tar xvz -C /home/$USER/
  cd /home/$USER/codeclimate-* && sudo make install
  cd $cDIR
  codeclimate engines:install
  python3 tests/test.py
  codeclimate analyze
fi

