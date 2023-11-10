Class {
	#name : #BaselineOfGToolkit4ZTimestamp,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkit4ZTimestamp
}

{ #category : #loading }
BaselineOfGToolkit4ZTimestamp class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gt4ztimestamp' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGToolkit4ZTimestamp >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec baseline: 'ZTimestamp' with: [ spec repository: 'github://svenvc/ztimestamp:master/repository' ].
			spec package: 'GToolkit4ZTimestamp' with: [ spec requires: #('ZTimestamp') ].
		]
]
