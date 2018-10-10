//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Denny Ho on 10/8/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    //var parentView: TimelineViewController?
    
    
    var tweet: Tweet?
    var user: User?

    
    func updateAllContent()
    {
        tweetTextLabel.text = tweet?.text ?? "nil"
        
    }
    
    @IBAction func onRetweet(_ sender: Any) {
        
        
    }
    
    @IBAction func onFavorite(_ sender: Any) {
        
        
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
