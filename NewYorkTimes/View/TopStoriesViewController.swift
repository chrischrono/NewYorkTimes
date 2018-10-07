//
//  TopStoriesViewController.swift
//  NewYorkTimes
//
//  Created by Christian  Huang on 08/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import UIKit

//New York Times API Key: 2e349727818b436f9806e608ceeec68a
class TopStoriesViewController: UIViewController {
    @IBOutlet weak var topStoriesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension TopStoriesViewController: UITableViewDelegate {
    
}
