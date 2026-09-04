"
Inspector examples for a web browser stencil through local remote-inspection simulation.
"
Class {
	#name : #GtRemotePhlowWebBrowserStencilLocalSimulationInspectionExamples,
	#superclass : #GtRemotePhlowWebBrowserStencilLocalInspectionExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection'
}

{ #category : #'examples - setup' }
GtRemotePhlowWebBrowserStencilLocalSimulationInspectionExamples >> createTestObject [
	<gtExample>
	^ GtRemoteInspectionSimulation openOn: GtRemotePhlowWebBrowserStencilTestObject new
]
