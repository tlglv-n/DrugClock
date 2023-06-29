//
//  AlarmDetailViewController.swift
//  DrugClock
//
//  Created by Nurikk T. on 25.06.2023.
//

import UIKit
import UserNotifications

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
            
            self.schedulePushNotification(at: time!)
        }
    }
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func schedulePushNotification(at date: Date) {
        let content = UNMutableNotificationContent()
        content.title = titleTextField.text ?? "Alarm"
        content.body = "Time to take your medication!"
        content.sound = UNNotificationSound.default
        
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        let request = UNNotificationRequest(identifier: "AlarmNotification", content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled successfully")
            }
        }
    }
}
