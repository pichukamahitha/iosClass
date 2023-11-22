//
//  homeViewController.swift
//  Lematinalproject
//
//  Created by Mahitha on 06/11/23.
//

import UIKit

class homeViewController: UIViewController {
    var newsdata : Breakingnews?
    @IBOutlet weak var breakingnewsView: UIView!
    @IBOutlet weak var breakingnewsLabel: UILabel!
    @IBOutlet weak var newsView: UIView!
    
    @IBOutlet weak var newsLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }

}
