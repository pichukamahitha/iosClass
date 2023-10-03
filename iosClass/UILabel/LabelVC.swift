//
//  LabelVC.swift
//  iosClass
//
//  Created by anvesh on 03/10/23.
//

import UIKit

class LabelVC: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = "welcome Anvesh"
        welcomeLabel.textColor = UIColor.red
        welcomeLabel.textAlignment = .left
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
