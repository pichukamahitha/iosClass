//
//  homepageViewmodel.swift
//  Lematinalproject
//
//  Created by Mahitha on 19/11/23.
//

import UIKit

class homepageViewmodel {
    weak var viewcontroller : homeViewController?
    func breakingnews(){
        let urL = URL(string: "\(globalclass.shared.baseurl)\(breakingNews)")!
        let request = URLRequest(url: urL)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let datatask = session.dataTask(with: request){userdata, userresponse, err in
            do {
                let value = try? JSONDecoder().decode(Breakingnews?.self,from: userdata!)
                DispatchQueue.main.async { [self] in
                    viewcontroller?.setupBreakingNews(news: value?.results ?? [])
                    
                }
            }
            catch{
            }
        }
        datatask.resume()
    }
}
