//
//  TopStoriesViewModelTests.swift
//  NewYorkTimesTests
//
//  Created by Christian  Huang on 12/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import XCTest
@testable import NewYorkTimes

class TopStoriesViewModelTests: XCTestCase {
    class MockNetworkManager: NetworkManager {
        var mockTopStories: [Story]?
        var mockError: String?
        
        override func getTopStories(section: String, apiKey: String, completion: @escaping (_ stories: [Story]?,_ error: String?)->()) {
            completion( mockTopStories, mockError)
        }
    }
    
    var topStoriesDataSource = TopStoriesDataSource()
    var topStoriesViewModel: TopStoriesViewModel!
    var networkManager = MockNetworkManager()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        topStoriesViewModel = TopStoriesViewModel(dataSource: topStoriesDataSource)
        topStoriesViewModel.networkManager = networkManager
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLoadTopStoriesError() {
        networkManager.mockError = "This is an Error"
        topStoriesViewModel.loadTopStories(section: "test")
        
        XCTAssertEqual(topStoriesDataSource.status, networkManager.mockError)
    }
    
    func testLoadTopStories() {
        let data = loadDataFromBundle(withName: "topStories", extension: "json")
        let apiResponse = try! JSONDecoder().decode(TopStoriesAPIResponse.self, from: data)
        networkManager.mockTopStories = apiResponse.stories
        
        topStoriesViewModel.loadTopStories(section: "test")
        
        XCTAssertEqual(topStoriesViewModel.section, "test")
        XCTAssertEqual(topStoriesDataSource.topStories.value.count, 3)
    }

}
