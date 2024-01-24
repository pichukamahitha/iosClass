//
//  loaddataViewmodel.swift
//  Lematinalproject
//
//  Created by Mahitha on 07/12/23.
//

import Foundation
class loaddataVcmodel {
    var viewcontroller : categoriesLoadvc?
    func getloaddata(){
        let urL = URL(string: "\(globalclass.shared.baseurl)\(categorylist)")!
        let request = URLRequest(url: urL)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let datatask = session.dataTask(with: request){userdata, userresponse, err in
            do{
                self.viewcontroller?.categorydata = try? JSONDecoder().decode(categoriesmodel?.self, from: userdata!)
                DispatchQueue.main.async {
                    self.viewcontroller?.selectcategoriesCollectionView.reloadData()
//                    print(self.viewcontroller?.articelcategoriedata)
                }
            }
            catch{
            }
        }
        datatask.resume()

    }
    
    
    
}

    

