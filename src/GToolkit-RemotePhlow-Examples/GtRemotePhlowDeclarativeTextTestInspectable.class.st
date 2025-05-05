Class {
	#name : #GtRemotePhlowDeclarativeTextTestInspectable,
	#superclass : #Object,
	#category : #'GToolkit-RemotePhlow-Examples'
}

{ #category : #views }
GtRemotePhlowDeclarativeTextTestInspectable >> gtStyledPhlowTextWithDecorationsFor: aView [
	<gtView>
	
	^ aView text
		title: 'Styled phlow text with decorations';
		priority: 10.3;
		text: [ self styledPhlowTextWithDecorations ]
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTextTestInspectable >> styledPhlowTextWithDecorations [
	<gtExample>
	<return: #GtPhlowRunBasedText>
	| text |
	text := GtPhlowText
			forString: 'Examples of text decorations:

Different styles:
	Solid style
	Dashed style
	Dotted style
	Wavy style
	
Different types:
	Line Through
	Overline
	Underline
	
Different color:
	Blue color
	
Different thickness:
	Thickness 3
	
Combined decorations:
	Several decorations
'.

	(text from: 51 to: 61)
		decorationDo: [ :aDecoration | 
			aDecoration
				solid;
				underline ].
	(text from: 64 to: 75)
		decorationDo: [ :aDecoration | 
			aDecoration
				dashed;
				underline ].
	(text from: 78 to: 89)
		decorationDo: [ :aDecoration | 
			aDecoration
				dotted;
				underline ].
	(text from: 92 to: 101)
		decorationDo: [ :aDecoration | 
			aDecoration
				wavy;
				underline ].

	(text from: 123 to: 134)
		decorationDo: [ :aDecoration | 
			aDecoration
				solid;
				lineThrough ].
	(text from: 137 to: 144)
		decorationDo: [ :aDecoration | 
			aDecoration
				solid;
				overline ].
	(text from: 147 to: 155)
		decorationDo: [ :aDecoration | 
			aDecoration
				solid;
				underline ].

	(text from: 177 to: 186)
		decorationDo: [ :aDecoration | 
			aDecoration
				underline;
				color: (GtPhlowColor named: #blue) ].

	(text from: 212 to: 222)
		decorationDo: [ :aDecoration | 
			aDecoration
				underline;
				thickness: 3 ].

	(text from: 249 to: 267)
		decorationDo: [ :aDecoration | 
			aDecoration
				underline;
				overline;
				dashed;
				thickness: 3;
				color: (GtPhlowColor named: #blue) ].

	^ text
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTextTestInspectable >> styledPhlowTextWithDecorationsForRemoteComparison [
	<gtExample>
	<return: #GtPhlowRunBasedText>
	| text |
	text := GtPhlowText
			forString: ('Examples of text decorations:

Different styles:
	Solid style
	Dashed style
	Dotted style
	Wavy style
	
Different types:
	Line Through
	Overline
	Underline
	
Different color:
	Blue color
	
Different thickness:
	Thickness 3
	
Combined decorations:
	Several decorations
' copyReplaceAll: String cr with: String lf).

	(text from: 51 to: 61)
		decorationDo: [ :aDecoration | 
			aDecoration
				solid;
				underline ].
	(text from: 64 to: 75)
		decorationDo: [ :aDecoration | 
			aDecoration
				dashed;
				underline ].
	(text from: 78 to: 89)
		decorationDo: [ :aDecoration | 
			aDecoration
				dotted;
				underline ].
	(text from: 92 to: 101)
		decorationDo: [ :aDecoration | 
			aDecoration
				wavy;
				underline ].

	(text from: 123 to: 134)
		decorationDo: [ :aDecoration | 
			aDecoration
				solid;
				lineThrough ].
	(text from: 137 to: 144)
		decorationDo: [ :aDecoration | 
			aDecoration
				solid;
				overline ].
	(text from: 147 to: 155)
		decorationDo: [ :aDecoration | 
			aDecoration
				solid;
				underline ].

	(text from: 177 to: 186)
		decorationDo: [ :aDecoration | 
			aDecoration
				underline;
				color: (GtPhlowColor named: #blue) ].

	(text from: 212 to: 222)
		decorationDo: [ :aDecoration | 
			aDecoration
				underline;
				thickness: 3 ].

	(text from: 249 to: 267)
		decorationDo: [ :aDecoration | 
			aDecoration
				underline;
				overline;
				dashed;
				thickness: 3;
				color: (GtPhlowColor named: #blue) ].

	^ text
]

{ #category : #accessing }
GtRemotePhlowDeclarativeTextTestInspectable >> styledPhlowTextWithHighlights [
	<gtExample>
	<return: #GtPhlowRunBasedText>
	| text |
	text := GtPhlowText
			forString: 'Examples of text styling:

Emphases:
	Italic text
	Oblique text
	Normal text

Colors:
	Blue foreground
	Green highlight
	
Weight:
	Thin text
	Bold text
	
Size:
	8px text
	28px text
	
Fonts:
	Helvetica font
	Source Sans Pro font
	
Combined styles:
	Several styles
'.

	(text from: 39 to: 49) italic.
	(text from: 52 to: 63) oblique.
	(text from: 66 to: 76) normal.

	(text from: 88 to: 102) foreground: (GtPhlowColor named: #blue).
	(text from: 105 to: 119) highlight: (GtPhlowColor named: #green).

	(text from: 132 to: 140) thin.
	(text from: 143 to: 152) bold.

	(text from: 162 to: 169) fontSize: 8.
	(text from: 172 to: 180) fontSize: 28.

	(text from: 191 to: 205) fontName: 'Helvetica'.
	(text from: 208 to: 226) fontName: 'Source Sans Pro'.

	(text from: 249 to: 262)
		oblique;
		bold;
		fontSize: 18;
		foreground: (GtPhlowColor named: #red);
		fontName: 'Source Sans Pro'.

	^ text
]
