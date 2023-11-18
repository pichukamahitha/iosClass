//
//  CategoriesCollectionViewCell.swift
//  Lematinalproject
//
//  Created by Mahitha on 13/10/23.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var categoriesImages: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func selectBtn(_ sender: Any) {
        
    }
    
}
