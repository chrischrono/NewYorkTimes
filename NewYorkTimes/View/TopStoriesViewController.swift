//
//  TopStoriesViewController.swift
//  NewYorkTimes
//
//  Created by Christian  Huang on 08/10/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import UIKit

//New York Times API Key: 2e349727818b436f9806e608ceeec68a
//http://api.nytimes.com/svc/topstories/v2/{section}.{response-format}?api-key={your-api-key}
//http://api.nytimes.com/svc/topstories/v2/home.json?api-key=2e349727818b436f9806e608ceeec68a
class TopStoriesViewController: UIViewController {
    
    @IBOutlet weak var topStoriesTableView: UITableView!
    
    var topStoriesDataSource = TopStoriesDataSource()
    var topStoriesViewModel: TopStoriesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        if topStoriesDataSource.topStories.value.count == 0 {
            topStoriesViewModel.loadTopStories(section: "home")
        }
    }

}

// MARK: - View Model
extension TopStoriesViewController {
    /**
     Initialize the view model
     */
    func initViewModel() {
        topStoriesTableView.dataSource = topStoriesDataSource
        topStoriesDataSource.topStories.listener = {([Story])->() in
            self.reloadTopStoriesTableView()
        }
        topStoriesViewModel = TopStoriesViewModel(dataSource: topStoriesDataSource)
        topStoriesViewModel.reloadTopStoriesTableViewClosure = { ()->() in
            self.reloadTopStoriesTableView()
        }
    }
}

extension TopStoriesViewController: UITableViewDelegate {
    func reloadTopStoriesTableView() {
        DispatchQueue.main.async {
            self.topStoriesTableView.reloadData()
        }
    }
    
}
