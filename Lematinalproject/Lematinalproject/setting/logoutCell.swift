//
//  logoutCell.swift
//  Lematinalproject
//
//  Created by Mahitha on 23/01/24.
//

import UIKit

class logoutCell: UITableViewCell {
static let identifier = "logoutCell"
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var appVersionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        delecteButtonBorder()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func logoutAction(_ sender: Any) {
    }
    static func nib()->UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    func delecteButtonBorder (){
        logoutButton.backgroundColor = .clear
        logoutButton.layer.cornerRadius = 5
        logoutButton.layer.borderWidth = 1
        logoutButton.layer.borderColor = UIColor.red.cgColor
    }
}
