"
The GToolkit4ZTimestamp project adds GToolkit extensions to the ZTimestamp project.

More efficient UTC/GMT timestamps, Olsen timezone database support, example based formatter and parser, SNTP client.
"
Class {
	#name : #BaselineOfGToolkit4ZTimestamp,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkit4ZTimestamp
}

{ #category : #accessing }
BaselineOfGToolkit4ZTimestamp class >> gtDependencyAnalysisPreloadedBaselines [
	^ super gtDependencyAnalysisPreloadedBaselines , { BaselineOfGToolkit4Pharo . BaselineOfGToolkitSpotter }
]

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
	spec for: #'common' do: [
		spec
			baseline: 'ZTimestamp' with: [
				spec repository: 'github://svenvc/ztimestamp:0239d63a0580a001bbc0d8f96763e0c75354a13c/repository' ].

		spec package: 'GToolkit4ZTimestamp' with: [
			spec requires: #('ZTimestamp') ].
	]
]
