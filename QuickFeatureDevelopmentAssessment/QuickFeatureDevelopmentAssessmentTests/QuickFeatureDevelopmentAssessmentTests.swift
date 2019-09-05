//
//  QuickFeatureDevelopmentAssessmentTests.swift
//  QuickFeatureDevelopmentAssessmentTests
//
//  Created by MCS on 9/4/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import XCTest
@testable import QuickFeatureDevelopmentAssessment

class QuickFeatureDevelopmentAssessmentTests: XCTestCase {
    var sut: FriendsViewModel!

    override func setUp() {
        super.setUp()
        sut = FriendsViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumberOfEpisodesBeforeGettingData() {
        let expectedValue = 0
        XCTAssertEqual(expectedValue, sut.numberOfEpisodes())
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testNumberOfEpisodesAfterGettingData() {
        let newEpisodeExpectation = expectation(description: "")
        let newEpisode = Episode()
        let newEpisodeContainer = try? EpisodeContainer(from: [newEpisode] as! Decoder)
        let newEpisodeContainerData = try!
            sut.getData (session: MockSession(data: newEpisodeData)) {
        
            XCTAssertEqual(self.sut.numberOfEpisodes(), 1)
            newEpisodeExpectation.fulfill()
        }
        waitForExpectations(timeout: 2, handler: nil)
    }
    func testGetHundredEpisode() {
        sut.getTDDNewEpisode {
            XCTAssert(self.sut.FriendViewModel())
        }
    }
}

struct MockSession: Session {
    let data: Data?
    
    func getData(from url: URL, completion: ((Data?, Error?) -> Void)?) {
        completion?(data, nil)
    }
}
