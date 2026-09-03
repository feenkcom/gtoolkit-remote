"
Inspector examples using a plain remote-inspection simulation.
"
Class {
	#name : #GtRemotePhlowWebBrowserViewRemoteSimulationInspectionExamples,
	#superclass : #GtRemotePhlowWebBrowserViewLocalInspectionExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection'
}

{ #category : #'examples - setup' }
GtRemotePhlowWebBrowserViewRemoteSimulationInspectionExamples >> createErrorTestObject [
	<gtExample>
	^ GtRemotePlainInspectionSimulation openOn: GtRemotePhlowWebBrowserViewErrorTestObject new
]

{ #category : #'examples - setup' }
GtRemotePhlowWebBrowserViewRemoteSimulationInspectionExamples >> createTestObject [
	<gtExample>
	^ GtRemotePlainInspectionSimulation openOn: GtRemotePhlowWebBrowserViewTestObject new
]
