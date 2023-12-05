//
//  Extensions.swift
//  EventList
//
//  Created by apple on 02/12/23.
//

import Foundation
import UIKit

extension UIViewController {
    func navigationTopColor(color : String)
  {
     let colouredTopBlack = UIView()
     view.addSubview(colouredTopBlack)
     colouredTopBlack.translatesAutoresizingMaskIntoConstraints = false
      colouredTopBlack.backgroundColor = UIColor(named: color)

     NSLayoutConstraint.activate([
        colouredTopBlack.topAnchor.constraint(equalTo: view.topAnchor),
        colouredTopBlack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        colouredTopBlack.widthAnchor.constraint(equalTo: view.widthAnchor),
    ])
  }
}

@IBDesignable
extension UIView {
    
    @IBInspectable var cornerRadius : CGFloat {
        get{ return cornerRadius}
        set { self.layer.cornerRadius = newValue}
    }
}
