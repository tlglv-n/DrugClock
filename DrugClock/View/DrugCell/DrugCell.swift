//
//  DrugCell.swift
//  DrugClock
//
//  Created by Nurikk T. on 15.06.2023.
//

import UIKit

class DrugCell: UITableViewCell {

    @IBOutlet weak var drugCellView: UIView!
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var timeLabel: UILabel?
    
    func configure(with drug: Drug) {
        titleLabel?.text = drug.name
        timeLabel?.text = formatTime(drug.time!)
        
        titleLabel?.textColor = UIColor.white
        timeLabel?.textColor = UIColor.white
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        drugCellView.backgroundColor = UIColor(hex: "#2F283B")
    }
    
    private func formatTime(_ date: Date) -> String {
        let calendar = Calendar.current
            let now = Date()

            var formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
        
            if calendar.isDateInToday(date) {
                return "Today, " + formatter.string(from: date)
            } else if calendar.isDateInYesterday(date) {
                return "Yesterday, " + formatter.string(from: date)
            } else if calendar.isDateInTomorrow(date) {
                return "Tomorrow, " + formatter.string(from: date)
            } else if calendar.isDate(date, equalTo: now, toGranularity: .weekOfYear) {
                let weekday = calendar.component(.weekday, from: date)
                formatter.dateFormat = "EEEE, HH:mm"
                return formatter.string(from: date)
            } else {
                formatter.dateFormat = "EEEE, HH:mm"
                return formatter.string(from: date)
            }
    }
    
    
}
