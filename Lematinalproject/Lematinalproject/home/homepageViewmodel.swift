//
//  homepageViewmodel.swift
//  Lematinalproject
//
//  Created by Mahitha on 19/11/23.
//

import UIKit

class homepageViewmodel {
    weak var viewcontroller : homeViewController?
    func breakingNews(){
        let urL = URL(string: "\(globalclass.shared.baseurl)\(devbreaking)")!
        let request = URLRequest(url: urL)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let datatask = session.dataTask(with: request){userdata, userresponse, err in
            do {
                let value = try? JSONDecoder().decode(Breakingnews?.self,from: userdata!)
                DispatchQueue.main.async { [self] in
//                    viewcontroller?.setupBreakingNews(news: (value?.results)!)

                    viewcontroller?.setupBreakingNews(news: value?.results ?? [] )
                    getfeaturedata()
                }
            }
            catch{
            }
        }
        datatask.resume()
    }
    func getfeaturedata(){
        let urL = URL(string: "\(globalclass.shared.baseurl)\(featureddata)")!
        let request = URLRequest(url: urL)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let datatask = session.dataTask(with: request){userdata, userresponse, err in
            do{
                self.viewcontroller?.newsarticledata = try? JSONDecoder().decode(feature.self, from: userdata!)
                DispatchQueue.main.async {
                    self.viewcontroller?.hideloadview()
                    self.viewcontroller?.featuretableview.reloadData()
                    self.gettrendingtags()

                }
            }
            catch{
                
            }
        }
        datatask.resume()
    }
    func gettrendingtags(){
        let urL = URL(string: "\(globalclass.shared.basetageng)\(treandingtageng)")!
        let request = URLRequest(url: urL)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let datatask = session.dataTask(with: request){userdata, userresponse, err in
            do{
                self.viewcontroller?.trendingtagdata = try? JSONDecoder().decode(trendingtagengmodel.self, from: userdata!)
                DispatchQueue.main.async {
                    self.viewcontroller?.hideloadview()
                    self.viewcontroller?.trendingCollectionView.reloadData()
//                    print(self.viewcontroller?.trendingtagdata?.results?[0].tag)
                    self.gettrendingdata()
                }
            }
            catch{
                
            }
        }
        datatask.resume()

    }
    func gettrendingdata(){
        let urL = URL(string: "\(globalclass.shared.baseurl)\(trendingdata)")!
        let request = URLRequest(url: urL)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let datatask = session.dataTask(with: request){userdata, userresponse, err in
            do{
                self.viewcontroller?.newsarticledata = try? JSONDecoder().decode(feature.self, from: userdata!)
                DispatchQueue.main.async {
                    self.viewcontroller?.hideloadview()
                    self.viewcontroller?.featuretableview.reloadData()
                    self.getlatestdata()
                }
            }
            catch{
            }
        }
        datatask.resume()
    }
    func getlatestdata(){
        let urL = URL(string: "\(globalclass.shared.baseurl4)\(latestData)")!
        let request = URLRequest(url: urL)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let datatask = session.dataTask(with: request){userdata, userresponse, err in
            do{
                self.viewcontroller?.newsarticledata = try? JSONDecoder().decode(feature.self, from: userdata!)
                DispatchQueue.main.async {
                    self.viewcontroller?.hideloadview()
                    self.viewcontroller?.featuretableview.reloadData()
                    self.getcategoriesdata()
                }
            }
            catch{
            }
        }
        datatask.resume()

    }
    func getcategoriesdata(){
        let urL = URL(string: "\(globalclass.shared.baseurl)\(categorylist)")!
        let request = URLRequest(url: urL)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let datatask = session.dataTask(with: request){userdata, userresponse, err in
            do{
                self.viewcontroller?.articelcategoriedata = try? JSONDecoder().decode(categoriesmodel?.self, from: userdata!)
                DispatchQueue.main.async {
                    self.viewcontroller?.hideloadview()
                    self.viewcontroller?.articlesCollectionview.reloadData()
//                    print(self.viewcontroller?.articelcategoriedata)
                }
            }
            catch{
            }
        }
        datatask.resume()
    }
}
