// Generated by bin/class-dump/dump.rb

#ifndef XCT_UI_TESTING_AVAILABLE
#import "XCTest/NSArray-XCTestAdditions.h"
#import "XCTest/NSBundle-XCTestAdditions.h"
#import "XCTest/NSError-XCUITestingErrors.h"
#import "XCTest/NSException-XCTestAdditions.h"
#import "XCTest/NSKeyedArchiver-XCTestAdditions.h"
#import "XCTest/NSKeyedUnarchiver-XCTestAdditions.h"
#import "XCTest/NSMutableArray-XCTestAdditions.h"
#import "XCTest/NSObject-ClassDescription_Extras.h"
#import "XCTest/NSSet-XCTestAdditions.h"
#import "XCTest/NSString-XCTAdditions.h"
#import "XCTest/NSValue-XCTestAdditions.h"
#import "XCTest/UIGestureRecognizer-RecordingAdditions.h"
#import "XCTest/UILongPressGestureRecognizer-RecordingAdditions.h"
#import "XCTest/UIPanGestureRecognizer-RecordingAdditions.h"
#import "XCTest/UIPinchGestureRecognizer-RecordingAdditions.h"
#import "XCTest/UISwipeGestureRecognizer-RecordingAdditions.h"
#import "XCTest/UITapGestureRecognizer-RecordingAdditions.h"
#import "XCTest/XCAXClient_iOS.h"
#import "XCTest/XCActivityRecord.h"
#import "XCTest/XCApplicationQuery.h"
#import "XCTest/XCDebugLogDelegate-Protocol.h"
#import "XCTest/XCDeviceEvent-Dispatch.h"
#import "XCTest/XCElementSnapshot-Hitpoint.h"
#import "XCTest/XCElementSnapshot-XCUIElementAttributes.h"
#import "XCTest/XCElementSnapshot-XCUIElementSnapshot.h"
#import "XCTest/XCEventGenerator.h"
#import "XCTest/XCPointerEvent.h"
#import "XCTest/XCPointerEventPath.h"
#import "XCTest/XCSourceCodeRecording.h"
#import "XCTest/XCSourceCodeTreeNode.h"
#import "XCTest/XCSourceCodeTreeNodeEnumerator.h"
#import "XCTest/XCSymbolicationRecord.h"
#import "XCTest/XCSynthesizedEventRecord.h"
#import "XCTest/XCTASDebugLogDelegate-Protocol.h"
#import "XCTest/XCTActivity-Protocol.h"
#import "XCTest/XCTActivityAggregationRecord.h"
#import "XCTest/XCTActivityRecordStack.h"
#import "XCTest/XCTAggregateSuiteRunStatistics.h"
#import "XCTest/XCTAggregateSuiteRunStatisticsRecord.h"
#import "XCTest/XCTAttachment.h"
#import "XCTest/XCTAttachmentManager.h"
#import "XCTest/XCTAutomationTarget-Protocol.h"
#import "XCTest/XCTBlockingQueue.h"
#import "XCTest/XCTCompoundExpectation.h"
#import "XCTest/XCTContext.h"
#import "XCTest/XCTDarwinNotificationExpectation.h"
#import "XCTest/XCTElementSnapshotAttributeDataSource-Protocol.h"
#import "XCTest/XCTElementSnapshotProvider-Protocol.h"
#import "XCTest/XCTFailure.h"
#import "XCTest/XCTFailureLocation.h"
#import "XCTest/XCTFixedPriorityTestScheduler.h"
#import "XCTest/XCTFuture.h"
#import "XCTest/XCTImage.h"
#import "XCTest/XCTKVOExpectation.h"
#import "XCTest/XCTMemoryChecker.h"
#import "XCTest/XCTMemoryCheckerDelegate-Protocol.h"
#import "XCTest/XCTMemoryMarker.h"
#import "XCTest/XCTMetric.h"
#import "XCTest/XCTNSNotificationExpectation.h"
#import "XCTest/XCTNSPredicateExpectation.h"
#import "XCTest/XCTNSPredicateExpectationObject-Protocol.h"
#import "XCTest/XCTPromise.h"
#import "XCTest/XCTResult.h"
#import "XCTest/XCTRunnerAutomationSession-Protocol.h"
#import "XCTest/XCTRunnerAutomationSession.h"
#import "XCTest/XCTRunnerDTServiceHubSession.h"
#import "XCTest/XCTRunnerDaemonSession.h"
#import "XCTest/XCTRunnerIDESession.h"
#import "XCTest/XCTRunnerIDESessionDelegate-Protocol.h"
#import "XCTest/XCTSerializedTransportWrapper.h"
#import "XCTest/XCTTestIdentifier.h"
#import "XCTest/XCTTestRunSession.h"
#import "XCTest/XCTTestRunSessionDelegate-Protocol.h"
#import "XCTest/XCTTestScheduler-Protocol.h"
#import "XCTest/XCTTestSchedulerWorker-Protocol.h"
#import "XCTest/XCTTestWorker-Protocol.h"
#import "XCTest/XCTUniformTypeIdentifier.h"
#import "XCTest/XCTWaiter.h"
#import "XCTest/XCTWaiterDelegate-Protocol.h"
#import "XCTest/XCTWaiterManagement-Protocol.h"
#import "XCTest/XCTWaiterManager.h"
#import "XCTest/XCTest.h"
#import "XCTest/XCTestCase.h"
#import "XCTest/XCTestCaseRun.h"
#import "XCTest/XCTestCaseSuite.h"
#import "XCTest/XCTestConfiguration.h"
#import "XCTest/XCTestDriver.h"
#import "XCTest/XCTestDriverInterface-Protocol.h"
#import "XCTest/XCTestExpectation.h"
#import "XCTest/XCTestExpectationDelegate-Protocol.h"
#import "XCTest/XCTestExpectationWaiter.h"
#import "XCTest/XCTestLog.h"
#import "XCTest/XCTestManager_IDEInterface-Protocol.h"
#import "XCTest/XCTestManager_ManagerInterface-Protocol.h"
#import "XCTest/XCTestManager_TestsInterface-Protocol.h"
#import "XCTest/XCTestMisuseObserver.h"
#import "XCTest/XCTestObservation-Protocol.h"
#import "XCTest/XCTestObservationCenter.h"
#import "XCTest/XCTestObserver.h"
#import "XCTest/XCTestProbe.h"
#import "XCTest/XCTestRun.h"
#import "XCTest/XCTestSuite.h"
#import "XCTest/XCTestSuiteRun.h"
#import "XCTest/XCTestWaiter.h"
#import "XCTest/XCUIAXNotificationHandling-Protocol.h"
#import "XCTest/XCUIAccessibilityInterface-Protocol.h"
#import "XCTest/XCUIApplication.h"
#import "XCTest/XCUIApplicationIdentifier.h"
#import "XCTest/XCUIApplicationImpl.h"
#import "XCTest/XCUIApplicationImplDepot.h"
#import "XCTest/XCUIApplicationManaging-Protocol.h"
#import "XCTest/XCUIApplicationMonitor-Protocol.h"
#import "XCTest/XCUIApplicationMonitor.h"
#import "XCTest/XCUIApplicationMonitor_iOS.h"
#import "XCTest/XCUIApplicationOpenRequest.h"
#import "XCTest/XCUIApplicationProcess.h"
#import "XCTest/XCUIApplicationProcessTracker-Protocol.h"
#import "XCTest/XCUIApplicationRegistry.h"
#import "XCTest/XCUIApplicationRegistryRecord.h"
#import "XCTest/XCUICoordinate.h"
#import "XCTest/XCUIDevice.h"
#import "XCTest/XCUIElement.h"
#import "XCTest/XCUIElementAsynchronousHandlerWrapper.h"
#import "XCTest/XCUIElementAttributes-Protocol.h"
#import "XCTest/XCUIElementAttributesPrivate-Protocol.h"
#import "XCTest/XCUIElementHitPointCoordinate.h"
#import "XCTest/XCUIElementQuery.h"
#import "XCTest/XCUIElementSnapshot-Protocol.h"
#import "XCTest/XCUIElementSnapshotProviding-Protocol.h"
#import "XCTest/XCUIElementTypeQueryProvider-Protocol.h"
#import "XCTest/XCUIHitPointResult.h"
#import "XCTest/XCUIPlatformApplicationManager.h"
#import "XCTest/XCUIPoint.h"
#import "XCTest/XCUIPointTransformationRequest.h"
#import "XCTest/XCUIRecorderNodeFinder.h"
#import "XCTest/XCUIRecorderNodeFinderMatch.h"
#import "XCTest/XCUIRecorderTimingMessage.h"
#import "XCTest/XCUIRecorderUtilities.h"
#import "XCTest/XCUIRect.h"
#import "XCTest/XCUIRectTransformationRequest.h"
#import "XCTest/XCUIRemoteAXInterface-Protocol.h"
#import "XCTest/XCUIScreen.h"
#import "XCTest/XCUIScreenshot.h"
#import "XCTest/XCUIScreenshotProviding-Protocol.h"
#import "XCTest/XCUISiriService.h"
#import "XCTest/XCUITestContext.h"
#import "XCTest/XCUITestContextScope.h"
#import "XCTest/XCUITransformParameters.h"
#import "XCTest/XCUIXcodeApplicationManaging-Protocol.h"
#import "XCTest/_XCInternalTestRun.h"
#import "XCTest/_XCKVOExpectationImplementation.h"
#import "XCTest/_XCTAttachmentImplementation.h"
#import "XCTest/_XCTCompoundExpectationImplementation.h"
#import "XCTest/_XCTContextImplementation.h"
#import "XCTest/_XCTDarwinNotificationExpectationImplementation.h"
#import "XCTest/_XCTImageImplementation.h"
#import "XCTest/_XCTNSNotificationExpectationImplementation.h"
#import "XCTest/_XCTNSPredicateExpectationImplementation.h"
#import "XCTest/_XCTWaiterImpl.h"
#import "XCTest/_XCTestCaseImplementation.h"
#import "XCTest/_XCTestCaseInterruptionException.h"
#import "XCTest/_XCTestExpectationImplementation.h"
#import "XCTest/_XCTestImplementation.h"
#import "XCTest/_XCTestObservationCenterImplementation.h"
#import "XCTest/_XCTestObservationPrivate-Protocol.h"
#import "XCTest/_XCTestSuiteImplementation.h"
#endif
