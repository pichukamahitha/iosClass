//
//  notificationCell.swift
//  Lematinalproject
//
//  Created by Mahitha on 22/01/24.
//

import UIKit

class notificationCell: UITableViewCell {
    static let identifier = "notificationCell"
    @IBOutlet weak var notificationSwitch: NSLayoutConstraint!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var notificationImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static func nib()->UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    @IBAction func notificationAction(_ sender: UISwitch) {
        self.showToast(message: "User Settings Updated", font: .systemFont(ofSize: 12.0))
    }
    
}
extension notificationCell {

func showToast(message : String, font: UIFont) {
    
    let window = SceneDelegate().window

    let toastLabel = UILabel(frame: CGRect(x: (self.window?.frame.size.width ?? 320)/2 - 70, y: (self.window?.frame.size.height ?? 320) - 150, width: 150, height: 50))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center
    toastLabel.text = message
    toastLabel.layer.cornerRadius = 5
    toastLabel.clipsToBounds  =  true
    self.window?.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }
