"
Inspector examples using a local remote-inspection simulation.
"
Class {
	#name : #GtRemotePhlowWebBrowserViewLocalSimulationInspectionExamples,
	#superclass : #GtRemotePhlowWebBrowserViewLocalInspectionExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection'
}

{ #category : #'examples - setup' }
GtRemotePhlowWebBrowserViewLocalSimulationInspectionExamples >> createErrorTestObject [
	<gtExample>
	^ GtRemoteInspectionSimulation openOn: GtRemotePhlowWebBrowserViewErrorTestObject new
]

{ #category : #'examples - setup' }
GtRemotePhlowWebBrowserViewLocalSimulationInspectionExamples >> createTestObject [
	<gtExample>
	^ GtRemoteInspectionSimulation openOn: GtRemotePhlowWebBrowserViewTestObject new
]
