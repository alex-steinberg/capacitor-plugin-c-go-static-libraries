#!/bin/sh -ex

LIBRARY_NAME="libgolib"
export CC_ARCH=arm64
IOS_TARGET_VERSION=ios13.0
IPHONEOS_SDK_PATH="$(xcrun --show-sdk-path --sdk iphoneos)"
CC="$(xcrun -sdk $IPHONEOS_SDK_PATH --find clang) -arch $CC_ARCH -isysroot $IPHONEOS_SDK_PATH -target arm64-apple-$IOS_TARGET_VERSION"
# CFLAGS="-target arm64-apple-$IOS_TARGET_VERSION -isysroot $IPHONEOS_SDK_PATH -arch $CC_ARCH -I$IPHONEOS_SDK_PATH/usr/include"
export LD_LIBRARY_PATH="$IPHONEOS_SDK_PATH/usr/lib"
$CC -c -o toetsbib.o toetsbib.c
libtool -static -o libgolib.a toetsbib.o
otool -l libgolib.a | grep -A5 VERSION
cp -v libgolib.a libgolib.h ../ios/Plugin/golib/
