"
Inspector examples for a direct local web browser view fixture.
"
Class {
	#name : #GtRemotePhlowWebBrowserViewObjectInspectionExamples,
	#superclass : #GtRemotePhlowWebBrowserViewLocalInspectionExamples,
	#category : #'GToolkit-RemoteGt-Examples-Inspection'
}

{ #category : #'examples - setup' }
GtRemotePhlowWebBrowserViewObjectInspectionExamples >> createErrorTestObject [
	<gtExample>
	^ GtRemotePhlowWebBrowserViewErrorTestObject new
]

{ #category : #'examples - setup' }
GtRemotePhlowWebBrowserViewObjectInspectionExamples >> createTestObject [
	<gtExample>
	^ GtRemotePhlowWebBrowserViewTestObject new
]
