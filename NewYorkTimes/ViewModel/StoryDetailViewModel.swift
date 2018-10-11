//
//  StoryDetailViewModel.swift
//  NewYorkTimes
//
//  Created by Christian  Huang on 11/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import UIKit

class StoryDetailViewModel: NSObject {
    var story: Story
    var setStoryDetailClosure: ((String,String,String?,String,String)->())?
    
    init(with story: Story) {
        self.story = story
    }

}

extension StoryDetailViewModel {
    func loadStory() {
        let media = story.multimedia.filter { $0.format == "mediumThreeByTwo210" }
        var imageUrl: String?
        if media.count > 0 {
            let image = media[0]
            imageUrl = image.url
        }
        
        setStoryDetailClosure?(story.subsection.count > 0 ? story.subsection : story.section,
                               story.title,
                               imageUrl,
                               story.description,
                               story.author)
    }
    
    func getSeeMoreLink() -> String {
        return story.url
    }
}
