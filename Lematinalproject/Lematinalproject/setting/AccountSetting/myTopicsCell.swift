//
//  myTopicsCell.swift
//  Lematinalproject
//
//  Created by Mahitha on 22/01/24.
//

import UIKit

class myTopicsCell: UITableViewCell {
    static let identifier = "myTopicsCell"
    @IBOutlet weak var myTopicsCellButton: UIButton!
    @IBOutlet weak var myTopicsCellLabel: UILabel!
    @IBOutlet weak var myTopicsCellImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static func nib()->UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
}
