//
//  MainViewController.swift
//  DrugClock
//
//  Created by Nurikk T. on 15.06.2023.
//

import UIKit

class MainViewController: UIViewController, AlarmDetailViewControllerDelegate {

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var tableView: UITableView?
    
    private let mainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialState()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchViewModel()
    }
    func didAddNewAlarm() {
        mainViewModel.fetchData {
            self.tableView?.reloadData()
        }
    }
    
    private func initialState() {
        DispatchQueue.main.async {
            self.tableView?.register(DrugCell.self)
            self.tableView?.delegate = self
            self.tableView?.dataSource = self
            self.mainView?.backgroundColor = UIColor(hex: "#2F283B")
            self.tableView?.backgroundColor = UIColor(hex: "#2F283B")
            self.fetchViewModel()
        }
        
    }
    
    private func fetchViewModel() {
        mainViewModel.fetchData {
            self.tableView?.reloadData()
        }
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "AddAlarmSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddAlarmSegue" {
            if let alarmDetailVC = segue.destination as? AlarmDetailViewController {
                alarmDetailVC.delegate = self
            }
        }
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
