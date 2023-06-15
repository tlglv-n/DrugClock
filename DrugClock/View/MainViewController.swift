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
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    private func initialState() {
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
    }
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}

extension MainViewController: UITableViewDelegate {
    
}
