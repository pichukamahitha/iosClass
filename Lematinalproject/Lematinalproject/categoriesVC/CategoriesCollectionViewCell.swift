//
//  CategoriesCollectionViewswift
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
    
    func configureCell(category: cataResults, itemSelected: Bool){
        categoriesLabel.text = category.title
        let urlstring = category.image ?? ""
        categoriesImages.sd_setImage(with: URL(string: urlstring), placeholderImage: UIImage(named: "bi_apple"))
        if itemSelected {
        blurView.alpha = CGFloat(0.7)
        selectButton.isSelected = true
        selectButton.setImage(UIImage(named: "butttonclick"), for: .normal)
                }
        else {
        blurView.alpha = CGFloat(0)
        selectButton.isSelected = false
        selectButton.setImage(UIImage(named: "butttonunclick"), for: .normal)
                }
    }
}
