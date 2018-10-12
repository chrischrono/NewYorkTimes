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
    
    /** to show all Top Stories returned by the API  */
    @IBOutlet weak var topStoriesTableView: UITableView!
    
    /** handle the data source for topStoriesTableView */
    var topStoriesDataSource = TopStoriesDataSource()
    /** view model that handle the Top Stories retrieving process */
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
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let storyDetailViewController = segue.destination as? StoryDetailViewController, let indexPath = sender as? IndexPath {
            storyDetailViewController.storyDetailViewModel = topStoriesViewModel.getStoryDetailViewModel(for: indexPath)
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

// MARK: - UITableViewDelegate
extension TopStoriesViewController: UITableViewDelegate {
    /**
     Reload data for topStoriesTableView
     */
    func reloadTopStoriesTableView() {
        DispatchQueue.main.async {
            self.topStoriesTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "storyDetailSegue", sender: indexPath)
    }
    
}
