//
//  loginVC.swift
//  Lematinalproject
//
//  Created by Mahitha on 16/10/23.
//

import UIKit
import DialCountries
class loginVC: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var launchImage: UIImageView!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var acessLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var mobileTextfield: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var agreeButton: UIButton!
    @IBOutlet weak var countryButton: UIButton!
    var countrycode = "+230"
    override func viewDidLoad() {
        mobileTextfield.delegate = self
        super.viewDidLoad()
        self.subView.layer.borderWidth = 2
        self.subView.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        continueButton.isEnabled = false
    }
    @IBAction func continueAction(_ sender: Any) {
        if mobileTextfield.text!.count == 0 || mobileTextfield.text!.count <= 9 {
            let alert = UIAlertController(
                title: "invalid number", message: "please enter valid mobilenumber", preferredStyle: .alert)
            alert.addAction(.init(title: "ok", style: .default, handler: { action in
                
            }))
            self.present(alert, animated: true, completion: nil)

        }
        if checkButton.isSelected == false {
            let alert = UIAlertController(
                title: "checkmark Button", message: "please select checkmarkbutton", preferredStyle: .alert)
            alert.addAction(.init(title: "ok", style: .default, handler: { action in
                
            }))
            self.present(alert, animated: true, completion: nil)
        }
        let vc = storyboard?.instantiateViewController(identifier: "OTPViewController")as! OTPViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backAction(_ sender: Any) {
        let vc1 = storyboard?.instantiateViewController(identifier: "loginViewController")as! loginViewController
        vc1.navigationController?.popViewController(animated: true)
    }
    @IBAction func checkBtnAction(_ sender: UIButton) {
        if sender.isSelected {
            checkButton.setImage(UIImage(named: "checkButton"), for: .normal)
            sender.isSelected = false
        }
        else {
            checkButton.setImage(UIImage(named: "checkmarkButton"), for: .selected)
            continueButton.isEnabled = true
            continueButton.backgroundColor = .black
            continueButton.titleLabel?.textColor = .white
            sender.isSelected = true
        }
    }
    @IBAction func agreeAction(_ sender: Any) {
    }
    @IBAction func countryAction(_ sender: Any) {
        let controller = DialCountriesController(locale: Locale(identifier: "en"))
        controller.delegate = self
        controller.show(vc: self)
    }
}
extension loginVC:DialCountriesControllerDelegate {
    
    func didSelected(with country: DialCountries.Country) {
        var string = ""
        for i in (country.dialCode?.count ?? 0)  ... 5 {
            string = string + " "
        }
        countrycode = country.dialCode ?? "+230"
        let countryCode = (country.flag ?? "") + (country.dialCode ?? "") + string
        countryButton.setTitle(countryCode, for: .normal)
     }
    
}
    
    


