//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Denny Ho on 10/15/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UITextViewDelegate {

    
    @IBOutlet weak var charCountLabel: UILabel!
    @IBOutlet weak var tweetButton: UIButton!
    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var tweetTextView: UITextView!
    
    weak var delegate: ComposeViewControllerDelegate?
    var characterLimit : Int = 141
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetButton.isEnabled = false
        tweetTextView.delegate = self as UITextViewDelegate
        updateUserInformation()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapTweet(_ sender: Any) {
        let tweetText = tweetTextView.text!
        APIManager.shared.composeTweet(with: tweetText) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
            }
        }
        self.performSegue(withIdentifier: "ReturnSegue", sender: nil)
    }
    
    @IBAction func onTapCancel(_ sender: Any) {
        self.performSegue(withIdentifier: "ReturnSegue", sender: nil)
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    // Delegate
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        let current = newText.count
        
        charCountLabel.text = "Character Count: \(current)"
        if (current == 0) {
            tweetButton.isEnabled = false
            return true;
        }
        tweetButton.isEnabled = true
        if (current < characterLimit) {
            charCountLabel.textColor = UIColor.lightGray
            return true
        } else {
            charCountLabel.textColor = UIColor.red
            if (current == characterLimit) {
                charCountLabel.text = "Character Count: 140"
            }
            return false
        }
    }
    func updateUserInformation() {
        if let user = user {
            if let propicURL = user.profilepic {
                profilePicImageView.af_setImage(withURL: propicURL)
            }
        }
    }
    func textViewDidBeginEditing(_ textView: UITextView) {

            textView.text = nil
            textView.textColor = UIColor.black
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if (textView.text.count == 0) {
            textView.text = "What's happening?"
            textView.textColor = UIColor.lightGray
            tweetButton.isEnabled = false
        }
    }
    
}

protocol ComposeViewControllerDelegate: class {
    func did(post: Tweet)
}
