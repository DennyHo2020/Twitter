//
//  TimelineViewController.swift
//  twitter_alamofire_demo
//
//  Created by Aristotle on 2018-08-11.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ComposeViewControllerDelegate {
    
    func did(post: Tweet) {
        updateUserInformation()
        completeNetworkRequest()
    }
    
    @IBOutlet weak var tweetTableView: UITableView!
    
    var tweets: [Tweet]! = []
    var refreshControl: UIRefreshControl!

    
    
    @IBAction func didTapLogout(_ sender: Any) {
        APIManager.shared.logout()
    }
    
    @IBAction func didTapCompose(_ sender: Any) {
        self.performSegue(withIdentifier: "ComposeSegue", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUserInformation()
        tweetTableView.dataSource = self
        tweetTableView.rowHeight = 150
        tweetTableView.estimatedRowHeight = 200
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(TimelineViewController.completeNetworkRequest), for: .valueChanged)
        tweetTableView.insertSubview(refreshControl, at: 0)
        
        self.completeNetworkRequest()

        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.updateUserInformation()
        if (segue.identifier == "DetailSegue") {
            let cell = sender as! UITableViewCell
            if let indexPath = tweetTableView.indexPath(for: cell) {
                let tweet = tweets[indexPath.row]
                let detailViewController = segue.destination as! DetailsViewController
                detailViewController.tweet = tweet
                
            }
        }
        if (segue.identifier == "ComposeSegue") {
            if let composeView = segue.destination as? ComposeViewController {
                composeView.delegate = self 
                composeView.user = User.current
            }
        }
        if (segue.identifier == "ProfileSegue") {
            if let profileView = segue.destination as? ProfileViewController {
                profileView.user = User.current
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        cell.tweet = tweets[indexPath.row]
        return cell
    }
    
    func completeNetworkRequest() {
        APIManager.shared.getHomeTimeLine { (tweet, Error) in
            self.tweets = tweet
            print(self.tweets)
        }
    }
    func updateUserInformation() {
        APIManager.shared.getCurrentAccount { (user, error) in
            User.current = user
        }
    }
    
    @objc func refreshControlAction(_ refreshControl: UIRefreshControl) {
        completeNetworkRequest()
        refreshControl.endRefreshing()
    }
    
}
