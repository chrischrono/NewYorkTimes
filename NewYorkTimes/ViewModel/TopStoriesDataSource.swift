//
//  TopStoriesDataSource.swift
//  NewYorkTimes
//
//  Created by Christian  Huang on 10/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import UIKit

/** Class that hold topStoryList and also handle the UITableViewDataSource */
class TopStoriesDataSource: NSObject, UITableViewDataSource {
    /** hold the topStoryList */
    var topStories: Dynamic<[Story]> = Dynamic([])
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topStories.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "storyCellIdentifier", for: indexPath) as! StoryCell
        
        let story = topStories.value[indexPath.row]
        cell.title = story.title
        cell.author = story.author
        
        let media = story.multimedia.filter { $0.format == "thumbLarge" }
        cell.thumbnailUrl = media.count > 0 ? media[0].url : nil
        
        return cell
    }
    

}
