//
//  StoryCell.swift
//  NewYorkTimes
//
//  Created by Christian  Huang on 08/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import UIKit
import Kingfisher

class StoryCell: UITableViewCell {
    var thumbnailUrl: String? {
        didSet {
            if let thumbnailUrl = thumbnailUrl {
                thumbnailImageView.kf.setImage(with: URL(string: thumbnailUrl))
            } else {
                thumbnailImageView.image = nil
            }
        }
    }
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    var author: String? {
        didSet {
            authorLabel.text = author
        }
    }
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
