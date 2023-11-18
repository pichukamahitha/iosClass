//
//  LabelVC.swift
//  iosClass
//
//  Created by anvesh on 03/10/23.
//

import UIKit



class LabelVC: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
     var delegate : referenceDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = "welcome Anvesh"
        welcomeLabel.textColor = UIColor.red
        welcomeLabel.textAlignment = .left
    }
    override func viewDidAppear(_ animated: Bool) {
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate
        else {
            return
          }
           print(sceneDelegate.window?.rootViewController?.children)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        if let viewControllers = appDelegate.window?.rootViewController?.presentedViewController
        {
            print(viewControllers)// Array of all viewcontroller even after presented
        }
        else if let viewControllers = appDelegate.window?.rootViewController?.children
        {
            print(viewControllers)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        if (appDelegate.window?.rootViewController?.presentedViewController) != nil
        {
            print(appDelegate.window?.rootViewController?.presentedViewController)
        }
        else if (appDelegate.window?.rootViewController?.children) != nil
        {
            print(appDelegate.window?.rootViewController?.children)
        }
        delegate?.sendData()
    }
    
}
