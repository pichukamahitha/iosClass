//
//  searchTableViewCell.swift
//  Lematinalproject
//
//  Created by Mahitha on 02/12/23.
//

import UIKit

class searchTableViewCell: UITableViewCell {

    @IBOutlet weak var searchImg: UIImageView!
    @IBOutlet weak var searchdetailsview: UIView!
    @IBOutlet weak var NewsCategory: UILabel!
    @IBOutlet weak var IMF: UILabel!
    @IBOutlet weak var authorname: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
