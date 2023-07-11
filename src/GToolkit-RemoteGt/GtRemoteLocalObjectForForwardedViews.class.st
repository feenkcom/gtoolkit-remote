Class {
	#name : #GtRemoteLocalObjectForForwardedViews,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples'
}

{ #category : #accessing }
GtRemoteLocalObjectForForwardedViews >> gtViewRemoteForwardListViewFor: aView [
	<gtView>
	
	^ aView remoteForward
		title: 'Forward - to list';
		priority: 10;
		object: [ GtRemoteInspectionSimulation 
			openOn: GtRemotePhlowDeclarativeTestInspectable new ];
		view: #gtListFor:
]

{ #category : #accessing }
GtRemoteLocalObjectForForwardedViews >> gtViewRemoteForwardListViewWithLocalSendFor: aView [
	<gtView>
	
	^ aView remoteForward
		title: 'Forward with send - to list ';
		priority: 15;
		object: [ GtRemoteInspectionSimulation 
			openOn: GtRemotePhlowDeclarativeTestInspectable new ];
		view: #gtListFor:;
		send: [ :each | 
			{ each . each } ]
]

{ #category : #accessing }
GtRemoteLocalObjectForForwardedViews >> gtViewRemoteForwardToForwardListWithSendViewFor: aView [
	<gtView>
	
	^ aView remoteForward
		title: 'Forward - to forward list with send';
		priority: 20;
		object: [ GtRemoteInspectionSimulation 
			openOn: GtRemotePhlowDeclarativeTestInspectable new ];
		view: #gtForwardListWithSendFor:
]

{ #category : #accessing }
GtRemoteLocalObjectForForwardedViews >> gtViewRemoteForwardToListWithSendViewFor: aView [
	<gtView>
	
	^ aView remoteForward
		title: 'Forward - to list with send';
		priority: 12;
		object: [ GtRemoteInspectionSimulation 
			openOn: GtRemotePhlowDeclarativeTestInspectable new ];
		view: #gtListWithSendFor:
]
