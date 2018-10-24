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
    /** hold Story's thumbnail url and upon setting will load the thumbnailImageView */
    var thumbnailUrl: String? {
        didSet {
            if let thumbnailUrl = thumbnailUrl {
                thumbnailImageView.kf.setImage(with: URL(string: thumbnailUrl))
            } else {
                thumbnailImageView.image = nil
            }
        }
    }
    /** hold title and upon setting will set the titleLabel */
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    /** hold author and upon setting will set the authorLabel */
    var author: String? {
        didSet {
            authorLabel.text = author
        }
    }
    
    /** to show Story's thumbnail image */
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    /** to show Story's title image */
    @IBOutlet private weak var titleLabel: UILabel!
    /** to show Story's author image */
    @IBOutlet private weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
