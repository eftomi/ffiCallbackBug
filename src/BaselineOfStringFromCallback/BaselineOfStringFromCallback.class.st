Class {
	#name : #BaselineOfStringFromCallback,
	#superclass : #BaselineOf,
	#category : #BaselineOfStringFromCallback
}

{ #category : #baselines }
BaselineOfStringFromCallback >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
				"Packages"
				spec package: 'StringFromCallback'.
				"Groups"
				spec group: 'default' with: #('StringFromCallback'). 
			 ]
]
