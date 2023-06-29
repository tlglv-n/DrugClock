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
    
    private let mainViewModel = MainViewModel()
    weak var delegate: AlarmDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialState()
        
    }
    
    private func initialState() {
        alarmDetailView?.backgroundColor = UIColor(hex: "#2F283B")
        datePicker.setValue(UIColor.white, forKey: "textColor")
        
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let time = datePicker?.date
        
        mainViewModel.addData(name: titleTextField.text!, time: time!) {
            self.delegate?.didAddNewAlarm()
            self.dismiss(animated: true)
        }
    }
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
}
