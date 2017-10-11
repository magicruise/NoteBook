//
//  BookShelfTableViewCell.swift
//  NoteBook
//
//  Created by LSMSE on 2017. 8. 16..
//  Copyright © 2017년 LSMSE. All rights reserved.
//

import UIKit

class BookShelfTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /*
     @IBOutlet weak var tweetProfileImageView: UIImageView!
     @IBOutlet weak var tweetCreatedLabel: UILabel!
     @IBOutlet weak var tweetUserLabel: UILabel!
     @IBOutlet weak var tweetTextLabel: UILabel!
     
     var tweet: Twitter.Tweet? { didSet { updateUI() } }
     
     // taking this Tweet that I was giving and loading outlets up
     private func updateUI() {
     tweetTextLabel?.text = tweet?.text
     tweetUserLabel?.text = tweet?.user.description
     
     if let profileImageURL = tweet?.user.profileImageURL {
     // FIXME: blocks main thread
     if let imageData = try? Data(contentsOf: profileImageURL) {
     tweetProfileImageView?.image = UIImage(data: imageData)
     }
     } else {
     tweetProfileImageView?.image = nil
     }
     
     if let created = tweet?.created {
     let formatter = DateFormatter()
     if Date().timeIntervalSince(created) > 24*60*60 {
     formatter.dateStyle = .short
     } else {
     formatter.timeStyle = .short
     }
     tweetCreatedLabel?.text = formatter.string(from: created)
     } else {
     tweetCreatedLabel?.text = nil
     }
     }
     */


}
