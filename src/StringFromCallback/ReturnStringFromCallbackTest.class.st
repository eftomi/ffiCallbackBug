Class {
	#name : #ReturnStringFromCallbackTest,
	#superclass : #TestCase,
	#category : #'StringFromCallback-Tests'
}

{ #category : #tests }
ReturnStringFromCallbackTest >> callCallbackWithInt: aNumber withCallback: aFFICallback [
	^ self ffiCall: #(int TestCallbackWithInt(int aNumber, FFICallback aFFICallback))
]

{ #category : #tests }
ReturnStringFromCallbackTest >> callCallbackWithString: aString withCallback: aFFICallback [
	^ self ffiCall: #(const char * TestCallbackWithInt(const char * aString, FFICallback aFFICallback))
]

{ #category : #tests }
ReturnStringFromCallbackTest >> callMultuplyBy10: aNumber [
	^ self ffiCall: #(int TestMultuplyBy10(int aNumber))
]

{ #category : #tests }
ReturnStringFromCallbackTest >> ffiLibrary [
	^ TestCallbackLibrary
]

{ #category : #tests }
ReturnStringFromCallbackTest >> testCallbackWithInt [
"Call 

int TestCallbackWithInt(int inputFromPharo, int (*callPharoInt)(int inputToPharoInt)) 

which takes a callback function as a second parameter"

	| cb |
	cb := FFICallback new 
		signature: #(int (int n))  
		block: [ :someNumber | someNumber * 2 ] .
	self assert: (self callCallbackWithInt: 5 withCallback: cb)  equals: 20.
]

{ #category : #tests }
ReturnStringFromCallbackTest >> testCallbackWithString [
"Call 

const char * TestCallbackWithString(const char* inputFromPharo, const char* (*callPharoString)(const char* inputToPharoString))

which takes a callback function as a second parameter; function returns a pointer to a C string"

	| cb |
	cb := FFICallback new 
		signature: #(const char * (const char * s)) 
		block: [ :someString | someString, ' ', someString ].
	self assert: (self callCallbackWithString: 'Example' withCallback: cb)  equals: 'Example ExampleExample Example'.
]

{ #category : #tests }
ReturnStringFromCallbackTest >> testMultipliedBy10 [
"Simple ffiCall to check the environment"
	self assert: (self callMultuplyBy10: 5)  equals: 50.
]
