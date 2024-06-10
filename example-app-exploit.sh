#!/bin/sh
#export LD_DEBUG=libs
rm -f answer.so vulnerable /tmp/build/answer.so

echo "Building library"
echo gcc -Wl,-soname=answer.so -fPIC -shared lib.c -o answer.so
gcc -Wl,-soname=answer.so -fPIC -shared lib.c -o answer.so
read CC
echo "Building vulnerable binary"
echo gcc -Wl,-rpath="/tmp/build:$PWD" -L. -l:answer.so vulnerable.c -o vulnerable
read CC
gcc -Wl,-rpath="/tmp/build:$PWD" -L. -l:answer.so vulnerable.c -o vulnerable
echo "Running vulnerable binary"

LD_DEBUG=libs ./vulnerable

read CC
echo "Building fake library"
mkdir -p /tmp/build/
echo gcc -fPIC -shared fake.c -o /tmp/build/answer.so
gcc -fPIC -shared fake.c -o /tmp/build/answer.so
read CC
echo "Running vulnerable binary..."

LD_DEBUG=libs ./vulnerable

read CC

echo "EOF"
