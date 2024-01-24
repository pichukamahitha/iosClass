//
//  settingsViewController.swift
//  Lematinalproject
//
//  Created by Mahitha on 20/10/23.
//

import UIKit
protocol toastMessage {
    
}
class settingsViewController: UIViewController {
    @IBOutlet weak var settingTableview: UITableView!
//    var accountSettingData = ["Change Language","Notificationd","Darkmode","Mytopics"]
    var otherSettingData = ["About us","Terms and Conditions","Privacy&Policy","Editional Policy","Contact Us","Rate the app","Share app"]
    
    override func viewDidLoad ()
    {
        super.viewDidLoad()
        loadTableViewCell()
    }
    func loadTableViewCell(){
        settingTableview.delegate = self
        settingTableview.dataSource = self
        settingTableview.register(profileDetailsTableViewCell.nib(), forCellReuseIdentifier: profileDetailsTableViewCell.identifier)
        settingTableview.register(accountsSettingTableViewCell.nib(), forCellReuseIdentifier: accountsSettingTableViewCell.identifier)
        settingTableview.register(otherSettingsTableViewCell.nib(), forCellReuseIdentifier: otherSettingsTableViewCell.identifier)
        settingTableview.register(deleteAccountCell.nib(), forCellReuseIdentifier: deleteAccountCell.identifire)
        settingTableview.register(logoutCell.nib(), forCellReuseIdentifier: logoutCell.identifier)
    }
}
extension settingsViewController: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0 :
            return "Profile Details"
        case 1 :
            return "Account Settings"
        case 2 :
            return "Other Settings"
        case 3 :
            return "    "
        case 4 :
            return "      "
        default:
            break
        }
        return ""
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0 :
            return 100
        case 1:
            return 200
        case 2 :
            return 50
        case 3 :
            return 70
        case 4 :
            return 100
        default:
            break
        }
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0 :
            return 1
        case 1:
            return 1
        case 2 :
            return otherSettingData.count
        case 3 :
            return 1
        case 4 :
            return 1
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.section{
        case 0 :
            let cell0 = settingTableview.dequeueReusableCell(withIdentifier: profileDetailsTableViewCell.identifier, for: indexPath)as! profileDetailsTableViewCell
            cell = cell0
            
        case 1:
            let cell1 = settingTableview.dequeueReusableCell(withIdentifier: accountsSettingTableViewCell.identifier, for: indexPath)as! accountsSettingTableViewCell
            cell = cell1
            
        case 2 :
            let cell2 = settingTableview.dequeueReusableCell(withIdentifier: otherSettingsTableViewCell.identifier, for: indexPath)as! otherSettingsTableViewCell
            cell2.otherSettingLabel.text = otherSettingData[indexPath.row]
            cell = cell2
        case 3 :
            let cell3 = settingTableview.dequeueReusableCell(withIdentifier: deleteAccountCell.identifire, for: indexPath)as! deleteAccountCell
            cell = cell3
        case 4 :
            let cell4 = settingTableview.dequeueReusableCell(withIdentifier: logoutCell.identifier , for: indexPath) as! logoutCell
            cell = cell4
        default:
            break
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.item{
        case 0 :
            return
        case 1 :
            return
        case 2 :
            return
        case 3 :
            return
        case 4 :
            return
        case 5 :
            return
        case 6 :
            return
            
        default:
            break
        }
    }
}


























