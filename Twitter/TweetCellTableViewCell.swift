//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Melchizedek Tetteh on 9/30/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var TweetContent: UILabel!
    @IBOutlet weak var UserNameLabel: UILabel!
    @IBOutlet weak var ProfileImageView: UIImageView!
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    var favorited: Bool = false
    var tweetId: Int = -1
    
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let tobeFavorited = !favorited
        
        if(tobeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(true)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unFavoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(false)
            }, failure: { (error) in
                print("Unfavorite did not succeed: \(error)")
            })
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Error is retweeting: \(error)")
        })
    }
    
    func setRetweeted(_ isRetweeted: Bool){
        if(isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        } else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    

    func setFavorited(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited){
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
