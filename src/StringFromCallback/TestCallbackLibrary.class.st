Class {
	#name : #TestCallbackLibrary,
	#superclass : #FFILibrary,
	#category : #'StringFromCallback-Libraries'
}

{ #category : #'accessing - platform' }
TestCallbackLibrary >> win32ModuleName [
	^ 'callback.dll'
]
