"
Shared construction examples for tree Phlow views.
"
Class {
	#name : #GtRemotePhlowTreeViewAbstractExamples,
	#superclass : #Object,
	#category : #'GToolkit-RemoteGt-Examples-Phlow API'
}

{ #category : #testing }
GtRemotePhlowTreeViewAbstractExamples class >> isAbstract [
	^self name = #GtRemotePhlowTreeViewAbstractExamples
]

{ #category : #'examples - support' }
GtRemotePhlowTreeViewAbstractExamples >> createProtoView [
	self subclassResponsibility
]

{ #category : #'expected data' }
GtRemotePhlowTreeViewAbstractExamples >> expectedTreeWithNumberItems [
	^ (Array new: 4)
		at: 1
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '1';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 1;
					yourself);
		at: 2
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '2';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 2;
					yourself);
		at: 3
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '3';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 3;
					yourself);
		at: 4
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '4';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 4;
					yourself);
		yourself
]

{ #category : #'expected data' }
GtRemotePhlowTreeViewAbstractExamples >> expectedTreeWithNumberItemsForNoExpansion [
	^ (Array new: 5)
		at: 1
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '0';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 1;
					yourself);
		at: 2
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '1';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 2;
					yourself);
		at: 3
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '2';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 3;
					yourself);
		at: 4
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '3';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 4;
					yourself);
		at: 5
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '4';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 5;
					yourself);
		yourself
]

{ #category : #'expected data' }
GtRemotePhlowTreeViewAbstractExamples >> expectedTreeWithNumberItemsWithAllLevelsExpansion [
	^ (Array new: 5)
		at: 1
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '0';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 1;
					add: #childNodes -> #();
					yourself);
		at: 2
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '1';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 2;
					add: #childNodes
							-> ((Array new: 1)
									at: 1
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '0';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 1;
												add: #childNodes -> #();
												yourself);
									yourself);
					yourself);
		at: 3
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '2';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 3;
					add: #childNodes
							-> ((Array new: 1)
									at: 1
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '1';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 1;
												add: #childNodes
														-> ((Array new: 1)
																at: 1
																	put: (Dictionary new
																			add: #nodeValue
																					-> (Dictionary new
																							add: #valueTypeName -> 'textualValue';
																							add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																							add: #itemText
																									-> (Dictionary new
																											add: '__typeLabel' -> 'gtPhlowRunBasedText';
																											add: 'sourceString' -> '0';
																											add: 'attributeRuns'
																													-> (Dictionary new
																															add: 'items' -> #();
																															add: '__typeLabel' -> 'phlowRunsGroup';
																															yourself);
																											yourself);
																							yourself);
																			add: #nodeId -> 1;
																			add: #childNodes -> #();
																			yourself);
																yourself);
												yourself);
									yourself);
					yourself);
		at: 4
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '3';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 4;
					add: #childNodes
							-> ((Array new: 2)
									at: 1
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '1';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 1;
												add: #childNodes
														-> ((Array new: 1)
																at: 1
																	put: (Dictionary new
																			add: #nodeValue
																					-> (Dictionary new
																							add: #valueTypeName -> 'textualValue';
																							add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																							add: #itemText
																									-> (Dictionary new
																											add: '__typeLabel' -> 'gtPhlowRunBasedText';
																											add: 'sourceString' -> '0';
																											add: 'attributeRuns'
																													-> (Dictionary new
																															add: 'items' -> #();
																															add: '__typeLabel' -> 'phlowRunsGroup';
																															yourself);
																											yourself);
																							yourself);
																			add: #nodeId -> 1;
																			add: #childNodes -> #();
																			yourself);
																yourself);
												yourself);
									at: 2
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '2';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 2;
												add: #childNodes
														-> ((Array new: 1)
																at: 1
																	put: (Dictionary new
																			add: #nodeValue
																					-> (Dictionary new
																							add: #valueTypeName -> 'textualValue';
																							add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																							add: #itemText
																									-> (Dictionary new
																											add: '__typeLabel' -> 'gtPhlowRunBasedText';
																											add: 'sourceString' -> '1';
																											add: 'attributeRuns'
																													-> (Dictionary new
																															add: 'items' -> #();
																															add: '__typeLabel' -> 'phlowRunsGroup';
																															yourself);
																											yourself);
																							yourself);
																			add: #nodeId -> 1;
																			add: #childNodes
																					-> ((Array new: 1)
																							at: 1
																								put: (Dictionary new
																										add: #nodeValue
																												-> (Dictionary new
																														add: #valueTypeName -> 'textualValue';
																														add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																														add: #itemText
																																-> (Dictionary new
																																		add: '__typeLabel' -> 'gtPhlowRunBasedText';
																																		add: 'sourceString' -> '0';
																																		add: 'attributeRuns'
																																				-> (Dictionary new
																																						add: 'items' -> #();
																																						add: '__typeLabel' -> 'phlowRunsGroup';
																																						yourself);
																																		yourself);
																														yourself);
																										add: #nodeId -> 1;
																										add: #childNodes -> #();
																										yourself);
																							yourself);
																			yourself);
																yourself);
												yourself);
									yourself);
					yourself);
		at: 5
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '4';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 5;
					add: #childNodes
							-> ((Array new: 2)
									at: 1
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '2';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 1;
												add: #childNodes
														-> ((Array new: 1)
																at: 1
																	put: (Dictionary new
																			add: #nodeValue
																					-> (Dictionary new
																							add: #valueTypeName -> 'textualValue';
																							add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																							add: #itemText
																									-> (Dictionary new
																											add: '__typeLabel' -> 'gtPhlowRunBasedText';
																											add: 'sourceString' -> '1';
																											add: 'attributeRuns'
																													-> (Dictionary new
																															add: 'items' -> #();
																															add: '__typeLabel' -> 'phlowRunsGroup';
																															yourself);
																											yourself);
																							yourself);
																			add: #nodeId -> 1;
																			add: #childNodes
																					-> ((Array new: 1)
																							at: 1
																								put: (Dictionary new
																										add: #nodeValue
																												-> (Dictionary new
																														add: #valueTypeName -> 'textualValue';
																														add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																														add: #itemText
																																-> (Dictionary new
																																		add: '__typeLabel' -> 'gtPhlowRunBasedText';
																																		add: 'sourceString' -> '0';
																																		add: 'attributeRuns'
																																				-> (Dictionary new
																																						add: 'items' -> #();
																																						add: '__typeLabel' -> 'phlowRunsGroup';
																																						yourself);
																																		yourself);
																														yourself);
																										add: #nodeId -> 1;
																										add: #childNodes -> #();
																										yourself);
																							yourself);
																			yourself);
																yourself);
												yourself);
									at: 2
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '3';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 2;
												add: #childNodes
														-> ((Array new: 2)
																at: 1
																	put: (Dictionary new
																			add: #nodeValue
																					-> (Dictionary new
																							add: #valueTypeName -> 'textualValue';
																							add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																							add: #itemText
																									-> (Dictionary new
																											add: '__typeLabel' -> 'gtPhlowRunBasedText';
																											add: 'sourceString' -> '1';
																											add: 'attributeRuns'
																													-> (Dictionary new
																															add: 'items' -> #();
																															add: '__typeLabel' -> 'phlowRunsGroup';
																															yourself);
																											yourself);
																							yourself);
																			add: #nodeId -> 1;
																			add: #childNodes
																					-> ((Array new: 1)
																							at: 1
																								put: (Dictionary new
																										add: #nodeValue
																												-> (Dictionary new
																														add: #valueTypeName -> 'textualValue';
																														add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																														add: #itemText
																																-> (Dictionary new
																																		add: '__typeLabel' -> 'gtPhlowRunBasedText';
																																		add: 'sourceString' -> '0';
																																		add: 'attributeRuns'
																																				-> (Dictionary new
																																						add: 'items' -> #();
																																						add: '__typeLabel' -> 'phlowRunsGroup';
																																						yourself);
																																		yourself);
																														yourself);
																										add: #nodeId -> 1;
																										add: #childNodes -> #();
																										yourself);
																							yourself);
																			yourself);
																at: 2
																	put: (Dictionary new
																			add: #nodeValue
																					-> (Dictionary new
																							add: #valueTypeName -> 'textualValue';
																							add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																							add: #itemText
																									-> (Dictionary new
																											add: '__typeLabel' -> 'gtPhlowRunBasedText';
																											add: 'sourceString' -> '2';
																											add: 'attributeRuns'
																													-> (Dictionary new
																															add: 'items' -> #();
																															add: '__typeLabel' -> 'phlowRunsGroup';
																															yourself);
																											yourself);
																							yourself);
																			add: #nodeId -> 2;
																			add: #childNodes
																					-> ((Array new: 1)
																							at: 1
																								put: (Dictionary new
																										add: #nodeValue
																												-> (Dictionary new
																														add: #valueTypeName -> 'textualValue';
																														add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																														add: #itemText
																																-> (Dictionary new
																																		add: '__typeLabel' -> 'gtPhlowRunBasedText';
																																		add: 'sourceString' -> '1';
																																		add: 'attributeRuns'
																																				-> (Dictionary new
																																						add: 'items' -> #();
																																						add: '__typeLabel' -> 'phlowRunsGroup';
																																						yourself);
																																		yourself);
																														yourself);
																										add: #nodeId -> 1;
																										add: #childNodes
																												-> ((Array new: 1)
																														at: 1
																															put: (Dictionary new
																																	add: #nodeValue
																																			-> (Dictionary new
																																					add: #valueTypeName -> 'textualValue';
																																					add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																																					add: #itemText
																																							-> (Dictionary new
																																									add: '__typeLabel' -> 'gtPhlowRunBasedText';
																																									add: 'sourceString' -> '0';
																																									add: 'attributeRuns'
																																											-> (Dictionary new
																																													add: 'items' -> #();
																																													add: '__typeLabel' -> 'phlowRunsGroup';
																																													yourself);
																																									yourself);
																																					yourself);
																																	add: #nodeId -> 1;
																																	add: #childNodes -> #();
																																	yourself);
																														yourself);
																										yourself);
																							yourself);
																			yourself);
																yourself);
												yourself);
									yourself);
					yourself);
		yourself
]

{ #category : #'expected data' }
GtRemotePhlowTreeViewAbstractExamples >> expectedTreeWithNumberItemsWithExpansionBelowFour [
	^ (Array new: 5)
		at: 1
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '1';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 1;
					add: #childNodes
							-> ((Array new: 1)
									at: 1
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '0';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 1;
												add: #childNodes -> #();
												yourself);
									yourself);
					yourself);
		at: 2
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '2';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 2;
					add: #childNodes
							-> ((Array new: 1)
									at: 1
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '1';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 1;
												add: #childNodes
														-> ((Array new: 1)
																at: 1
																	put: (Dictionary new
																			add: #nodeValue
																					-> (Dictionary new
																							add: #valueTypeName -> 'textualValue';
																							add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																							add: #itemText
																									-> (Dictionary new
																											add: '__typeLabel' -> 'gtPhlowRunBasedText';
																											add: 'sourceString' -> '0';
																											add: 'attributeRuns'
																													-> (Dictionary new
																															add: 'items' -> #();
																															add: '__typeLabel' -> 'phlowRunsGroup';
																															yourself);
																											yourself);
																							yourself);
																			add: #nodeId -> 1;
																			add: #childNodes -> #();
																			yourself);
																yourself);
												yourself);
									yourself);
					yourself);
		at: 3
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '3';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 3;
					add: #childNodes
							-> ((Array new: 2)
									at: 1
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '1';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 1;
												add: #childNodes
														-> ((Array new: 1)
																at: 1
																	put: (Dictionary new
																			add: #nodeValue
																					-> (Dictionary new
																							add: #valueTypeName -> 'textualValue';
																							add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																							add: #itemText
																									-> (Dictionary new
																											add: '__typeLabel' -> 'gtPhlowRunBasedText';
																											add: 'sourceString' -> '0';
																											add: 'attributeRuns'
																													-> (Dictionary new
																															add: 'items' -> #();
																															add: '__typeLabel' -> 'phlowRunsGroup';
																															yourself);
																											yourself);
																							yourself);
																			add: #nodeId -> 1;
																			add: #childNodes -> #();
																			yourself);
																yourself);
												yourself);
									at: 2
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '2';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 2;
												add: #childNodes
														-> ((Array new: 1)
																at: 1
																	put: (Dictionary new
																			add: #nodeValue
																					-> (Dictionary new
																							add: #valueTypeName -> 'textualValue';
																							add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																							add: #itemText
																									-> (Dictionary new
																											add: '__typeLabel' -> 'gtPhlowRunBasedText';
																											add: 'sourceString' -> '1';
																											add: 'attributeRuns'
																													-> (Dictionary new
																															add: 'items' -> #();
																															add: '__typeLabel' -> 'phlowRunsGroup';
																															yourself);
																											yourself);
																							yourself);
																			add: #nodeId -> 1;
																			add: #childNodes
																					-> ((Array new: 1)
																							at: 1
																								put: (Dictionary new
																										add: #nodeValue
																												-> (Dictionary new
																														add: #valueTypeName -> 'textualValue';
																														add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																														add: #itemText
																																-> (Dictionary new
																																		add: '__typeLabel' -> 'gtPhlowRunBasedText';
																																		add: 'sourceString' -> '0';
																																		add: 'attributeRuns'
																																				-> (Dictionary new
																																						add: 'items' -> #();
																																						add: '__typeLabel' -> 'phlowRunsGroup';
																																						yourself);
																																		yourself);
																														yourself);
																										add: #nodeId -> 1;
																										add: #childNodes -> #();
																										yourself);
																							yourself);
																			yourself);
																yourself);
												yourself);
									yourself);
					yourself);
		at: 4
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '4';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 4;
					yourself);
		at: 5
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '5';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 5;
					yourself);
		yourself
]

{ #category : #'expected data' }
GtRemotePhlowTreeViewAbstractExamples >> expectedTreeWithNumberItemsWithOneLevelExpansion [
	^ (Array new: 5)
		at: 1
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '0';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 1;
					add: #childNodes -> #();
					yourself);
		at: 2
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '1';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 2;
					add: #childNodes
							-> ((Array new: 1)
									at: 1
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '0';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 1;
												yourself);
									yourself);
					yourself);
		at: 3
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '2';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 3;
					add: #childNodes
							-> ((Array new: 1)
									at: 1
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '1';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 1;
												yourself);
									yourself);
					yourself);
		at: 4
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '3';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 4;
					add: #childNodes
							-> ((Array new: 2)
									at: 1
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '1';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 1;
												yourself);
									at: 2
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '2';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 2;
												yourself);
									yourself);
					yourself);
		at: 5
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '4';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 5;
					add: #childNodes
							-> ((Array new: 2)
									at: 1
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '2';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 1;
												yourself);
									at: 2
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '3';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 2;
												yourself);
									yourself);
					yourself);
		yourself
]

{ #category : #'expected data' }
GtRemotePhlowTreeViewAbstractExamples >> expectedTreeWithNumberItemsWithTwoLevelsExpansion [
	^ (Array new: 5)
		at: 1
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '0';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 1;
					add: #childNodes -> #();
					yourself);
		at: 2
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '1';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 2;
					add: #childNodes
							-> ((Array new: 1)
									at: 1
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '0';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 1;
												add: #childNodes -> #();
												yourself);
									yourself);
					yourself);
		at: 3
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '2';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 3;
					add: #childNodes
							-> ((Array new: 1)
									at: 1
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '1';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 1;
												add: #childNodes
														-> ((Array new: 1)
																at: 1
																	put: (Dictionary new
																			add: #nodeValue
																					-> (Dictionary new
																							add: #valueTypeName -> 'textualValue';
																							add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																							add: #itemText
																									-> (Dictionary new
																											add: '__typeLabel' -> 'gtPhlowRunBasedText';
																											add: 'sourceString' -> '0';
																											add: 'attributeRuns'
																													-> (Dictionary new
																															add: 'items' -> #();
																															add: '__typeLabel' -> 'phlowRunsGroup';
																															yourself);
																											yourself);
																							yourself);
																			add: #nodeId -> 1;
																			yourself);
																yourself);
												yourself);
									yourself);
					yourself);
		at: 4
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '3';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 4;
					add: #childNodes
							-> ((Array new: 2)
									at: 1
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '1';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 1;
												add: #childNodes
														-> ((Array new: 1)
																at: 1
																	put: (Dictionary new
																			add: #nodeValue
																					-> (Dictionary new
																							add: #valueTypeName -> 'textualValue';
																							add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																							add: #itemText
																									-> (Dictionary new
																											add: '__typeLabel' -> 'gtPhlowRunBasedText';
																											add: 'sourceString' -> '0';
																											add: 'attributeRuns'
																													-> (Dictionary new
																															add: 'items' -> #();
																															add: '__typeLabel' -> 'phlowRunsGroup';
																															yourself);
																											yourself);
																							yourself);
																			add: #nodeId -> 1;
																			yourself);
																yourself);
												yourself);
									at: 2
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '2';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 2;
												add: #childNodes
														-> ((Array new: 1)
																at: 1
																	put: (Dictionary new
																			add: #nodeValue
																					-> (Dictionary new
																							add: #valueTypeName -> 'textualValue';
																							add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																							add: #itemText
																									-> (Dictionary new
																											add: '__typeLabel' -> 'gtPhlowRunBasedText';
																											add: 'sourceString' -> '1';
																											add: 'attributeRuns'
																													-> (Dictionary new
																															add: 'items' -> #();
																															add: '__typeLabel' -> 'phlowRunsGroup';
																															yourself);
																											yourself);
																							yourself);
																			add: #nodeId -> 1;
																			yourself);
																yourself);
												yourself);
									yourself);
					yourself);
		at: 5
			put: (Dictionary new
					add: #nodeValue
							-> (Dictionary new
									add: #valueTypeName -> 'textualValue';
									add: '__typeName' -> #GtRemotePhlowItemTextualValue;
									add: #itemText
											-> (Dictionary new
													add: '__typeLabel' -> 'gtPhlowRunBasedText';
													add: 'sourceString' -> '4';
													add: 'attributeRuns'
															-> (Dictionary new
																	add: 'items' -> #();
																	add: '__typeLabel' -> 'phlowRunsGroup';
																	yourself);
													yourself);
									yourself);
					add: #nodeId -> 5;
					add: #childNodes
							-> ((Array new: 2)
									at: 1
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '2';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 1;
												add: #childNodes
														-> ((Array new: 1)
																at: 1
																	put: (Dictionary new
																			add: #nodeValue
																					-> (Dictionary new
																							add: #valueTypeName -> 'textualValue';
																							add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																							add: #itemText
																									-> (Dictionary new
																											add: '__typeLabel' -> 'gtPhlowRunBasedText';
																											add: 'sourceString' -> '1';
																											add: 'attributeRuns'
																													-> (Dictionary new
																															add: 'items' -> #();
																															add: '__typeLabel' -> 'phlowRunsGroup';
																															yourself);
																											yourself);
																							yourself);
																			add: #nodeId -> 1;
																			yourself);
																yourself);
												yourself);
									at: 2
										put: (Dictionary new
												add: #nodeValue
														-> (Dictionary new
																add: #valueTypeName -> 'textualValue';
																add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																add: #itemText
																		-> (Dictionary new
																				add: '__typeLabel' -> 'gtPhlowRunBasedText';
																				add: 'sourceString' -> '3';
																				add: 'attributeRuns'
																						-> (Dictionary new
																								add: 'items' -> #();
																								add: '__typeLabel' -> 'phlowRunsGroup';
																								yourself);
																				yourself);
																yourself);
												add: #nodeId -> 2;
												add: #childNodes
														-> ((Array new: 2)
																at: 1
																	put: (Dictionary new
																			add: #nodeValue
																					-> (Dictionary new
																							add: #valueTypeName -> 'textualValue';
																							add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																							add: #itemText
																									-> (Dictionary new
																											add: '__typeLabel' -> 'gtPhlowRunBasedText';
																											add: 'sourceString' -> '1';
																											add: 'attributeRuns'
																													-> (Dictionary new
																															add: 'items' -> #();
																															add: '__typeLabel' -> 'phlowRunsGroup';
																															yourself);
																											yourself);
																							yourself);
																			add: #nodeId -> 1;
																			yourself);
																at: 2
																	put: (Dictionary new
																			add: #nodeValue
																					-> (Dictionary new
																							add: #valueTypeName -> 'textualValue';
																							add: '__typeName' -> #GtRemotePhlowItemTextualValue;
																							add: #itemText
																									-> (Dictionary new
																											add: '__typeLabel' -> 'gtPhlowRunBasedText';
																											add: 'sourceString' -> '2';
																											add: 'attributeRuns'
																													-> (Dictionary new
																															add: 'items' -> #();
																															add: '__typeLabel' -> 'phlowRunsGroup';
																															yourself);
																											yourself);
																							yourself);
																			add: #nodeId -> 2;
																			yourself);
																yourself);
												yourself);
									yourself);
					yourself);
		yourself
]

{ #category : #'examples - views' }
GtRemotePhlowTreeViewAbstractExamples >> treeView [
	<gtExample>
	<return: #GtPhlowTreeView>
	| view |
	view := self createProtoView tree
		title: 'Tree';
		priority: 10;
		items: [ 1 to: 4 ];
		children: [ :aNumber | 
			aNumber = 0 ifTrue: [ #() ] ifFalse: [ 1 to: aNumber // 2 ] ].
	self assert: view title equals: 'Tree'.
	self assert: view priority equals: 10.
	self assert: view expander isNullExpander.

	^ view
]

{ #category : #'examples - specifications' }
GtRemotePhlowTreeViewAbstractExamples >> treeViewSpecification [
	<gtExample>
	<return: #GtPhlowTreeViewSpecification>
	| view declarativeSpecification |
	view := self treeView.
	declarativeSpecification := view asGtDeclarativeView.

	self assert: declarativeSpecification title equals: 'Tree'.
	self assert: declarativeSpecification priority equals: 10.
	self assert: declarativeSpecification expander isNullExpander.
	self
		assert: declarativeSpecification retriveFormattedItems
		equals: self expectedTreeWithNumberItems.

	^ declarativeSpecification
]

{ #category : #'examples - views' }
GtRemotePhlowTreeViewAbstractExamples >> treeViewWithAllLevelsExpansion [
	<gtExample>
	<return: #GtPhlowTreeView>
	| view |
	view := self createProtoView tree
		title: 'Expansion - all';
		priority: 20;
		items: [ 0 to: 4 ];
		children: [ :aNumber | 
			aNumber = 0 ifTrue: [ #() ] ifFalse: [ aNumber // 2 to: (aNumber - 1)  ] ];
		expandAll.
		
	self assert: view title equals: 'Expansion - all'.
	self assert: view priority equals: 20.
	self assert: view expander level equals: 20.

	^ view
]

{ #category : #'examples - specifications' }
GtRemotePhlowTreeViewAbstractExamples >> treeViewWithAllLevelsExpansionSpecification [
	<gtExample>
	<return: #GtPhlowTreeView>
		| view declarativeSpecification |
	view := self treeViewWithAllLevelsExpansion.
	declarativeSpecification := view asGtDeclarativeView.

	self assert: declarativeSpecification title equals: 'Expansion - all'.
	self assert: declarativeSpecification priority equals: 20.
	self assert: declarativeSpecification expander level equals: 20.
	self
		assert: declarativeSpecification retriveFormattedItems
		equals: self expectedTreeWithNumberItemsWithAllLevelsExpansion.

	^ declarativeSpecification
]

{ #category : #'examples - views' }
GtRemotePhlowTreeViewAbstractExamples >> treeViewWithItemText [
	<gtExample>
	<return: #GtPhlowTreeView>
	| view |
	view := self createProtoView tree
		title: 'Tree - with item text';
		priority: 12;
		items: [ 1 to: 5 ];
		children: [ :aNumber | 
			(aNumber // 2 = aNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					aNumber // 2 to: (aNumber - 1) ] ];
		itemText: [ :x | x asString, ' number' ].
	self assert: view title equals: 'Tree - with item text'.
	self assert: view priority equals: 12.
	^ view
]

{ #category : #'examples - views' }
GtRemotePhlowTreeViewAbstractExamples >> treeViewWithNoLevelExpansion [
	<gtExample>
	<return: #GtPhlowTreeView>
	| view |
	view := self createProtoView tree
		title: 'Expansion - no level';
		priority: 15;
		items: [ 0 to: 4 ];
		children: [ :aNumber | 
			aNumber = 0 ifTrue: [ #() ] ifFalse: [ aNumber // 2 to: (aNumber - 1)  ] ].
		
	self assert: view title equals: 'Expansion - no level'.
	self assert: view priority equals: 15.
	self assert: view expander isNullExpander.

	^ view
]

{ #category : #'examples - specifications' }
GtRemotePhlowTreeViewAbstractExamples >> treeViewWithNoLevelExpansionSpecification [
	<gtExample>
	<return: #GtPhlowTreeView>
		| view declarativeSpecification |
	view := self treeViewWithNoLevelExpansion.
	declarativeSpecification := view asGtDeclarativeView.

	self assert: declarativeSpecification title equals: 'Expansion - no level'.
	self assert: declarativeSpecification priority equals: 15.
	self assert: declarativeSpecification expander isNullExpander.
	self
		assert: declarativeSpecification retriveFormattedItems
		equals: self expectedTreeWithNumberItemsForNoExpansion.

	^ declarativeSpecification
]

{ #category : #'examples - views' }
GtRemotePhlowTreeViewAbstractExamples >> treeViewWithOneLevelExpansion [
	<gtExample>
	<return: #GtPhlowTreeView>
	| view |
	view := self createProtoView tree
		title: 'Expansion - one level';
		priority: 20;
		items: [ 0 to: 4 ];
		children: [ :aNumber | 
			aNumber = 0 ifTrue: [ #() ] ifFalse: [ aNumber // 2 to: (aNumber - 1)  ] ];
		expandUpTo: 1.
		
	self assert: view title equals: 'Expansion - one level'.
	self assert: view priority equals: 20.
	self assert: view expander level equals: 1.
	self assert: view expander asDeclarativeExpander level  equals: 1.

	^ view
]

{ #category : #'examples - specifications' }
GtRemotePhlowTreeViewAbstractExamples >> treeViewWithOneLevelExpansionSpecification [
	<gtExample>
	<return: #GtPhlowTreeView>
		| view declarativeSpecification |
	view := self treeViewWithOneLevelExpansion.
	declarativeSpecification := view asGtDeclarativeView.

	self assert: declarativeSpecification title equals: 'Expansion - one level'.
	self assert: declarativeSpecification priority equals: 20.
	self assert: declarativeSpecification expander level equals: 1.
	self
		assert: declarativeSpecification retriveFormattedItems
		equals: self expectedTreeWithNumberItemsWithOneLevelExpansion.

	^ declarativeSpecification
]

{ #category : #'examples - views' }
GtRemotePhlowTreeViewAbstractExamples >> treeViewWithStyledText [
	<gtExample>
	<return: #GtPhlowTreeView>
	| view |
	view := self createProtoView tree
		title: 'Tree - with styled text';
		priority: 11;
		items: [ 1 to: 5 ];
		children: [ :aNumber | 
			(aNumber // 2 = aNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					aNumber // 2 to: (aNumber - 1) ] ];
		itemText: [ :x | 
			| computedString|
			computedString := x asString, ' number'.
			(x \\ 2) = 0 
				ifTrue: [
					computedString := computedString asRopedText
						bold;
						highlight: (GtPhlowColor named: #yellow) asColor ].
			computedString ].
	self assert: view title equals: 'Tree - with styled text'.
	self assert: view priority equals: 11.
	^ view
]

{ #category : #'examples - specifications' }
GtRemotePhlowTreeViewAbstractExamples >> treeViewWithStyledTextSpecification [
	<gtExample>
	<return: #GtPhlowTreeViewSpecification>
	| view declarativeSpecification |
	
	view := self treeViewWithStyledText.
	declarativeSpecification := view asGtDeclarativeView.

	self assert: declarativeSpecification title equals: 'Tree - with styled text'.
	self assert: declarativeSpecification priority equals: 11.

	^ declarativeSpecification
]

{ #category : #'examples - views' }
GtRemotePhlowTreeViewAbstractExamples >> treeViewWithSuchThatExpansionBelowFour [
	<gtExample>
	<return: #GtPhlowTreeView>
	| view |
	
	view := self createProtoView tree
		title: 'Expansion - below four';
		priority: 20;
		items: [ 1 to: 5 ];
		children: [ :aNumber | 
			(aNumber // 2 = aNumber)
				ifTrue: [ #() ] 
				ifFalse: [
					aNumber // 2 to: (aNumber - 1) ] ];
		expandSuchThat: [ :aNode :aNumber | aNumber < 4 ].
		
	self assert: view title equals: 'Expansion - below four'.
	self assert: view priority equals: 20.
	self 
		assert: view expander asDeclarativeExpander conditionString 
		equals: '[ :aNode :aNumber | aNumber < 4 ]'.

	^ view
]

{ #category : #'examples - specifications' }
GtRemotePhlowTreeViewAbstractExamples >> treeViewWithSuchThatExpansionBelowFourSpecification [
	<gtExample>
	<return: #GtPhlowTreeView>
		| view declarativeSpecification |
	view := self treeViewWithSuchThatExpansionBelowFour.
	declarativeSpecification := view asGtDeclarativeView.

	self assert: declarativeSpecification title equals: 'Expansion - below four'.
	self assert: declarativeSpecification priority equals: 20.
	self 
		assert: declarativeSpecification expander conditionString 
		equals: '[ :aNode :aNumber | aNumber < 4 ]'.
	
	self
		assert: declarativeSpecification retriveFormattedItems
		equals: self expectedTreeWithNumberItemsWithExpansionBelowFour.

	^ declarativeSpecification
]

{ #category : #'examples - views' }
GtRemotePhlowTreeViewAbstractExamples >> treeViewWithTwoLevelsExpansion [
	<gtExample>
	<return: #GtPhlowTreeView>
	| view |
	view := self createProtoView tree
		title: 'Expansion - two levels';
		priority: 20;
		items: [ 0 to: 4 ];
		children: [ :aNumber | 
			aNumber = 0 ifTrue: [ #() ] ifFalse: [ aNumber // 2 to: (aNumber - 1)  ] ];
		expandUpTo: 2.
		
	self assert: view title equals: 'Expansion - two levels'.
	self assert: view priority equals: 20.
	self assert: view expander level equals: 2.

	^ view
]

{ #category : #'examples - specifications' }
GtRemotePhlowTreeViewAbstractExamples >> treeViewWithTwoLevelsExpansionSpecification [
	<gtExample>
	<return: #GtPhlowTreeView>
		| view declarativeSpecification |
	view := self treeViewWithTwoLevelsExpansion.
	declarativeSpecification := view asGtDeclarativeView.

	self assert: declarativeSpecification title equals: 'Expansion - two levels'.
	self assert: declarativeSpecification priority equals: 20.
	self assert: declarativeSpecification expander level equals: 2.
	self
		assert: declarativeSpecification retriveFormattedItems
		equals: self expectedTreeWithNumberItemsWithTwoLevelsExpansion.

	^ declarativeSpecification
]
