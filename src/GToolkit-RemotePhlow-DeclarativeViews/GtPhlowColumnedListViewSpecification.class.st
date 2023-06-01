"
GtDeclarativeColumnedList supports a subset of the possible configurations of {{gtClass:name=GtPhlowColumnedListView}}.

Current limitations:

- Only matchParent and fixed column widths are supported

# Internal Representation and Key Implementation Points.


## Instance Variables

	columnTitles:	<Array of String>
	columnWidths:	<Array of Integer|nil>
	items:				<Array of Array>	These are the formatted values to display, not the raw values to send


"
Class {
	#name : #GtPhlowColumnedListViewSpecification,
	#superclass : #GtPhlowBasicColumnedViewSpecification,
	#category : #'GToolkit-RemotePhlow-DeclarativeViews'
}
