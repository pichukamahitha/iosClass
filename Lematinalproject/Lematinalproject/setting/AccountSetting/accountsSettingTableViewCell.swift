//
//  accountsSettingTableViewCell.swift
//  Lematinalproject
//
//  Created by Mahitha on 18/01/24.
//

import UIKit

class accountsSettingTableViewCell: UITableViewCell {
    var accountSettingData = ["Notificationd","Darkmode","Mytopics"]
    var accountSettingImages = ["nofificationimg","darkmodeimg"]
    static let identifier = "accountsSettingTableViewCell"
    @IBOutlet weak var accountSettingTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadAccountSettingTableView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    static func nib()->UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    func loadAccountSettingTableView(){
        accountSettingTableView.delegate = self
        accountSettingTableView.dataSource = self
        accountSettingTableView.register(languageSelectionCell.nib(), forCellReuseIdentifier: languageSelectionCell.identifier)
        accountSettingTableView.register(notificationCell.nib(), forCellReuseIdentifier: notificationCell.identifier)
        accountSettingTableView.register(myTopicsCell.nib(), forCellReuseIdentifier: myTopicsCell.identifier)
        
    }
}
extension accountsSettingTableViewCell : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0 :
            return 50
        case 1 :
            return 50
        case 2 :
            return 50
        default:
            break
        }
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
        switch section {
        case 0 :
            return 1
        case 1 :
            return 2
        case 2 :
            return 1
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.section {
        case 0 :
          let cell0 = accountSettingTableView.dequeueReusableCell(withIdentifier: languageSelectionCell.identifier, for: indexPath) as! languageSelectionCell
            cell0.languageLabel.text = "Change Language"
            cell0.languageSelectionImage.image = UIImage(named: "changelanguageimg")
            cell = cell0
        case 1 :
            let cell1 = accountSettingTableView.dequeueReusableCell(withIdentifier: notificationCell.identifier, for: indexPath) as! notificationCell
            cell1.notificationLabel.text = accountSettingData[indexPath.row]
            let img = accountSettingImages[indexPath.row]
            cell1.notificationImage.image = UIImage(named: img)
            cell = cell1
        case 2 :
            let cell2 = accountSettingTableView.dequeueReusableCell(withIdentifier: myTopicsCell.identifier, for: indexPath) as! myTopicsCell
            cell2.myTopicsCellLabel.text = accountSettingData[2]
            cell2.myTopicsCellImage.image = UIImage(named: "feedImage")
            cell = cell2
        default:
            break
        }
        return cell
    }
    
    
    
}
