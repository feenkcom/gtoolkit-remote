Class {
	#name : #BaselineOfGt4PythonBridge,
	#superclass : #BaselineOf,
	#category : #BaselineOfGt4PythonBridge
}

{ #category : #baseline }
BaselineOfGt4PythonBridge >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec 
				baseline: 'DAPPythonBridge' with: [ 
					spec repository: 'github://feenkcom/pharo-debugadapterprotocol:main/src' ];
				package: 'Gt4PythonBridge' with: [ spec requires: #( DAPPythonBridge ) ]
		]
]
