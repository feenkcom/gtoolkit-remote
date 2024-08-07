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
		spec baseline: 'GToolkitPhlow' with: [
				spec repository: 'github://feenkcom/gtoolkit-phlow:main/src' ].
		spec 
			package: 'GToolkit-RemotePhlow-DeclarativeSpecification';
			package: 'GToolkit-RemotePhlow-Text';
			package: 'GToolkit-RemotePhlow-Icons' with: [
				spec requires: #('GToolkit-RemotePhlow-DeclarativeSpecification')];
			package: 'GToolkit-RemotePhlow-DeclarativeActions'with: [
				spec requires: #('GToolkit-RemotePhlow-DeclarativeSpecification')];
			package: 'GToolkit-RemotePhlow-DeclarativeViews' with: [
				spec requires: #('GToolkit-RemotePhlow-Text' 'GToolkit-RemotePhlow-DeclarativeSpecification')];
			package: 'GToolkit-RemotePhlow-DeclarativeViews-GTSpecific'with: [
				spec requires: #(#'GToolkit-RemotePhlow-DeclarativeViews') ];
			package: 'GToolkit-RemotePhlow-PhlowActions'  with: [
				spec requires: #(#'GToolkitPhlow' ) ];
			package: 'GToolkit-RemotePhlow-PhlowViews'  with: [
				spec requires: #(#'GToolkitPhlow' 'GToolkit-RemotePhlow-Text') ];
			package: 'GToolkit-RemotePhlow-InspectorCore' with: [
				spec requires: #(#'GToolkit-RemotePhlow-PhlowViews') ];
				
			"GToolkit-RemotePhlow-Examples all run in the local image, 
			i.e. don't require external servers, so can be part of the standard test suite"
			package: 'GToolkit-RemotePhlow-Examples';
			
			package: 'GToolkit-RemoteGt-LocalPhlow' with: [
				spec requires: #('GToolkit-RemotePhlow-PhlowViews')];
			package: 'GToolkit-RemoteGt' with: [
				spec requires: #('GToolkitPhlow' #'GToolkit-RemotePhlow-DeclarativeActions' #'GToolkit-RemotePhlow-DeclarativeViews-GTSpecific' #'GToolkit-RemotePhlow-PhlowActions' #'GToolkit-RemotePhlow-PhlowViews' 'GToolkit-RemotePhlow-Examples'). ];
			package: 'GToolkit-RemoteGt-Icons' with: [
				spec requires: #('GToolkit-RemoteGt' 'GToolkit-RemotePhlow-DeclarativeActions') ];
			package: 'GToolkit-RemoteGt-Lepiter' with: [
				spec requires: #('GToolkit-RemoteGt') ];
			package: 'GToolkit-RemoteGt-InspectorCore' with: [
				spec requires: #('GToolkit-RemoteGt') ];
			package: 'GToolkit-RemotePhlow-GeolifeDemo';
			package: 'GToolkit-RemotePhlow-GeolifeDemo-GTSpecific' with: [
				spec requires: #('GToolkit-RemotePhlow-GeolifeDemo') ];
			package: 'GToolkit-RemotePhlow-MoviesDemo';
			package: 'GToolkit-RemotePhlow-MoviesDemo-GTSpecific' with: [
				spec requires: #('GToolkit-RemotePhlow-MoviesDemo') ] ].

]
