//
//  Database.swift
//  EventList
//
//  Created by apple on 02/12/23.
//

import Foundation
import UIKit
import CoreData

class DBManager{
    
    var articleIds : [Int] = []
    static let shared = DBManager()
    private init(){}
    
    func save(event: savedEvent) -> Bool {
      guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
        return false
      }
      let managedContext =
        appDelegate.persistentContainer.viewContext
      let entity =
        NSEntityDescription.entity(forEntityName: "Event",
                                   in: managedContext)!
      let EventSave = NSManagedObject(entity: entity,
                                   insertInto: managedContext)
        EventSave.setValue(event.description, forKeyPath: "eventDescription")
        EventSave.setValue(event.date, forKeyPath: "date")
        EventSave.setValue(event.name, forKeyPath: "eventName")
        
      do {
        try managedContext.save()
          showToast(message: "Event Saved", font: .systemFont(ofSize: 14))
          return true
          
      } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
          return false
      }
    }
    
    
    func getEventbyDate(date : String) -> [savedEvent]{
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
              return []
          }
        let managedContext =
          appDelegate.persistentContainer.viewContext
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Event")
        fetchRequest.predicate = NSPredicate(format: "date == %@", date)

        
        
        
        
          do {
            let events = try managedContext.fetch(fetchRequest)
            return self.returnSavedEvents(events: events)
//
          } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
          }
    }
    func returnSavedEvents(events : [NSManagedObject]) -> [savedEvent]{
        var returnedEvents : [savedEvent] = []
        for event in events {
            let localevent = savedEvent()
            localevent.description = event.value(forKey: "eventDescription") as? String ?? ""
            localevent.date = event.value(forKey: "date") as? String ?? ""
            localevent.name = event.value(forKey: "eventName") as? String ?? ""
            returnedEvents.append(localevent)
        }
        return returnedEvents
    }
    
    
    
    func showToast(message : String, font: UIFont = .systemFont(ofSize: 14)) {
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            // topController should now be your topmost view controller
            
            let toastLabel = UILabel(frame: CGRect(x: topController.view.frame.size.width/2 - 75, y: topController.view.frame.size.height-150, width: 150, height: 35))
            toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.9)
            toastLabel.textColor = UIColor.white
            toastLabel.font = font
            toastLabel.textAlignment = .center;
            toastLabel.text = message
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10;
            toastLabel.clipsToBounds  =  true
            topController.view.addSubview(toastLabel)
            UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.4
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
        }
    }
    
}
