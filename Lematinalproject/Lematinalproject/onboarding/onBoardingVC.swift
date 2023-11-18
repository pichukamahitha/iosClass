//
//  onboardingVC.swift
//  Lematinalproject
//
//  Created by Mahitha on 10/10/23.
//

import UIKit

class onboardingVC: UIViewController {
    var currentpage = 0
    var myMutableString = NSMutableAttributedString()
    var boardingimages = ["onboardingimage1","onboardingimage2","onboardingimage3"]
    var boargingdata = ["Get Your Daily Dose of Latest News From Mauritius And All Around The World.","Don't Just Read. Listen To News On The Go!","Browse Through Our Vast List of Categories And Sub-Categories."]
    @IBOutlet weak var pagecontrol: UIPageControl!
    @IBOutlet weak var onboardingcollectionvc: UICollectionView!
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.xibregister()
    }
    func xibregister(){
        onboardingcollectionvc.delegate = self
        onboardingcollectionvc.dataSource = self
        onboardingcollectionvc.register(UINib(nibName: "onboardingViewCell", bundle: nil), forCellWithReuseIdentifier: "onboardingViewCell")
    }
    
    @IBAction func skipAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "signinViewController")as! signinViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func nextAction(_ sender: Any) {
        if currentpage == boardingimages.count-1 {
            let vc1 = storyboard?.instantiateViewController(withIdentifier: "signinViewController")as! signinViewController
            self.navigationController?.pushViewController(vc1, animated: true)
        }else{
            currentpage += 1
            pagecontrol.currentPage = currentpage
            let indexpath = IndexPath(item: currentpage, section: 0)
            onboardingcollectionvc.isPagingEnabled = false
            onboardingcollectionvc.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
            onboardingcollectionvc.isPagingEnabled = true
        }
        
    }
    
    @IBAction func pageAction(_ sender: Any) {
    }
    
}
extension onboardingVC: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return boardingimages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboardingViewCell", for: indexPath)as! onboardingViewCell
        cell.onboardingImages.image = UIImage(named: boardingimages[indexPath.row])
        cell.onboardingData.text = boargingdata[indexPath.row]
        
//        myMutableString = NSMutableAttributedString(string: boargingdata as NSArray, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 15.0)!])
//        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(location: 20, length:4))
//        cell.onboardingData.attributedText = myMutableString
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pagecontrol.currentPage = indexPath.item
    }
    
}
