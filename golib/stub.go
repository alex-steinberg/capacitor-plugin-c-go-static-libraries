package main

//#include <string.h>
//#include <stdlib.h>
import "C"
import "unsafe"

// go build -buildmode=c-archive -o libgolib.a; cp libgolib.a ../ios/App/golib/
func main() {
}

//export GoodMorning
func GoodMorning(result *C.char, length C.int) {
	if int(length) > 25 {
		cString := C.CString("Good morning says we - Golang version")
		C.strcpy(result, cString)
		C.free(unsafe.Pointer(cString))
	}
}	
