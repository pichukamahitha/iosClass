//
//  signinVC.swift
//  Lematinalproject
//
//  Created by Mahitha on 17/10/23.
//

import UIKit
class signinVC: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var launchImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var signupView: UIView!
    @IBOutlet weak var signupLabel: UILabel!
    @IBOutlet weak var acessLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTxtfield: UITextField!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var mobileTextfield: UITextField!
    @IBOutlet weak var checkmarkButton: UIButton!
    @IBOutlet weak var agreeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTxtfield.delegate = self
        mobileTextfield.delegate = self
        self.hydeketboard()
        continueButton.isEnabled = false
    }
    @IBAction func continueAction(_ sender: Any) {
        if nameTxtfield.text!.count == 0 || mobileTextfield.text!.count == 0 {
            let alert = UIAlertController(
                title: "invalidlogin", message: "user name and mobile nunber is mandatory", preferredStyle: .alert)
            alert.addAction(.init(title: "ok", style: .default, handler: { action in
                
            }))
            self.present(alert, animated: true, completion: nil)
        }
            
            if nameTxtfield.text!.isEmpty || nameTxtfield.text!.count <= 2 {
                let alert = UIAlertController(
                    title: "invalid name", message: "please enter validname", preferredStyle: .alert)
                alert.addAction(.init(title: "ok", style: .default, handler: { action in
                }))
                self.present(alert, animated: true, completion: nil)
                
            }
            if mobileTextfield.text!.count == 0 || mobileTextfield.text!.count <= 9 {
                let alert = UIAlertController(
                    title: "invalid number", message: "please enter valid mobilenumber", preferredStyle: .alert)
                alert.addAction(.init(title: "ok", style: .default, handler: { action in
                    
                }))
                self.present(alert, animated: true, completion: nil)
        }
        if checkmarkButton.isSelected == false {
            let alert = UIAlertController(
                title: "checkmark Button", message: "please select checkmarkbutton", preferredStyle: .alert)
            alert.addAction(.init(title: "ok", style: .default, handler: { action in
                
            }))
            self.present(alert, animated: true, completion: nil)
        }
            let vc = storyboard?.instantiateViewController(identifier: "OTPViewController")as! OTPViewController
            self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func backAction(_ sender: UIButton) {
        let vc1 = storyboard?.instantiateViewController(identifier: "signinViewController")as! signinViewController
        vc1.navigationController?.popViewController(animated: true)
    }
    @IBAction func checkAction(_ sender: UIButton) {
        if sender.isSelected {
            checkmarkButton.setImage(UIImage(named: "checkButton"), for: .normal)
            sender.isSelected = false
        }
        else {
            checkmarkButton.setImage(UIImage(named: "checkmarkButton"), for: .selected)
            continueButton.isEnabled = true
            continueButton.backgroundColor = .black
            continueButton.titleLabel?.textColor = .white
            sender.isSelected = true
        }
    }
    @IBAction func agreeAction(_ sender: UIButton) {
    }
    @IBAction func nameAction(_ sender: Any) {
    }
    @IBAction func numberAction(_ sender: Any) {
 }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTxtfield{
            mobileTextfield.becomeFirstResponder()
        }
        if textField == mobileTextfield{
            nameTxtfield.resignFirstResponder()
        }
        return true
    }
    
}
extension signinVC {
    func hydeketboard(){
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector (signinVC.dismisskeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismisskeyboard(){
        view.endEditing(true)
    }
}

