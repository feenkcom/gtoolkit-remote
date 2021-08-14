Class {
	#name : 'GtRemoteSearchFilter',
	#superclass : 'GtSearchFilter',
	#instVars : [
		'filter'
	],
	#category : 'GToolkit-RemoteGt'
}

{ #category : 'instance creation' }
GtRemoteSearchFilter class >> filter: aFilter [

	^ self new
		  filter: aFilter;
		  yourself
]

{ #category : 'accessing' }
GtRemoteSearchFilter >> filter [

	^ filter
]

{ #category : 'accessing' }
GtRemoteSearchFilter >> filter: aFilter [

	filter := aFilter
]

{ #category : 'accessing' }
GtRemoteSearchFilter >> resultType [

	^ GtRemoteSearchGroupResult
]
