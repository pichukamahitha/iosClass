//
//  deleteAccountCell.swift
//  Lematinalproject
//
//  Created by Mahitha on 23/01/24.
//

import UIKit

class deleteAccountCell: UITableViewCell {
static let identifire = "deleteAccountCell"
    @IBOutlet weak var deleteAccountButton: UIButton!
    @IBOutlet weak var deleteAccountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func deleteAccountAction(_ sender: Any) {
    }
    static func nib()->UINib {
        return UINib(nibName: identifire, bundle: nil)
    }
}
