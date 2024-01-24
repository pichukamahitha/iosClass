//
//  otherSettingsTableViewCell.swift
//  Lematinalproject
//
//  Created by Mahitha on 18/01/24.
//

import UIKit

class otherSettingsTableViewCell: UITableViewCell {
static let identifier = "otherSettingsTableViewCell"
    @IBOutlet weak var navigateButton: UIButton!
    @IBOutlet weak var otherSettingLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    static func nib()->UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
}
