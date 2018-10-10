//
//  TopStoriesViewModel.swift
//  NewYorkTimes
//
//  Created by Christian  Huang on 10/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import UIKit

class TopStoriesViewModel: NSObject {
    /** hold the topStoryList */
    weak var topStoriesDataSource: TopStoriesDataSource?
    var section = ""
    
    lazy var networkManager = NetworkManager()
    
    var reloadTopStoriesTableViewClosure: (()->())?
    
    /**
     Initialize with dataSource
     - Parameter dataSource: dataSource that will hold the videoList.
     */
    init(dataSource: TopStoriesDataSource?) {
        self.topStoriesDataSource = dataSource
    }

}

extension TopStoriesViewModel {
    /**
     Load topStories from API
     - Parameter section: specific section of top stories.
     */
    func loadTopStories(section: String) {
        self.section = section
        topStoriesDataSource?.status = "Loading..."
        reloadTopStoriesTableViewClosure?()
        
        networkManager.getTopStories(section: section, apiKey: Constants.kNewYorkTimesAPIKey) { (stories, error) in
            if let error = error {
                self.topStoriesDataSource?.status = error
                self.reloadTopStoriesTableViewClosure?()
                return
            }
            
            self.topStoriesDataSource?.status = nil
            self.topStoriesDataSource?.topStories.value = stories!
        }
    }
}
