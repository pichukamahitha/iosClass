//
//  CategoriesViewcontroller.swift
//  Lematinalproject
//
//  Created by Mahitha on 13/10/23.
//

import UIKit
import SDWebImage

class CategoriesViewcontroller: UIViewController {
    var getdata : categoriesmodel?
    private var selectionLimit = 0
    var selectiteamindex : [Int] = []
    @IBOutlet weak var categoriesView: UIView!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var categoriesSelectLabel: UILabel!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    var timeLineData:NSMutableArray = NSMutableArray ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesCollectionView.frame = .zero
        categoriesCollectionView.frame = view.bounds
        self.xibregister()
        self.categoriesDta(url: "\(globalclass.shared.baseurl)\(categorylist)")
        self.loadImage(urlstr: "https://testen.lematinal.media/wp-content/uploads/2021/11/Arts.png")
    }
    func xibregister(){
        self.categoriesCollectionView.delegate = self
        self.categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
    }
    func categoriesDta(url :String){
        let urL = URL(string: url)!
        let request = URLRequest(url: urL)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let datatask = session.dataTask(with: request){userdata, userresponse, err in
            do {
                self.getdata = try JSONDecoder().decode(categoriesmodel?.self,from: userdata!)
                DispatchQueue.main.async { [self] in
                    self.categoriesCollectionView.reloadData()
                }
            }
            catch{
            }
        }
        datatask.resume()
    }
    func loadImage(urlstr : String) -> Data{
        let url = URL(string: urlstr)!
            if let imgdata = try? Data(contentsOf: url){
                return imgdata
            }
        return Data()
    }
    
    
    @IBAction func mContinueBtnClick(_ sender: Any) {
        print("fdbfbvhfdvfdhv")
        
    }
}
extension UIView {
    func makeBorder(){
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1.0
        self.clipsToBounds = true
    }
}
extension CategoriesViewcontroller:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getdata?.results?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath)as! CategoriesCollectionViewCell
        let category = getdata?.results?[indexPath.row]
        cell.configureCell(category: category!, itemSelected: selectiteamindex.contains(category?.iD ?? 0) )
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((categoriesCollectionView.frame.size.width / 3) - 5),
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedId = getdata?.results?[indexPath.item].iD ?? 0
        if (selectiteamindex.count >= 5) {

            let alert = UIAlertController.init(title: "Alert", message: "you have selected 5 categories", preferredStyle: .alert)
            alert.addAction(.init(title: "ok", style: .default, handler: {action  in
            }))
            self.present(alert,animated: true,completion: nil)
            return
}
        if selectiteamindex.contains(selectedId){
            for i in 0 ... (selectiteamindex.count - 1){
                if selectiteamindex[i] == selectedId {
                    selectiteamindex.remove(at: i)
                    break
                }
            }
        } else {
            selectiteamindex.append(selectedId)
          
        }

        if selectiteamindex.count >= 5 {
            selectiteamindex.remove(at: 0)
//            selectiteamindex.append(selectedId)
//            print("selectid:\(selectedId)")
        }
        collectionView.reloadData()
    }
}
