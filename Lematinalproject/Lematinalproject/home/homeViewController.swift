//
//  homeViewController.swift
//  Lematinalproject
//
//  Created by Mahitha on 06/11/23.
//

import UIKit
class homeViewController: UIViewController {
    
    @IBOutlet weak var homeactivity: UIActivityIndicatorView!
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
    var viewModel : homepageViewmodel?
   weak var breakingtimer :Timer?
    var newsresult : [breakingnewsResult] = []
    var i = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        homeactivity.startAnimating()
        self.xibregister()
        trendviewheight.constant = 0
    }
    override func viewWillAppear(_ animated: Bool) {
       
        setupViewModel()
        trendingView.isHidden = true
    }
    func setupViewModel(){
        viewModel = homepageViewmodel()
        viewModel?.viewcontroller = self
        viewModel?.breakingnews()
        viewModel?.gettrendingtags()

    }
func setupBreakingNews(news : [breakingnewsResult]) {
    newsresult = news
    newsLabel.text = newsresult[0].title
    breakingtimer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(timerreloaded), userInfo: nil, repeats: true)
}
    @objc func timerreloaded(){
            if i < newsresult.count-1 {
                self.i += 1
            }
            else  {
                self.i = 0
            }
        newsLabel.text = newsresult[i].title
    }
    func xibregister(){
        featuretableview.delegate = self
        featuretableview.dataSource = self
        trendingCollectionView.delegate = self
        trendingCollectionView.dataSource = self
        featuretableview.register(UINib(nibName: "featureTVC", bundle: nil), forCellReuseIdentifier: "featureTVC")
        trendingCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    }
    @IBAction func featureAction(_ sender: UIButton) {
        trendviewheight.constant = 0
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
extension homeViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  trendingtagdata?.results?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tcell = trendingCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)as! CollectionViewCell
        tcell.tagLabel.text = trendingtagdata?.results?[indexPath.item].tag as? String
        tcell.contentView.layer.cornerRadius = 5
        tcell.contentView.layer.borderWidth = 0.5
        tcell.backgroundColor = .white
        tcell.contentView.layer.masksToBounds = true
        return tcell
    }
    
    
}
