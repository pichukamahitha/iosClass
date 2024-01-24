//
//  selectCategoriecell.swift
//  Lematinalproject
//
//  Created by Mahitha on 06/12/23.
//

import UIKit

class selectCategoriecell: UICollectionViewCell {

    @IBOutlet weak var itemData: UILabel!
    @IBOutlet weak var iteamImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func selectedcell(Category:cataResults ,iteamSelected : Bool){
//        if (categorydata?.results![indexPath.row].iD == selectid[0]){
//            cell.categoriesImages.backgroundColor = .red
//            cell.layer.cornerRadius = 5.0
//            cell.categoriesLabel.textColor = .red
//            cell.layer.borderWidth = 0.5
//            cell.layer.masksToBounds = true
    //            selectcategoriesCollectionView.reloadData()
        itemData.text = Category.title
        let urlstring = Category.image ?? ""
        iteamImg.sd_setImage(with: URL(string: urlstring), placeholderImage: UIImage(named: "bi_apple"))
        if Category.isSelected == iteamSelected{
            itemData.textColor = .black
            iteamImg.backgroundColor = .black
        }
        else{
            itemData.textColor = .red
            iteamImg.makeBorder()
//            iteamImg.layer.borderColor = CGColor
            
        }
        }
    
    }
    
   

