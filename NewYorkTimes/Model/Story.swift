//
//  Story.swift
//  NewYorkTimes
//
//  Created by Christian  Huang on 10/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import Foundation

struct TopStoriesAPIResponse: Codable {
    let status: String
    let section: String
    let lastUpdated: String
    let stories: [Story]
    
    enum CodingKeys: String, CodingKey {
        case status
        case section
        case lastUpdated = "last_updated"
        case stories = "results"
    }
}

struct Story: Codable {
    let section: String
    let subsection: String
    let title: String
    let description: String
    let author: String
    let url: String
    let multimedia: [Media]
    
    enum CodingKeys: String, CodingKey {
        case section
        case subsection
        case title
        case description = "abstract"
        case author = "byline"
        case url
        case multimedia
    }
}

struct Media: Codable {
    let url: String
    let format: String
    let width: Int
    let height: Int
}
