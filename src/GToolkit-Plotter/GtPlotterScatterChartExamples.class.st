Class {
	#name : #GtPlotterScatterChartExamples,
	#superclass : #GtPlotterBuilderExamples,
	#category : #'GToolkit-Plotter-Example - Builders'
}

{ #category : #accessing }
GtPlotterScatterChartExamples >> emptyPlot [
	<gtExample>
	| chart |
	chart := GtPlotterScatterChart new.
	chart with: GtPlotterDataGroup new.
	^ chart
]

{ #category : #accessing }
GtPlotterScatterChartExamples >> scatterChart [
	<gtExample>
	| dataGroup aChart theData aMaxDuration aBarWidthScale |
	theData := self websiteVisits.
	
	dataGroup := GtPlotterDataGroup new values: theData.
	aMaxDuration := dataGroup 
		inject: 0 days 
		intoValues: [ :aDuration :eachValue | 
			aDuration max: (eachValue at: #duration) ].

	aBarWidthScale := GtPlotterDurationScale new 
		domainFrom: 0 minutes to: aMaxDuration.
	aChart := GtPlotterScatterChart new
		with: dataGroup;
		valueX: [ :e | e at: #duration ];
		scaleX: aBarWidthScale;
		titleX: 'Duration';
		ticksX: 10;
		valueY: [ :e | e at: #frequency ];
		scaleY: GtPlotterLinearScale new;
		titleY: 'Frequency';
		ticksY: 10.

	^ aChart
	 
]

{ #category : #accessing }
GtPlotterScatterChartExamples >> scatterChartWithPopup [
	<gtExample>
	| aChart |
	aChart :=  self scatterChart
		dotElement: [ :aGtPlotterContext | 
			BlElement new
				geometry: BlSquare new;
				size: 20 asPoint;
				aptitude: (BrGlamorousWithTooltipAptitude 
					content: [ BrLabel new
						text: (aGtPlotterContext originalValue at: #domain);
						aptitude: (BrGlamorousLabelAptitude new 
							padding: (BlInsets all: 1)) ]) ];
		
	 	yourself.
	 aChart with: (aChart data background: [ :each | Color blue alpha: 0.5 ]).
	 ^ aChart
]

{ #category : #accessing }
GtPlotterScatterChartExamples >> scatterDifferentGeometry [
	<gtExample>
	| aChart |
	aChart :=  self scatterChart
		dotElement: [ :aGtPlotterContext |
			| geometry domain |
			geometry := BlTriangleGeometry new.
			domain := aGtPlotterContext originalValue at: #domain.
			(domain endsWith: 'com')
				ifTrue: [ geometry := BlEllipseGeometry new ].
			(domain endsWith: 'cn')
				ifTrue: [ geometry := BlSquare new ].
			(domain endsWith: 'tv')
				ifTrue: [ geometry := BlPolygon vertices: RSShapeFactory star points * 10 + 10
					 ].
			BlElement new
				geometry: geometry;
				border: (BlBorder paint: Color black);
				size: 20 asPoint ];
		
	 	yourself.
	 aChart with: (aChart data background: [ :each |
	 	| domain color |
	 	domain := each at: #domain.
	 	color := Color blue alpha: 0.4.
	 	(domain endsWith: 'com')
			ifTrue: [ color := Color red alpha: 0.4. ].
		(domain endsWith: 'cn')
			ifTrue: [ color := Color yellow alpha: 0.8. ].
		(domain endsWith: 'tv')
			ifTrue: [ color := Color green alpha: 0.4. ].
		color ]).
	 ^ aChart
]