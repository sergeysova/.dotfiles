#!/bin/bash

sed -e '/^\/\/*/g' npmrc > npmback
cat npmback > npmrc
rm npmback
