//
//  profileDetailsTableViewCell.swift
//  Lematinalproject
//
//  Created by Mahitha on 18/01/24.
//

import UIKit

class profileDetailsTableViewCell: UITableViewCell {
   static let identifier = "profileDetailsTableViewCell"
    @IBOutlet weak var profileDetailsView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileDetailsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    static func nib()->UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
