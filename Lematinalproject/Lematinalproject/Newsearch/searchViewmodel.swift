//
//  searchViewmodel.swift
//  Lematinalproject
//
//  Created by Mahitha on 02/12/23.
//

import Foundation
class searchpageViewmodel{
    weak var searchviewcontroller : searchVC?
    func getsearchdata(){
        let urL = URL(string: "\(globalclass.shared.baseurl)\(searchingData)")!
        let request = URLRequest(url: urL)
        let Session = URLSession(configuration: URLSessionConfiguration.default)

        let dataTask = Session.dataTask(with: request){userdata ,userresponse ,err in
            do{
                self.searchviewcontroller?.SearchData = try? JSONDecoder().decode(searchdatamodel.self, from: userdata!)
                DispatchQueue.main.async {
                    self.searchviewcontroller?.searchTableview.reloadData()
                }
                
            }
            
        }
        dataTask.resume()
    }
    func getsearchcategoriesdata(){
        let urL = URL(string: "\(globalclass.shared.basetageng)\(treandingtageng)")!
        let request = URLRequest(url: urL)
        let Session = URLSession(configuration: URLSessionConfiguration.default)

        let dataTask = Session.dataTask(with: request){userdata ,userresponse ,err in
            do{
                self.searchviewcontroller?.searchtrenddata = try! JSONDecoder().decode(trendingtagengmodel.self, from: userdata!)
                DispatchQueue.main.async {
                    self.searchviewcontroller?.searchCollectionview.reloadData()
                }
                
            }
            
        }
        dataTask.resume()
    }
}
