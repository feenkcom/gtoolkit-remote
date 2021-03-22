Class {
	#name : #BaselineOfGt4ChromeDevTools,
	#superclass : #BaselineOf,
	#category : #BaselineOfGt4ChromeDevTools
}

{ #category : #baseline }
BaselineOfGt4ChromeDevTools >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec baseline: 'Chrome' with: [
				spec repository: 'github://feenkcom/Pharo-Chrome:v0.5.127/repository' ].
		spec package: 'Gt4ChromeDevTools' with: [
				spec requires: #('Chrome' ). ]. ].

]
