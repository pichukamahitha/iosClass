import UIKit
import Foundation

class student{
    
    var name = "anvesh"
}


class vc1{
    let std1 = student()
    func getstudent(){
        std1.name = "mahitha"
    }
    
}
class vc2{
    let std1 = student()
    func getstudent(){
        print(std1.name)
    }
}

class vc3{
    
}
