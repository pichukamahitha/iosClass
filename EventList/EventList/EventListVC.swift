//
//  ViewController.swift
//  EventList
//
//  Created by apple on 02/12/23.
//

import UIKit

class EventListVC: UIViewController {
    
    
    
    @IBOutlet weak var yearButton: UIButton!
    @IBOutlet weak var monthButton: UIButton!
    @IBOutlet weak var eventsTableView: UITableView!
    private var viewModel : eventViewModel?
    private var daysInMonth:[String] = []{
        didSet{
            eventsTableView.reloadData()
        }
    }
    private var years: [Int] = []
    private var monthsinNumber: [Int] = []
    private var monthsInNames: [String] = []
    private var selectedYear:Int?  {
        didSet{
            monthsInNames = viewModel?.getMonths(year: selectedYear ?? 2016) ?? []
            if let month = selectedMonthnumber{
                selectedMonthnumber = month
            }
        }
    }
    private var selectedMonthnumber:Int? {
        didSet{
            selectedMonthname = monthsInNames[(selectedMonthnumber ?? 1) - 1]
            daysInMonth = viewModel?.getdaysForMonth(year: selectedYear ?? 2016, month: selectedMonthnumber ?? 1) ?? []
        }
    }
    private var selectedMonthname:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
        self.setUpViews()
        self.setupData()
    }
    override func viewWillAppear(_ animated: Bool) {
        eventsTableView.reloadData()
    }
    private func setUpViews(){
        self.title = stringConstants.events
        self.navigationTopColor(color: customColors.navigationColor )
        self.eventsTableView.register(UINib(nibName: "EventTableViewCell", bundle: nil), forCellReuseIdentifier: "EventTableViewCell")
        self.eventsTableView.delegate = self
        self.eventsTableView.dataSource = self
    }
    private func setupViewModel(){
        self.viewModel = eventViewModel()
        self.viewModel?.viewCOntroller = self
    }
    private func setupData(){
        for year in 2016 ... 2025{
            years.append(year)
        }
        for num in 1 ... 12 {
            monthsinNumber.append(num)
        }
        
    }
    @IBAction func yearButtonAction(_ sender: UIButton) {
        self.showYears()
    }
    
    @IBAction func monthButtonAction(_ sender: UIButton) {
        if let selectedyear = selectedYear {
            self.showMonths()
        }
}
    private func showYears(){
        DispatchQueue.main.async {
        let controller = UIAlertController(title: "Select Year", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
            for year in self.years {
                let Action = UIAlertAction(title: "\(year)", style: UIAlertAction.Style.default) { action in
                self.selectedYear = Int(action.accessibilityIdentifier ?? "0") ?? 0
                self.yearButton.setTitle(action.title, for: .normal)
                }
            Action.accessibilityIdentifier = "\(year)"
            controller.addAction(Action)
        }
            self.present(controller, animated: true, completion: nil)
        }
    }
    private func showMonths(){
        DispatchQueue.main.async {
            let controller = UIAlertController(title: "Select Month", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
            for i in 0 ... self.monthsInNames.count - 1{
                let Action = UIAlertAction(title: self.monthsInNames[i], style: UIAlertAction.Style.default) { action in
                    let index = Int(action.accessibilityIdentifier ?? "0") ?? 0
                    self.selectedMonthnumber = self.monthsinNumber[index]
                    self.monthButton.setTitle(self.monthsInNames[index], for: .normal)
                }
                Action.accessibilityIdentifier = "\(i)"
                controller.addAction(Action)
            }
            
            self.present(controller, animated: true, completion: nil)
        }
    }
    }


extension EventListVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysInMonth.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as! EventTableViewCell
        cell.dateLabel.text = "\(indexPath.row + 1)"
        cell.monthLabel.text = selectedMonthname
        cell.configureCell(date: daysInMonth[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreateEventVC") as! CreateEventVC
        vc.date = daysInMonth[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

