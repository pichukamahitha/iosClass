//
//  ViewController.swift
//  Lematinalproject
//
//  Created by Mahitha on 10/10/23.
//

import UIKit
import DialCountries
class ViewController: UIViewController {

    @IBOutlet weak var countryBtn: UIButton!
    @IBOutlet weak var countryTxtfiled: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }

    override func viewDidLayoutSubviews() {
     
     }
    override func viewWillLayoutSubviews() {

    }
    func createCountryPicker(){
        let picker = UIPickerView.self
        
    }

}

