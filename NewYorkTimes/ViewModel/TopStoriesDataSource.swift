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
    let topStories: Dynamic<[Story]> = Dynamic([])
    /** hold the data retrieving status */
    var status: String?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topStories.value.count > 0 ? topStories.value.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if topStories.value.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCellIdentifier", for: indexPath)
            cell.textLabel?.text = status ?? "No Story avaliable"
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "storyCellIdentifier", for: indexPath) as! StoryCell
        
        let story = topStories.value[indexPath.row]
        cell.title = story.title
        cell.author = story.author
        
        let media = story.multimedia.filter { $0.format == "thumbLarge" }
        cell.thumbnailUrl = media.count > 0 ? media[0].url : nil
        
        return cell
    }
    

}
