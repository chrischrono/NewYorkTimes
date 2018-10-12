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
    /** hold the topStories's section */
    var section = ""
    
    /** hold the network manager for New York Times's API */
    lazy var networkManager = NetworkManager()
    
    /** closure to reload TopStoriesTableView */
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
    
    /**
     Generate StoryDetailViewModel for selected indexPath
     - Parameter indexPath: selected indexPath of top stories.
     */
    func getStoryDetailViewModel(for indexPath:IndexPath) -> StoryDetailViewModel?{
        if let dataSource = topStoriesDataSource, dataSource.topStories.value.count > 0 {
            let storyDetailViewModel = StoryDetailViewModel(with: dataSource.topStories.value[indexPath.row])
            return storyDetailViewModel
        }
        
        return nil
    }
}
