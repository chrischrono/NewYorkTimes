//
//  TopStoriesDataSourceTests.swift
//  NewYorkTimesTests
//
//  Created by Christian  Huang on 12/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import XCTest
@testable import NewYorkTimes

class TopStoriesDataSourceTests: XCTestCase {
    var tableView = UITableView()
    var topStoriesDataSource = TopStoriesDataSource()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let data = loadDataFromBundle(withName: "topStories", extension: "json")
        let apiResponse = try! JSONDecoder().decode(TopStoriesAPIResponse.self, from: data)
        topStoriesDataSource.topStories.value = apiResponse.stories
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "infoCellIdentifier")
        tableView.register(StoryCell.self, forCellReuseIdentifier: "storyCellIdentifier")
        tableView.dataSource = topStoriesDataSource
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testDataSourceCount() {
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 3)
    }

}
