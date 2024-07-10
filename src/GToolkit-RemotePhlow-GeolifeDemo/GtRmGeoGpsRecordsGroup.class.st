Class {
	#name : #GtRmGeoGpsRecordsGroup,
	#superclass : #GtRmGeoGpsGroup,
	#category : #'GToolkit-RemotePhlow-GeolifeDemo'
}

{ #category : #accessing }
GtRmGeoGpsRecordsGroup >> computeDistance [
	| distance |
	self size = 1 ifTrue: [ ^ 0 ].
	distance := 0.
	1 to: self size - 1 do: [ :anIndex |
		distance := distance + (self
			distanceFrom: (self items at: anIndex)
			to: (self items at: anIndex + 1)) ].
	^ distance
]

{ #category : #accessing }
GtRmGeoGpsRecordsGroup >> computeDistanceWithBug [
	| distance |
	self size = 1 ifTrue: [ ^ 0 ].
	distance := 0.
	1 to: self size + 1 do: [ :anIndex |
		distance := distance + (self
			distanceFrom: (self items at: anIndex)
			to: (self items at: anIndex + 1)) ].
	^ distance
]

{ #category : #accessing }
GtRmGeoGpsRecordsGroup >> distance [
	^ self 
		cacheAt: 'distance' 
		ifAbsentPut: [
			self computeDistance ]
]

{ #category : #accessing }
GtRmGeoGpsRecordsGroup >> distanceBetween: firstPosition and: secondPosition [
        "T3GeoTools distanceBetween: 5.33732@50.926 and: 5.49705@50.82733"

        | c |
        c := (firstPosition y degreesToRadians sin 
        	* secondPosition y degreesToRadians sin)
                + (firstPosition y degreesToRadians cos 
                	* secondPosition y degreesToRadians cos
                        * (secondPosition x degreesToRadians 
                        	- firstPosition x degreesToRadians) cos).
        c := c >= 0 ifTrue: [ 1 min: c ] ifFalse: [ -1 max: c ].
        ^ c arcCos * 6371000
]

{ #category : #accessing }
GtRmGeoGpsRecordsGroup >> distanceFrom: firstRecord to: secondRecord [
	| c |
    c := (firstRecord longitude degreesToRadians sin 
    	* secondRecord longitude degreesToRadians sin)
			+ (firstRecord longitude degreesToRadians cos 
				* secondRecord longitude degreesToRadians cos
            		* (secondRecord latitude degreesToRadians 
            			- firstRecord latitude degreesToRadians) cos).
    c := c >= 0 ifTrue: [ 1 min: c ] ifFalse: [ -1 max: c ].
    ^ c arcCos * 6371000
]

{ #category : #'gt - extensions' }
GtRmGeoGpsRecordsGroup >> gtItemsFor: aView [
	<gtView>
	
	^ aView columnedList
		title: 'Records';
		items: [ self items ];
		column: 'Timestamp' text: [ :aRecord | aRecord timestamp ];
		column: 'Latitude' text: [ :aRecord | aRecord latitude ];
		column: 'Longitude' text: [ :aRecord | aRecord longitude ]
]
