//
//  languageViewController.swift
//  Lematinalproject
//
//  Created by Mahitha on 12/10/23.
//

import UIKit

class languageViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var frenchImg: UIImageView!
    
    @IBOutlet weak var englishImg: UIImageView!
    @IBOutlet weak var frenchLabel: UILabel!
    @IBOutlet weak var frenchBtn: UIButton!
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var englishBtn: UIButton!
    @IBOutlet weak var continueBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    @IBAction func englishAction(_ sender: UIButton) {
        selectoption(senderoption: true)
        self.englishLabel.textColor = .red
        self.englishImg.image = UIImage(named: "englishimg")
        
        
    }
    @IBAction func frenchAction(_ sender: UIButton) {
        selectoption(senderoption: false)
        self.frenchLabel.textColor = .red
        self.frenchImg.image = UIImage(named: "frenchimg")
    }
    
    @IBAction func continueAction(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "CategoriesViewcontroller")as! CategoriesViewcontroller
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    func selectoption (senderoption :Bool){
        if senderoption  {
           
            self.englishBtn.isSelected = true
            self.frenchLabel.textColor = .black
            self.frenchImg.image = UIImage(named: "frenchimg2")
            self.frenchBtn.isSelected = false
          
        }else{
           
            self.englishBtn.isSelected = false
            self.englishLabel.textColor = .black
            self.englishImg.image = UIImage(named: "englishimg2")
            self.frenchBtn.isSelected = true
           
        }

    }
    
}
