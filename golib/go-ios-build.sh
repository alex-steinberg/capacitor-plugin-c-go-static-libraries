#!/bin/sh -ex


IPHONEOS_SDK_PATH="$(xcrun --show-sdk-path --sdk iphoneos)"
export CGO_ENABLED=1
export GOOS=ios
export PATH="$PATH:$GOROOT/bin"
BUILD_DIR="`pwd`/build/iphone"
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"
LIBRARY_NAME="libgolib"
export CC_ARCH=arm64
IOS_TARGET_VERSION=ios13.0
export CC="$(xcrun -sdk $IPHONEOS_SDK_PATH --find clang) -arch $CC_ARCH -isysroot $IPHONEOS_SDK_PATH -target arm64-apple-$IOS_TARGET_VERSION"
export CXX="$(xcrun -sdk $IPHONEOS_SDK_PATH --find clang++) -arch $CC_ARCH -isysroot $IPHONEOS_SDK_PATH -target arm64-apple-$IOS_TARGET_VERSION"
export CFLAGS="-target arm64-apple-$IOS_TARGET_VERSION -isysroot $IPHONEOS_SDK_PATH -arch $CC_ARCH -I$IPHONEOS_SDK_PATH/usr/include"
export LD_LIBRARY_PATH="$IPHONEOS_SDK_PATH/usr/lib"
export GOARCH=arm64
export CGO_CFLAGS="-isysroot $IPHONEOS_SDK_PATH -arch $CC_ARCH  -target arm64-apple-$IOS_TARGET_VERSION"
export CGO_LDFLAGS="-isysroot $IPHONEOS_SDK_PATH -arch $CC_ARCH  -target arm64-apple-$IOS_TARGET_VERSION"
go clean -cache
go build -v -x -buildmode=c-archive -o "$BUILD_DIR/${LIBRARY_NAME}.a"
ls -l $BUILD_DIR
cp -v "$BUILD_DIR/${LIBRARY_NAME}.a" "$BUILD_DIR/${LIBRARY_NAME}.h" ../ios/Plugin/golib/
