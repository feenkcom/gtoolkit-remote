"
Load the client and server components for remote Gt access.


"
Class {
	#name : #BaselineOfGToolkitRemote,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitRemote
}

{ #category : #baseline }
BaselineOfGToolkitRemote >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'GToolkitPhlow' with: [
				spec repository: 'github://feenkcom/gtoolkit-phlow:v0.8.1193/src' ].

		spec package: 'GToolkit-RemotePhlow-DeclarativeViews'.
		spec package: 'GToolkit-RemotePhlow-DeclarativeViews-GTSpecific' with: [
			spec requires: #('GToolkit-RemotePhlow-DeclarativeViews') ].
		spec package: 'GToolkit-RemotePhlow-PhlowViews' with: [
			spec requires: #('GToolkitPhlow') ].
		spec package: 'GToolkit-RemotePhlow-InspectorCore' with: [
			spec requires: #('GToolkit-RemotePhlow-PhlowViews') ].
		spec package: 'GToolkit-RemotePhlow-Examples'.
		spec package: 'GToolkit-RemoteGt' with: [
			spec requires: #('GToolkitPhlow' 'GToolkit-RemotePhlow-DeclarativeViews-GTSpecific' 'GToolkit-RemotePhlow-PhlowViews' 'GToolkit-RemotePhlow-Examples') ].
		spec package: 'GToolkit-RemoteGt-Lepiter' with: [
			spec requires: #('GToolkit-RemoteGt') ].
		spec package: 'GToolkit-RemotePhlow-GeolifeDemo'.
		spec package: 'GToolkit-RemotePhlow-GeolifeDemo-GTSpecific' with: [
			spec requires: #('GToolkit-RemotePhlow-GeolifeDemo') ].
	]
]
