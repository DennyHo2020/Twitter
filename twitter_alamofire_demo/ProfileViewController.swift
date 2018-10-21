//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Denny Ho on 10/20/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
   
    @IBOutlet weak var tweetsLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profilePicImageView: UIImageView!
    
    var user : User?
    
    func updateAllContent() {
        if let user = self.user {
            if let picURL = user.profilepic {
                profilePicImageView.af_setImage(withURL: picURL)
            }
            nameLabel.text = user.name
            usernameLabel.text = "@\(user.screenName!)"
            followersLabel.text = "\(user.followercount!)"
            followingLabel.text = "\(user.friendcount!)"
            tweetsLabel.text = "\(user.statusCount!)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateAllContent()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
