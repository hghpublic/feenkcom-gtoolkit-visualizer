Trait {
	#name : #TGtWardleyMapDecoratorModel,
	#category : #'GToolkit-WardleyMap-! Models - Decorators'
}

{ #category : #'api - wardley map decorator model' }
TGtWardleyMapDecoratorModel >> asDecoratorViewModel [
	<return: #TGtWardleyMapDecoratorViewModel>
	^ GtWardleyMapDecoratorViewModel new wardleyMapDecoratorModel: self
]

{ #category : #'api - wardley map decorator model' }
TGtWardleyMapDecoratorModel >> decorateEdgeElement: aEdgeElement decoratorViewModel: aDecoratorViewModel [
]

{ #category : #'api - wardley map decorator model' }
TGtWardleyMapDecoratorModel >> decorateMapElement: aMapElement decoratorViewModel: aDecoratorViewModel [
]

{ #category : #'api - wardley map decorator model' }
TGtWardleyMapDecoratorModel >> decorateNodeElement: aNodeElement decoratorViewModel: aDecoratorViewModel [
]

{ #category : #initialization }
TGtWardleyMapDecoratorModel >> parent: aParent [
	
]

{ #category : #initialization }
TGtWardleyMapDecoratorModel >> removeParent [
	
]

{ #category : #'api - wardley map decorator model' }
TGtWardleyMapDecoratorModel >> undecorateMapElement: aMapElement decoratorViewModel: aDecoratorViewModel [
]