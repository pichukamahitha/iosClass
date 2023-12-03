//
//  featureTVC.swift
//  Lematinalproject
//
//  Created by Mahitha on 26/11/23.
//

import UIKit

class featureTVC: UITableViewCell {

    @IBOutlet weak var featureImg: UIImageView!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var imfLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
