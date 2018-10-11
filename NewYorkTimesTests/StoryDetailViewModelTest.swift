//
//  StoryDetailViewModelTest.swift
//  NewYorkTimesTests
//
//  Created by Christian  Huang on 12/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import XCTest
@testable import NewYorkTimes

class StoryDetailViewModelTest: XCTestCase {
    
    var storyDetailViewModel: StoryDetailViewModel!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let media = Media(url: "http://media.com", format: "mediumThreeByTwo210", width: 210, height: 140)
        let story = Story(section: "test",
                          subsection: "subTest",
                          title: "title",
                          description: "description",
                          author: "by author",
                          url: "http://test.com",
                          multimedia: [media])
        
        storyDetailViewModel = StoryDetailViewModel(with: story)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLoadStory() {
        var testSubsection = ""
        var testTitle = ""
        var testImageUrl: String?
        var testDescription = ""
        var testAuthor = ""
        storyDetailViewModel.setStoryDetailClosure = {(subsection, title, imageUrl, description, author)->() in
            testSubsection = subsection
            testTitle = title
            testImageUrl = imageUrl
            testDescription = description
            testAuthor = author
        }
        storyDetailViewModel.loadStory()
        
        XCTAssertEqual(testSubsection, "subTest")
        XCTAssertEqual(testTitle, "title")
        XCTAssertEqual(testImageUrl, "http://media.com")
        XCTAssertEqual(testDescription, "description")
        XCTAssertEqual(testAuthor, "by author")
    }
    
    func testGetSeeMoreLink() {
        XCTAssertEqual(storyDetailViewModel.getSeeMoreLink(), "http://test.com")
    }

}
