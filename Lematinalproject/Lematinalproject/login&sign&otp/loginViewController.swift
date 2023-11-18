//
//  loginViewController.swift
//  Lematinalproject
//
//  Created by Mahitha on 16/10/23.
//

import UIKit

class loginViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var launchImage: UIImageView!
    
    @IBOutlet weak var firstImage: UIImageView!
    
    @IBOutlet weak var secondImage: UIImageView!
    
    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var loginView: UIView!
  
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var signBtn: UIButton!
    
    @IBOutlet weak var acessLabel: UILabel!
    
    @IBOutlet weak var googleButton: UIButton!
    
    @IBOutlet weak var appleIdButton: UIButton!
    
    @IBOutlet weak var mobileButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.makeborders()
    }
    
    func makeborders(){
        googleButton.applyBorders()
        appleIdButton.applyBorders()
        mobileButton.applyBorders()
    }
    @IBAction func signinAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "signinViewController")as! signinViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func googleAction(_ sender: Any) {
    }
    
    @IBAction func appleidAction(_ sender: Any) {
    }
    @IBAction func mobileAction(_ sender: Any) {
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "loginVC")as! loginVC
        self.navigationController?.pushViewController(vc1, animated: true)
    }
}
extension UIView{
    func applyBorders(){
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 4.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 5
        self.backgroundColor = .clear
//        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }
}
