"
Example for ZTimestamp
"
Class {
	#name : #GToolkit4ZTimestampExamples,
	#superclass : #Object,
	#category : #GToolkit4ZTimestamp
}

{ #category : #accessing }
GToolkit4ZTimestampExamples class >> now [
	<gtExample>
	^ ZTimestamp now
]

{ #category : #accessing }
GToolkit4ZTimestampExamples class >> today [
	<gtExample>
	^ self now asBeginOfDay
]
