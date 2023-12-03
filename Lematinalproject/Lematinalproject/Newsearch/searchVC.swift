//
//  searchVC.swift
//  Lematinalproject
//
//  Created by Mahitha on 18/11/23.
//

import UIKit

class searchVC: UIViewController {
    var SearchData : searchdatamodel?
    var viewModel : searchpageViewmodel?
    var searchtrenddata : trendingtagengmodel?
    @IBOutlet weak var searchCollectionviewheight: NSLayoutConstraint!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchnewsLabel: UILabel!
    @IBOutlet weak var searchTextfield: UITextField!
    @IBOutlet weak var micButton: UIButton!
    @IBOutlet weak var searchTableview: UITableView!
    @IBOutlet weak var searchCollectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchxibregister()
        searchTableview.isHidden = true
       
    }
    override func viewWillAppear(_ animated: Bool) {
        self.setsearchmodel()
//        searchCollectionviewheight.constant = 0
    }
    
    func searchxibregister(){
        searchTableview.delegate = self
        searchTableview.dataSource = self
        searchCollectionview.dataSource = self
        searchCollectionview.delegate = self
        searchTableview.register(UINib(nibName: "searchTableViewCell", bundle: nil), forCellReuseIdentifier: "searchTableViewCell")
        searchCollectionview.register(UINib(nibName: "searchCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "searchCollectionViewCell")
    }
    
    func setsearchmodel(){
        viewModel = searchpageViewmodel()
        viewModel?.searchviewcontroller = self
        viewModel?.getsearchdata()
        viewModel?.getsearchcategoriesdata()
    }
    func getImage(str : String) -> Data{
        let url = URL(string: str)!
         let data = try? Data(contentsOf: url)
             return data!
    }
}
extension searchVC :UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SearchData?.results?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let scell = searchTableview.dequeueReusableCell(withIdentifier: "searchTableViewCell")as! searchTableViewCell
        scell.IMF.text = SearchData?.results![indexPath.row].title as! String
        scell.authorname.text = SearchData?.results![indexPath.row].author_name as! String
         let catageory = SearchData?.results![indexPath.row].primary_category as! String
        let date = SearchData?.results![indexPath.row].date as! String
            scell.NewsCategory.text = catageory + " | " + date
        
        scell.searchImg.image = UIImage(data: getImage(str: SearchData?.results![indexPath.row].image_url ?? ""))
        return scell
    }
}
extension searchVC : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchtrenddata?.results?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = searchCollectionview.dequeueReusableCell(withReuseIdentifier: "searchCollectionViewCell", for: indexPath) as! searchCollectionViewCell
        cell.searchCategoriesLabel.text = searchtrenddata?.results![indexPath.row].tag as! String
        cell.contentView.layer.cornerRadius = 5
        cell.contentView.layer.borderWidth = 0.5
        cell.backgroundColor = .white
        cell.contentView.layer.masksToBounds = true
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//    }
}
