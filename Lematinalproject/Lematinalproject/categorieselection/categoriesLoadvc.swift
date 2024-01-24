//
//  categoriesLoadvc.swift
//  Lematinalproject
//
//  Created by Mahitha on 05/12/23.
//

import UIKit

class categoriesLoadvc: UIViewController {
    var selectid : [Int] = []
    var selectiteamview : homeViewController?
    @IBOutlet var mainview: UIView!
    @IBOutlet weak var designView: UIView!
    @IBOutlet weak var categoriescollectionview: UIView!
    @IBOutlet weak var selectLabel: UILabel!
    @IBOutlet weak var selectcategoriesCollectionView: UICollectionView!
    @IBOutlet weak var collectionviewHieght: NSLayoutConstraint!
    @IBOutlet weak var categoriesTableview: UITableView!
    @IBOutlet weak var listButton: UIButton!
    var categorydata : categoriesmodel?
    var vmodel : loaddataVcmodel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cellregistration()
        self.showmodel()
//        self.getid()
        self.navigationItem.setHidesBackButton(true, animated: true)
        collectionviewHieght.constant = 200

    }
    func cellregistration(){
        selectcategoriesCollectionView.frame = .zero
        selectcategoriesCollectionView.frame = view.bounds
        categoriesTableview.dataSource = self
        categoriesTableview.delegate = self
        selectcategoriesCollectionView.delegate = self
        selectcategoriesCollectionView.dataSource = self
        categoriesTableview.register(UINib(nibName: "categorieTableViewCell", bundle: nil), forCellReuseIdentifier: "categorieTableViewCell")
        selectcategoriesCollectionView.register(UINib(nibName: "selectCategoriecell", bundle: nil), forCellWithReuseIdentifier: "selectCategoriecell")
    }
    func showmodel(){
        vmodel = loaddataVcmodel()
        vmodel?.viewcontroller = self
        vmodel?.getloaddata()
    }
//    func getid(){
//        selectiteamview = homeViewController()
//
//    }
    @IBAction func listBtnAction(_ sender: UIButton) {
        if collectionviewHieght.constant == 200 {
            animate(toogle: true)
            listButton.setImage(UIImage(named: "uparrow"), for: .normal)
        }
        else{
            animate(toogle: false)
            listButton.setImage(UIImage(named: "downarrow"), for: .normal)
        }
    }
    func animate(toogle:Bool){
        if toogle{
            collectionviewHieght.constant = 400
            if let layout = selectcategoriesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .vertical
            }
        }else{
            collectionviewHieght.constant = 200
            if let layout = selectcategoriesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .horizontal
            }
        }
    }
}
extension UIView {
    func cellmakeBorder(){
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1.0
        self.clipsToBounds = true
    }
}

extension categoriesLoadvc : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoriesTableview.dequeueReusableCell(withIdentifier: "categorieTableViewCell")as!  categorieTableViewCell
        return cell
    }
}


extension categoriesLoadvc : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categorydata?.results?.count ?? 0
       
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = selectcategoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "selectCategoriecell", for: indexPath) as!selectCategoriecell
        let categories = categorydata?.results?[indexPath.row]
        cell.selectedcell(Category: categories!, iteamSelected: selectid.contains(categories?.iD ?? 0))
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell2 = selectcategoriesCollectionView.cellForItem(at: indexPath)as! selectCategoriecell
        cell2.iteamImg.backgroundColor = .green
        cell2.itemData.textColor = .green
        cell2.layer.masksToBounds = true
        selectcategoriesCollectionView.reloadData()
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((selectcategoriesCollectionView.frame.size.width / 3) - 5),
                      height:130)
    }
    func collectionView(collectionView: UICollectionView, layout
                        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}
