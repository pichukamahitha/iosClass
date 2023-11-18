//
//  ViewController.swift
//  iosClass
//
//  Created by anvesh on 03/10/23.
//

import UIKit
protocol referenceDelegate: AnyObject {
    func sendData()
}

class signinVC: UIViewController,UITableViewDelegate {

    var name = "fdfdsf"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func addNumbers(){
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    @IBAction func pushAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LabelVC") as! LabelVC
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension signinVC: referenceDelegate{
    
    func sendData() {
        print("method called")
    }
}

