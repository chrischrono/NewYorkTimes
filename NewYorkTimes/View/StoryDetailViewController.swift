//
//  StoryDetailViewController.swift
//  NewYorkTimes
//
//  Created by Christian  Huang on 11/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import UIKit

class StoryDetailViewController: UIViewController {
    @IBOutlet weak var storyImageView: UIImageView!
    @IBOutlet weak var storyImageViewHeightContraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var seeMoreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func seeMoreButtonDidTapped(_ sender: Any) {
    }
    
    

}
