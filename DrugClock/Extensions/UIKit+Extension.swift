//
//  UIKit+Extension.swift
//  DrugClock
//
//  Created by Nurikk T. on 14.06.2023.
//
import UIKit
extension UIColor {
    convenience init(hex: String) {
        var hexWithoutSymbol = hex
        if hexWithoutSymbol.hasPrefix("#") {
            hexWithoutSymbol = String(hexWithoutSymbol.dropFirst())
        }
        
        let scanner = Scanner(string: hexWithoutSymbol)
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexInt64(&hexNumber) {
            var red, green, blue: CGFloat
            red = CGFloat((hexNumber & 0xff0000) >> 16) / 255.0
            green = CGFloat((hexNumber & 0x00ff00) >> 8) / 255.0
            blue = CGFloat(hexNumber & 0x0000ff) / 255.0
            
            self.init(red: red, green: green, blue: blue, alpha: 1.0)
        } else {
            self.init(red: 0, green: 0, blue: 0, alpha: 1.0) // Return black color if the hex string is invalid
        }
    }
}
