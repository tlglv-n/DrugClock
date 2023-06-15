//
//  MainViewModel.swift
//  DrugClock
//
//  Created by Nurikk T. on 15.06.2023.
//

import UIKit
import CoreData

class MainViewModel {
    
    var drugs: [Drug]?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchData(tableViewHandler handler: @escaping () -> ()) {
        do {
            let request = Drug.fetchRequest() as NSFetchRequest<Drug>
            self.drugs = try context.fetch(request)
            
            DispatchQueue.main.async {
                handler()
            }
        } catch {
            fatalError("Error fetching data")
        }
    }
    
    func addData(name: String, time: Date, tableViewHandler handler: @escaping () -> ()) {
        let drug = Drug(context: context)
        drug.name = name
        drug.time = time
        
        saveData(tableViewHandler: handler)
    }
    
    func removeData(atIndexPath indexPath: IndexPath, tableViewHandler handler: @escaping () -> ()) {
        let drugToRemove = drugs![indexPath.row]
        self.context.delete(drugToRemove)
        
        saveData(tableViewHandler: handler)
    }
    
    func updateData(atIndexPath indexPath: IndexPath, name: String, time: Date, tableViewHandler handler: @escaping () -> ()) {
        let drugToUpdate = drugs![indexPath.row]
        let drug = Drug(context: context)
        
        drug.name = name
        drug.time = time
        
        saveData(tableViewHandler: handler)
    }
    
    func saveData(tableViewHandler handler: @escaping () -> ()) {
        do {
            try context.save()
        } catch {
            fatalError("Error saving data")
        }
        fetchData {
            handler()
        }
    }
}
