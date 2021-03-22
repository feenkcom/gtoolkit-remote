Class {
	#name : #BaselineOfGt4PythonBridge,
	#superclass : #BaselineOf,
	#category : #BaselineOfGt4PythonBridge
}

{ #category : #baseline }
BaselineOfGt4PythonBridge >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec baseline: 'PythonBridge' with: [
				spec repository: 'github://feenkcom/PythonBridge:v0.5.135/src' ].
		spec package: 'Gt4PythonBridge' with: [
				spec requires: #('PythonBridge' ). ]. ].

]
