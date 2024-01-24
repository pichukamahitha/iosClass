//
//  homeViewController.swift
//  Lematinalproject
//
//  Created by Mahitha on 06/11/23.
//

import UIKit
class homeViewController: UIViewController {
    let loadview: UIView = UIView()
    let activityView = UIActivityIndicatorView(style: .whiteLarge)
    @IBOutlet weak var articlestackview: UIStackView!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var catageriesView: UIView!
    @IBOutlet weak var catagorieMainview: UIView!
    @IBOutlet weak var catagoriesTitlelabel: UILabel!
    @IBOutlet weak var articlesCollectionview: UICollectionView!
    @IBOutlet weak var articlesView: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var notificationBtn: UIButton!
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var featuretableview: UITableView!
    @IBOutlet weak var trendingCollectionView: UICollectionView!
    @IBOutlet weak var trendviewheight: NSLayoutConstraint!
    @IBOutlet weak var trendingView: UIView!
    @IBOutlet weak var trendingLabel: UILabel!
    @IBOutlet weak var breakingnewsView: UIView!
    @IBOutlet weak var breakingnewsLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var featureBtn: UIButton!
    @IBOutlet weak var trendingBtn: UIButton!
    @IBOutlet weak var latestBtn: UIButton!
    @IBOutlet weak var categoryBtn: UIButton!
    @IBOutlet weak var newsView: UIView!
    @IBOutlet weak var newsLabel: UILabel!
    var newsdata : Breakingnews?
    var newsarticledata : feature?
    var trendingtagdata :trendingtagengmodel?
    var articelcategoriedata : categoriesmodel?
    var viewModel : homepageViewmodel?
   weak var breakingtimer :Timer?
    var newsresult : [breakingnewsResult] = []
    var i = 0
    var selectediteamindex :[Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.xibregister()
        trendviewheight.constant = 0
        featureBtn.tintColor = .white
        featureBtn.backgroundColor = .red
        self.hideCatageries()
        self.showActivityIndicatory()
        
         trendingView.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        setupViewModel()
       
    }
    func showActivityIndicatory() {
        loadview.frame = CGRect(x: 0, y: 290, width: 395, height: 500) // Set X and Y whatever you want
        loadview.backgroundColor = .white
        activityView.frame = CGRect(x: 150, y: 100, width: 100, height: 250)
        activityView.color = .black
        self.view.addSubview(loadview)
        loadview.addSubview(activityView)
//        activityView.center = self.loadview.center
        activityView.startAnimating()
    }
    func enableloadview(){
        activityView.startAnimating()
        loadview.isHidden = false
    }
    func hideloadview(){
        activityView.stopAnimating()
        loadview.isHidden = true
    }
    func setupViewModel(){
        viewModel = homepageViewmodel()
        viewModel?.viewcontroller = self
        viewModel?.breakingNews()
    }
    func xibregister(){
        featuretableview.delegate = self
        featuretableview.dataSource = self
        trendingCollectionView.delegate = self
        trendingCollectionView.dataSource = self
        articlesCollectionview.delegate = self
        articlesCollectionview.dataSource = self
        featuretableview.register(UINib(nibName: "featureTVC", bundle: nil), forCellReuseIdentifier: "featureTVC")
     trendingCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        articlesCollectionview.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
    }
    @IBAction func notificationAction(_ sender: UIButton) {
    }
    @IBAction func settingsAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Settingpage", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "settingsViewController") as! settingsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func lodingactivityindicator(){
        
    }
    @IBAction func featureAction(_ sender: UIButton) {
        self.enableloadview()
        self.hideCatageries()
        trendviewheight.constant = 0
        self.lodingactivityindicator()
        self.viewModel?.getfeaturedata()
        self.trendingView.isHidden = true
        featureBtn.tintColor = .white
        featureBtn.backgroundColor = .red
        trendingBtn.tintColor = .black
        trendingBtn.backgroundColor = .white
        latestBtn.tintColor = .black
        latestBtn.backgroundColor = .white
        categoryBtn.tintColor = .black
        categoryBtn.backgroundColor = .white
    
    }
    @IBAction func trendingAction(_ sender: UIButton) {
        self.enableloadview()
        self.hideCatageries()
        self.lodingactivityindicator()
        self.viewModel?.gettrendingdata()
        trendviewheight.constant = 150
        viewModel?.gettrendingtags()
        trendingView.isHidden = false
        trendingCollectionView.isHidden = false
        trendingBtn.tintColor = .white
        trendingBtn.backgroundColor = .red
        featureBtn.tintColor = .black
        featureBtn.backgroundColor = .white
        latestBtn.tintColor = .black
        latestBtn.backgroundColor = .white
        categoryBtn.tintColor = .black
        categoryBtn.backgroundColor = .white
        
        
    }
    @IBAction func latestAction(_ sender: UIButton) {
        self.enableloadview()
        self.hideCatageries()
        self.lodingactivityindicator()
        trendviewheight.constant = 0
        viewModel?.getlatestdata()
        trendingCollectionView.isHidden = true
        trendingView.isHidden = true
        latestBtn.tintColor = .white
        latestBtn.backgroundColor = .red
        featureBtn.tintColor = .black
        featureBtn.backgroundColor = .white
        trendingBtn.tintColor = .black
        trendingBtn.backgroundColor = .white
        categoryBtn.tintColor = .black
        categoryBtn.backgroundColor = .white
        
    }
    @IBAction func categoriesAction(_ sender: UIButton) {
        self.enableloadview()
        self.showCatageries()
        self.lodingactivityindicator()
        viewModel?.getcategoriesdata()
        trendviewheight.constant = 0
        trendingCollectionView.isHidden = true
        trendingView.isHidden = true
        categoryBtn.tintColor = .white
        categoryBtn.backgroundColor = .red
        featureBtn.tintColor = .black
        featureBtn.backgroundColor = .white
        trendingBtn.tintColor = .black
        trendingBtn.backgroundColor = .white
        latestBtn.tintColor = .black
        latestBtn.backgroundColor = .white
    }
    func showCatageries(){
        self.catageriesView.isHidden = false
        self.articlesView.isHidden = true
    }
    func hideCatageries(){
        self.catageriesView.isHidden = true
        self.articlesView.isHidden = false
    }
    
    func getImage(str : String) -> Data{
        let url = URL(string: str)!
         let data = try? Data(contentsOf: url)
             return data!
    }
    
    
}
extension homeViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsarticledata?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vcell = featuretableview.dequeueReusableCell(withIdentifier: "featureTVC") as! featureTVC
       let category = newsarticledata?.results![indexPath.row].primary_category as! String
        let date = newsarticledata?.results![indexPath.row].date as! String
        vcell.categoryLabel.text = category + " | " + date
        vcell.imfLabel.text = newsarticledata?.results![indexPath.row].title as!String
        vcell.authorLabel.text = newsarticledata?.results![indexPath.row].author_name as? String
        vcell.featureImg.image = UIImage(data: getImage(str: newsarticledata?.results![indexPath.row].image_url ?? ""))
        return vcell
    }
    
}
extension homeViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == trendingCollectionView {
            return  trendingtagdata?.results?.count ?? 0
        } else{
            return  articelcategoriedata?.results?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
       
        
        if collectionView == trendingCollectionView{
            let tcell = trendingCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)as! CollectionViewCell
            tcell.tagLabel.text = trendingtagdata?.results?[indexPath.item].tag as? String
            tcell.contentView.layer.cornerRadius = 5
            tcell.contentView.layer.borderWidth = 0.5
            tcell.backgroundColor = .white
            tcell.contentView.layer.masksToBounds = true
            return tcell
        }else {
            let cell = articlesCollectionview.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath)as! CategoriesCollectionViewCell
            cell.configureCell(category: (articelcategoriedata?.results?[indexPath.row])!, itemSelected: false)
            return cell
        }
 
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == articlesCollectionview{
            return CGSize(width: ((articlesCollectionview.frame.size.width / 3) - 5),
                          height:130)
        } else {
            return CGSize(width: ((trendingCollectionView.frame.size.width)/4), height: 40)
        }
    }
    func collectionView(collectionView: UICollectionView, layout
                        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                guard let id = articelcategoriedata?.results![indexPath.row].iD else {
        
                    return
                }
        articlesCollectionview.reloadData()
        let vc = storyboard?.instantiateViewController(identifier: "categoriesLoadvc")as! categoriesLoadvc
        self.navigationController?.pushViewController(vc, animated: true)
        
        selectediteamindex.append(id)
        vc.selectid = selectediteamindex

    }
}
extension homeViewController {
    func setupBreakingNews(news : [breakingnewsResult]) {
        newsresult = news
        newsLabel.text = newsresult[i].title
        breakingtimer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(timerreloaded), userInfo: nil, repeats: true)
    }
        @objc func timerreloaded(){
                if i > newsresult.count-1 {
                    i = 0
                }
                else  {
                    newsLabel.text = newsresult[i].title
                    i += 1
                }
           
        }
}
