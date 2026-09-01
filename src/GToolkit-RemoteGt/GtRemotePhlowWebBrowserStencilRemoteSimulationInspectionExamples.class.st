"
Inspector examples for a web browser stencil through plain remote-inspection simulation.
"
Class {
	#name : #GtRemotePhlowWebBrowserStencilRemoteSimulationInspectionExamples,
	#superclass : #GtRemotePhlowWebBrowserStencilLocalInspectionExamples,
	#category : #'GToolkit-RemoteGt-Examples-Views'
}

{ #category : #'examples - setup' }
GtRemotePhlowWebBrowserStencilRemoteSimulationInspectionExamples >> createTestObject [
	<gtExample>
	^ GtRemotePlainInspectionSimulation openOn: GtRemotePhlowWebBrowserStencilTestObject new
]
