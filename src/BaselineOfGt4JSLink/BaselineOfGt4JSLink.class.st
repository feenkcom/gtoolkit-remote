Class {
	#name : #BaselineOfGt4JSLink,
	#superclass : #BaselineOf,
	#category : #BaselineOfGt4JSLink
}

{ #category : #baseline }
BaselineOfGt4JSLink >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec postLoadDoIt: #'postLoadSetup:'.
		spec 
			baseline: 'JavaScriptLink' with: [
				spec repository: 'github://feenkcom/JSLink:v0.5.137/src' ];
			baseline: 'Chrome' with: [
				spec repository: 'github://feenkcom/Pharo-Chrome:v0.5.125/repository' ].
		spec package: 'Gt4JSLink' with: [
				spec requires: #('JavaScriptLink' 'Chrome' ). ]. ].

]

{ #category : #'post load' }
BaselineOfGt4JSLink >> postLoadSetup: spec [
	"Register the JS debugger"

	GtJSLinkDebuggerElement register
]
