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
    
    private func initialState() {
        tableView?.register(DrugCell.self)
        tableView?.delegate = self
        tableView?.dataSource = self
        
    }
    
    private func fetchViewModel() {
        mainViewModel.fetchData {
            self.tableView?.reloadData()
        }
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
    }
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(DrugCell.self, for: indexPath)
        let drug = mainViewModel.drugs![indexPath.row]
        
        cell.configure(with: drug)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel.drugs?.count ?? 0
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
