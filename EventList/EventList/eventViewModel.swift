//
//  eventViewModel.swift
//  EventList
//
//  Created by apple on 02/12/23.
//

import Foundation
class eventViewModel {
    
    weak var viewCOntroller:EventListVC?
    
    func getdaysForMonth(year: Int,month:Int) -> [String]{
        let dateComponents = NSDateComponents()
        dateComponents.year = year
        dateComponents.month = month
        let calendar = NSCalendar.current
        let date = calendar.date(from: dateComponents as DateComponents)!
       return getDaysforMonth(for: date)
        
    }
    func getDaysforMonth(for month: Date) -> [String] {
        let cal = Calendar.current
        let monthRange = cal.range(of: .day, in: .month, for: month)!
        let comps = cal.dateComponents([.year, .month], from: month)
        var date = cal.date(from: comps)!
        var dates: [String] = []
        for _ in monthRange {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM YYYY"
            let currentDateString: String = dateFormatter.string(from: date)
            dates.append(currentDateString)
            date = cal.date(byAdding: .day, value: 1, to: date)!
            
        }
        print(dates)
        return dates
    }
    
    func getMonths(year : Int) -> [String]{
        let dateComponents = NSDateComponents()
        dateComponents.year = year
        let calendar = NSCalendar.current
        let date = calendar.date(from: dateComponents as DateComponents)!
        return self.getmonthsforYear(for: date)
        
    }
    
    func getmonthsforYear(for year: Date) -> [String] {
        let cal = Calendar.current
        let monthRange = cal.range(of: .month, in: .year, for: year)!
        let comps = cal.dateComponents([.year, .month], from: year)
        var date = cal.date(from: comps)!
        var months:[String] = []
        for _ in monthRange {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat =  "MMM"
            let currentDateString: String = dateFormatter.string(from: date)
            months.append(currentDateString)
            date = cal.date(byAdding: .month, value: 1, to: date)!
        }
        return months
    }
    

}

