//
//  StoryDetailViewController.swift
//  NewYorkTimes
//
//  Created by Christian  Huang on 11/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import UIKit
import Kingfisher

class StoryDetailViewController: UIViewController {
    @IBOutlet weak var storyImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var seeMoreButton: UIButton!
    
    var storyDetailViewModel: StoryDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        storyDetailViewModel.loadStory()
    }
    
    @IBAction func seeMoreButtonDidTapped(_ sender: Any) {
        let url = storyDetailViewModel.getSeeMoreLink()
        print(url)
    }
    
}

// MARK: - View Model
extension StoryDetailViewController {
    /**
     Initialize the view model
     */
    func initViewModel() {
        storyDetailViewModel.setStoryDetailClosure = {(subsection, title, imageUrl, description, author)->() in
            self.title = subsection
            self.titleLabel.text = title
            if let imageUrl = imageUrl {
                self.storyImageView.kf.setImage(with: URL(string: imageUrl))
            } else {
                //self.storyImageViewWidthContraint.constant = 0
                self.storyImageView.removeFromSuperview()
            }
            self.descriptionLabel.text = description
            self.authorLabel.text = author
        }
    }
}
