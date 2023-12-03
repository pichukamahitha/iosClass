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
        let urL = URL(string: "\(globalclass.shared.baseurl)\(devbreaking)")!
        let request = URLRequest(url: urL)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let datatask = session.dataTask(with: request){userdata, userresponse, err in
            do {
                let value = try? JSONDecoder().decode(Breakingnews?.self,from: userdata!)
                DispatchQueue.main.async { [self] in
//                    viewcontroller?.setupBreakingNews(news: (value?.results)!)
                        viewcontroller?.setupBreakingNews(news: value?.results ?? [])
                        print("printvalues\(String(describing: value?.results))")
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
//                    self.viewcontroller?.homeactivity.stopAnimating()
                    self.viewcontroller?.homeactivity.stopAnimating()
                    self.viewcontroller?.homeactivity.isHidden = true
                   

                    self.viewcontroller?.featuretableview.reloadData()
//                    print(self.viewcontroller?.featuredata)
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
                    self.viewcontroller?.trendingCollectionView.reloadData()
                    print(self.viewcontroller?.trendingtagdata?.results?[0].tag)
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
                    self.viewcontroller?.homeactivity.stopAnimating()
                    self.viewcontroller?.homeactivity.isHidden = true
                    self.viewcontroller?.featuretableview.reloadData()
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
                    self.viewcontroller?.homeactivity.stopAnimating()
                    self.viewcontroller?.homeactivity.isHidden = true
                    self.viewcontroller?.featuretableview.reloadData()
                }
            }
            catch{
            }
        }
        datatask.resume()

    }
}
