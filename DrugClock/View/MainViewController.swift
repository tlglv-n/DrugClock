//
//  MainViewController.swift
//  DrugClock
//
//  Created by Nurikk T. on 15.06.2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var tableView: UITableView?
    
    let mainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialState()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchViewModel()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchViewModel()
    }
    
    private func initialState() {
        tableView?.register(DrugCell.self)
        tableView?.delegate = self
        tableView?.dataSource = self
        mainView?.backgroundColor = UIColor(hex: "#2F283B")
        tableView?.backgroundColor = UIColor(hex: "#2F283B")
        fetchViewModel()
    }
    
    private func fetchViewModel() {
        mainViewModel.fetchData {
            self.tableView?.reloadData()
        }
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
//        let alertController = UIAlertController(title: "Add Clocker", message: nil, preferredStyle: .alert)
//
//        let datePicker = UIDatePicker()
//        datePicker.datePickerMode = .dateAndTime
////        alertController.view.addSubview(datePicker)
//
//
//        alertController.addTextField() {(textField) in
//            textField.placeholder = "Title"
//        }
//
//        alertController.addAction(UIAlertAction(title: "OK", style: .default) { _ in
//            let titleTextField = alertController.textFields?[0]
//            let date = datePicker.date
//            if let title = titleTextField?.text {
//                self.mainViewModel.addData(name: title, time: date) {
//                    self.tableView?.reloadData()
//                }
//            } else {
//                print("Error alert")
//            }
//        })
//        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
//        present(alertController, animated: true)
        
        
        
    }
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel.drugs?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(DrugCell.self, for: indexPath)
        let drug = mainViewModel.drugs?[indexPath.row]
        
        cell.configure(with: drug!)
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { action, view, completionHandler in
            self.mainViewModel.removeData(atIndexPath: indexPath) {
                self.tableView?.reloadData()
            }
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
}
