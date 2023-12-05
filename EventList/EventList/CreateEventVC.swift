//
//  CreateEventVC.swift
//  EventList
//
//  Created by apple on 02/12/23.
//

import UIKit

class CreateEventVC: UIViewController {
    
    @IBOutlet weak var eventNameTF: UITextField!
    @IBOutlet weak var eventDescriptionTF: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    var date: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationTopColor(color: customColors.navigationColor)
        dateLabel.text = date ?? ""
        eventNameTF.delegate = self
        eventDescriptionTF.delegate = self
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    private func checkValidation() -> Bool{
        guard eventNameTF.text?.count ?? 0 > 1 else { return false}
        guard eventDescriptionTF.text?.count ?? 0 > 1 else { return false }
        guard let date = date else { return false }
        return true
    }
    @IBAction func submitAction(_ sender: Any) {
        self.view.endEditing(true)
        guard checkValidation() else {
            DBManager.shared.showToast(message: "please provide Details")
            return
        }
        var event = savedEvent()
        event.name = eventNameTF.text
        event.description = eventDescriptionTF.text
        event.date = date
        if DBManager.shared.save(event: event){
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
extension CreateEventVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == eventNameTF{
            eventDescriptionTF.becomeFirstResponder()
        }
        if textField == eventDescriptionTF{
            eventDescriptionTF.resignFirstResponder()
        }
        return true

    }
}
