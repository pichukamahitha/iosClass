//
//  EventTableViewCell.swift
//  EventList
//
//  Created by apple on 02/12/23.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var eventDescriptionLabel: UILabel!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func configureCell(date: String){
        let savedevent = DBManager.shared.getEventbyDate(date: date)
        if savedevent.count > 0{
            eventNameLabel.text = savedevent[0].name
            eventDescriptionLabel.text = savedevent[0].description
        } else {
            eventNameLabel.text = ""
            eventDescriptionLabel.text = ""
        }
        
        
    }
    
}
