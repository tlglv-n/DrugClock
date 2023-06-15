//
//  DrugCell.swift
//  DrugClock
//
//  Created by Nurikk T. on 15.06.2023.
//

import UIKit

class DrugCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var timeLabel: UILabel?
    
    func configure(with drug: Drug) {
        titleLabel?.text = drug.name
        timeLabel?.text = formatTime(drug.time!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
    }
    
    private func formatTime(_ date: Date) -> String {
        let calendar = Calendar.current
        let now = Date()
        
        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDateInYesterday(date) {
            return "Yesterday"
        } else if calendar.isDate(date, equalTo: now, toGranularity: .weekOfYear) {
            let weekday = calendar.component(.weekday, from: date)
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE"
            return formatter.string(from: date)
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, MMM d"
            return formatter.string(from: date)
        }
    }
    
    
}
