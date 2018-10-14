//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Denny Ho on 10/8/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {

    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    
    //var parentView: TimelineViewController?
    
    
    var profilePic: URL?
    
    var tweet: Tweet? {
        didSet{
            tweetTextLabel.text = tweet?.text
            dateLabel.text = tweet?.createdAtString
            retweetButton.setTitle("\(tweet?.retweetCount)", for: .normal)
            favoriteButton.setTitle("\(tweet?.favoriteCount)", for: .normal)
            usernameLabel.text = tweet?.user.name
            handleLabel.text = "@" + (tweet?.user.screenName)!
            profilePic = tweet?.user.profilepic
            userImageView.af_setImage(withURL: profilePic!)
            
        }
    }
    var user: User?

    
    @IBAction func onRetweet(_ sender: Any) {
        //tweet?.retweeted = true
        //tweet?.retweetCount = (tweet?.retweetCount)! + 1
        APIManager.shared.retweet(tweet!) { (tweet: Tweet?, error: Error?) in
            if let  error = error {
                print("Error retweeting tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                print("Successfully retweeted the following Tweet: \n\(tweet.text)")
            }
            
        }
        
    }
    
    @IBAction func onFavorite(_ sender: Any) {
        tweet?.favorited = true
        tweet?.favoriteCount = (tweet?.favoriteCount)! + 1
        APIManager.shared.favorite(tweet!) { (tweet: Tweet?, error: Error?) in
            if let  error = error {
                print("Error favoriting tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                print("Successfully favorited the following Tweet: \n\(tweet.text)")
            }
        
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
