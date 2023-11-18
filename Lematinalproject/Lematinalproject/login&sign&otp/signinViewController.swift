//
//  loginViewController.swift
//  Lematinalproject
//
//  Created by Mahitha on 12/10/23.
//

import UIKit

class signinViewController: UIViewController {
    @IBOutlet weak var mainVie: UIView!
    
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var signupView: UIView!
    
    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var loginUserBtn: UIButton!
    @IBOutlet weak var signupBtn: UILabel!
    
    @IBOutlet weak var featuresBtn: UILabel!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var appleIdButton: UIButton!
    @IBOutlet weak var mobileButton: UIButton!
    @IBOutlet weak var userButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.applyBorders()
    }
    
    
    func applyBorders(){
        googleButton.applyBorder()
        appleIdButton.applyBorder()
        mobileButton.applyBorder()
        userButton.applyBorder()
    }
    @IBAction func loginAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "loginViewController")as! loginViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func googleAction(_ sender: Any) {
        
    }
    @IBAction func appleIdAction(_ sender: Any) {
    }
    @IBAction func mobileAction(_ sender: Any) {
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "signinVC")as! signinVC
        self.navigationController?.pushViewController(vc2, animated: true)
        
    }
    @IBAction func guestuserAction(_ sender: Any) {
    }
    

    }

extension UIView{
    
    func applyBorder() {
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
//@IBDesignable
//class CustomButton: UIButton {
//    @IBInspectable var cornerRadiusValue: CGFloat = 10.0 {
//        didSet {
//            setUpView()
//        }
//    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        setUpView()
//    }
//    override func prepareForInterfaceBuilder() {
//        super.prepareForInterfaceBuilder()
//        setUpView()
//    }
//    func setUpView() {
//        self.layer.cornerRadius = self.cornerRadiusValue
//        self.clipsToBounds = true
//    }
//}
//
    
