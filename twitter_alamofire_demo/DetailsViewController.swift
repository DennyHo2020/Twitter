//
//  DetailsViewController.swift
//
//
//  Created by Denny Ho on 10/15/18.
//

import UIKit
import AlamofireImage

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteLabel: UIButton!
    @IBOutlet weak var userImageView: UIImageView!
    
    var profilePic: URL?

    var tweet: Tweet?
//        didSet{
//            tweetLabel.text = tweet?.text
//            dateLabel.text = tweet?.createdAtString
//            retweetButton.setTitle("\(tweet!.retweetCount)", for: .normal)
//            favoriteLabel.setTitle("\(tweet!.favoriteCount!)", for: .normal)
//            usernameLabel.text = tweet?.user.name
//            handleLabel.text = "@" + (tweet?.user.screenName)!
//            profilePic = tweet?.user.profilepic
//            userImageView.af_setImage(withURL: profilePic!)
//
//        }
    
    func updateUserInformation() {
        if let tweet = self.tweet {
            tweetLabel.text = tweet.text
            dateLabel.text = tweet.createdAtString
            retweetButton.setTitle("\(tweet.retweetCount)", for: .normal)
            favoriteLabel.setTitle("\(tweet.favoriteCount!)", for: .normal)
            usernameLabel.text = tweet.user.name
            handleLabel.text = "@" + (tweet.user.screenName)!
            profilePic = tweet.user.profilepic
            userImageView.af_setImage(withURL: profilePic!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUserInformation()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
