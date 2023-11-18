//
//  aboutusViewController.swift
//  Lematinalproject
//
//  Created by Mahitha on 21/10/23.
//

import UIKit

class aboutusViewController: UIViewController,UIWebViewDelegate {
    @IBOutlet weak var webviewloader: UIWebView!
    var aboutus : aboutdata?
    @IBOutlet weak var aboutusButton: UIButton!
    @IBOutlet weak var launchImage: UIImageView!

    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getaboutusData(url: "https://testusr.lematinal.media/wp-json/api/about-us?")
      
    }
    
    func getaboutusData(url :String){
        let urL = URL(string: url)!
        let request = URLRequest(url: urL)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let datatask = session.dataTask(with: request){ [self]userdata, userresponse, err in
            do {
                self.aboutus = try JSONDecoder().decode(aboutdata?.self,from: userdata!)
//                print(self.aboutus)
                print("mahi = \(self.aboutus?.results![0].contet!)")
                DispatchQueue.main.async {
//                    dataLabel.text = self.aboutus?.results![0].contet!
                    
                    webviewloader.loadHTMLString((self.aboutus?.results![0].contet!)!, baseURL: nil)
                }
                
            }
            catch{
            }
        }
        datatask.resume()
    }
    
    

}
