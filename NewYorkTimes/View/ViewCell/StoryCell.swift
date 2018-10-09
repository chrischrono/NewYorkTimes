//
//  StoryCell.swift
//  NewYorkTimes
//
//  Created by Christian  Huang on 08/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import UIKit

class StoryCell: UITableViewCell {
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
