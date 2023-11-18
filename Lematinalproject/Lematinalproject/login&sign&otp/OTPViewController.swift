//
//  OTPViewController.swift
//  Lematinalproject
//
//  Created by Mahitha on 17/10/23.
//

import UIKit

class OTPViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var launchImage: UIImageView!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var firstImage: UIImageView!
    
    @IBOutlet weak var secondImage: UIImageView!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var continueButton: UIButton!
    
    @IBOutlet weak var otpView: UIView!
    
    @IBOutlet weak var otpLabel: UILabel!
    
    @IBOutlet weak var mobileLabel: UILabel!
    
    @IBOutlet weak var secondotpLabel: UILabel!
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var resendotpLabel: UILabel!
    
    @IBOutlet weak var resendButton: UIButton!
    @IBOutlet weak var txt1: UITextField!
    
    @IBOutlet weak var txt2: UITextField!
    
    @IBOutlet weak var txt3: UITextField!
    
    @IBOutlet weak var txt4: UITextField!
    
    @IBOutlet weak var txt5: UITextField!
    
    @IBOutlet weak var txt6: UITextField!
    var count = 60
        var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        txt1.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        txt2.addTarget(self, action:#selector(textFieldDidChange), for: .editingChanged)
        txt3.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        txt4.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        txt5.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        txt6.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        txt1.becomeFirstResponder()
    }
    @IBAction func continueAction(_ sender: Any) {
    }
    
    @IBAction func backAction(_ sender: Any) {
        let vc1 = storyboard?.instantiateViewController(identifier: "loginVC")as!loginVC
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func resendAction(_ sender: Any) {
        timer.invalidate() // just in case this button is tapped multiple times
       // start the timer
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    @objc func timerAction() {
        count -= 1
//        if count < 0 {
//            self.resendotpLabel.text = "00:0\(count) secs"
////        self.resendButton.setTitle("00:0\(count) secs", for: .normal)
//        }
        if count == 0 {
            self.resendButton.isUserInteractionEnabled = true
            self.resendButton.tintColor = .red
            self.resendotpLabel.text = ""
            self.resendButton.setTitle("Resend OTP", for: .normal)
            timer.invalidate()
            count = 40
    }else {
        self.resendButton.tintColor = .black
        self.resendButton.setTitle("resend in", for: .normal)
       
        self.resendotpLabel.text = "00:0\(count) secs"
    }
        }
   
    
    @objc func textFieldDidChange(textField: UITextField) {
        let  text = textField.text
        if text?.count == 1{
            switch textField {
            case txt1 :
                txt2.becomeFirstResponder()
                break
            case txt2 :
                txt3.becomeFirstResponder()
                break
            case txt3 :
                txt4.becomeFirstResponder()
                break
            case txt4 :
                txt5.becomeFirstResponder()
                break
            case txt5 :
                txt6.becomeFirstResponder()
                break
            case txt6 :
                txt6.becomeFirstResponder()
                break
            default:
                break
            }
        }
        if text?.count == 0{
            switch textField{
            case txt1 :
                txt1.becomeFirstResponder()
                break
            case txt2 :
                txt1.becomeFirstResponder()
                break
            case txt3 :
                txt2.becomeFirstResponder()
                break
            case txt4 :
                txt3.becomeFirstResponder()
                break
            case txt5 :
                txt4.becomeFirstResponder()
                break
            case txt6 :
                txt5.becomeFirstResponder()
                break
                
            default:
                break
            }
            
        }
    }
}
