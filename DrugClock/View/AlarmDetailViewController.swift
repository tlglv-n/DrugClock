//
//  AlarmDetailViewController.swift
//  DrugClock
//
//  Created by Nurikk T. on 25.06.2023.
//

import UIKit

class AlarmDetailViewController: UIViewController {

    @IBOutlet var alarmDetailView: UIView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let mainViewModel = MainViewModel()
    let mainViewController = MainViewController()
    override func viewDidLoad() {
        super.viewDidLoad()

        alarmDetailView?.backgroundColor = UIColor(hex: "#2F283B")
    }
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let time = datePicker?.date
        
        mainViewModel.addData(name: titleTextField.text!, time: time!) {
            self.mainViewModel.fetchData {
                self.mainViewController.tableView?.reloadData()
            }
            self.dismiss(animated: true)
        }
    }
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
}
