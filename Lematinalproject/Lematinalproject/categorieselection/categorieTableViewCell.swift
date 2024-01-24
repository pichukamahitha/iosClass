//
//  categorieTableViewCell.swift
//  Lematinalproject
//
//  Created by Mahitha on 06/12/23.
//

import UIKit

class categorieTableViewCell: UITableViewCell {

    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var articleImg: UIImageView!
    
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var imfLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func saveAction(_ sender: Any) {
    }
    
}
