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
    var viewModel : homepageViewmodel?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    func setupViewModel(){
        viewModel = homepageViewmodel()
        viewModel?.viewcontroller = self
        viewModel?.breakingnews()
        
    }
func setupBreakingNews(news : [breakingnewsResult]) {
    if !(news.isEmpty){
        newsLabel.text = news[0].title
    }
}
}
