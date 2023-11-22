//
//  homepageViewmodel.swift
//  Lematinalproject
//
//  Created by Mahitha on 19/11/23.
//

import UIKit

class homepageViewmodel: UIViewController {
    weak var newviewcontroller : homeViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func breakingnews(url: String){
        let urL = URL(string: url)!
        let request = URLRequest(url: urL)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let datatask = session.dataTask(with: request){userdata, userresponse, err in
            do {
                let  = try JSONDecoder().decode(categoriesData?.self,from: userdata!)
                DispatchQueue.main.async { [self] in
                }
            }
            catch{
            }
        }
        datatask.resume()
    }
}
