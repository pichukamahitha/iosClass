//
//  languageSelectionCell.swift
//  Lematinalproject
//
//  Created by Mahitha on 22/01/24.
//

import UIKit

class languageSelectionCell: UITableViewCell {
    static let identifier = "languageSelectionCell"
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var languageSelectionButton: UIButton!
    @IBOutlet weak var languageSelectionShowLabel: UILabel!
    @IBOutlet weak var languageSelectionImage: UIImageView!
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
