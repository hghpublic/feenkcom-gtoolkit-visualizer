private - layout
mergeWithChildrenContours: aTreeNode
	| aTotalBreadt aChildBreadth aFirstChildNode aNodeContour | 

	aFirstChildNode := aTreeNode nodes first.

	"store a reference to the parent's contour outside of the loop to eliminate unnecessary dictionary accesses"
	aNodeContour := aFirstChildNode element constraints gradTree computedContour.
	aTreeNode element constraints gradTree computedContour: aNodeContour.

	aChildBreadth := (self layout nodeBreadth: aFirstChildNode) + (2 * self nodeDistance).

	aTotalBreadt := aChildBreadth.

	aTreeNode nodes
		select: [ :aChildNode | aChildNode ~~ aFirstChildNode ]
		thenDo: [ :aChildNode | 
				| aDeltaDistance |

				aDeltaDistance := self
					mergeContour: aNodeContour
					with: aChildNode element constraints gradTree computedContour.

				aChildNode element constraints gradTree computedOffset: 0@(aChildBreadth + aDeltaDistance).

				GtGradTreeLayoutOffsetSetSignal new
					node: aChildNode; 
					offsetX: 0; 
					offsetY: aChildBreadth + aDeltaDistance;
					emit.

				aChildBreadth := (self layout nodeBreadth: aChildNode) + (2 * self nodeDistance).
				aTotalBreadt := aTotalBreadt + aChildBreadth + aDeltaDistance ].

	^ aTotalBreadt
	