//
//  DetailsViewController.swift
//
//
//  Created by Denny Ho on 10/15/18.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteLabel: UIButton!
    @IBOutlet weak var userImageView: UIImageView!
    
    var profilePic: URL?

    var tweet: Tweet? {
        didSet{
            tweetLabel.text = tweet?.text
            dateLabel.text = tweet?.createdAtString
            retweetButton.setTitle("\(tweet!.retweetCount)", for: .normal)
            favoriteLabel.setTitle("\(tweet!.favoriteCount!)", for: .normal)
            usernameLabel.text = tweet?.user.name
            handleLabel.text = "@" + (tweet?.user.screenName)!
            profilePic = tweet?.user.profilepic
            userImageView.af_setImage(withURL: profilePic!)
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
