"
GtPlotterVerticalBarChart utilizes rectangles to represent bars. However, the chart also has the capability to generate horizontal lines for displaying minimum, maximum, average, and threshold values. To create a horizontal line instance for such purposes, utilize the method `chart newHorizontalLine`, which generates and returns a new instance of GtPlotterHorizontalLine.

"
Class {
	#name : #GtPlotterHorizontalLineExamples,
	#superclass : #GtPlotterBarLineExamples,
	#category : #'GToolkit-Plotter-Example - Bar Lines'
}

{ #category : #examples }
GtPlotterHorizontalLineExamples >> barChartForNumbers [
	<gtExample>
	| barChart |
	barChart := GtPlotterVerticalBarChart newFromValues: #(8 10 15 9 12).
	self assert: barChart lines size = 0.
	^ barChart
]

{ #category : #examples }
GtPlotterHorizontalLineExamples >> barChartLineStyle [
	<gtExample>
	^ super barChartLineStyle
]

{ #category : #examples }
GtPlotterHorizontalLineExamples >> barChartScalableContentsPercentMax [
	<gtExample>
	| barChart chartElement  max |
	barChart := self barChartScalableContents.
	max := 0.5.
	barChart lines first
		min: 0;
		max: max.
	chartElement := self createChartElement: barChart.
	self assert: chartElement lines isNotEmpty.
	self
		assert: chartElement lines first width
		equals: chartElement barsElement width * max.
	^ chartElement
]

{ #category : #examples }
GtPlotterHorizontalLineExamples >> barChartScalableContentsPercentMin [
	<gtExample>
	| barChart chartElement min |
	barChart := self barChartScalableContents.
	min := 0.5.
	barChart lines first 
		min: min;
		max: 1.
	chartElement := self createChartElement: barChart.
	self assert: chartElement lines isNotEmpty.
	self
		assert: chartElement lines first width
		equals: chartElement barsElement width * min.
	^ chartElement
]

{ #category : #examples }
GtPlotterHorizontalLineExamples >> barChartScalableContentsShouldExpandLine [
	<gtExample>
	| barChart chartElement |
	barChart := self barChartScalableContents.
	chartElement := self createChartElement: barChart.
	self assert: chartElement lines isNotEmpty.
	self
		assert: chartElement lines first width
		equals: chartElement barsElement width.
	^ chartElement
]

{ #category : #accessing }
GtPlotterHorizontalLineExamples >> barChartScrollabelContentsShouldNotPassBarsExtent [
	<gtExample>
	| barChart barElement width |
	barChart := self thresholdChartScrollableContentsAddsOneLine.
	barElement := self createChartElement: barChart.
	width := barElement lines first width.
	self assert: width < barElement width.
	^ barElement
]

{ #category : #examples }
GtPlotterHorizontalLineExamples >> thresholdChartScrollableContentsAddsOneLine [
	<gtExample>
	| barChart threshold |
	barChart := self barChartForNumbers.
	threshold := 10.
	barChart newHorizontalLine dataValue: threshold.
	self assert: barChart lines size equals: 1.
	^ barChart
]