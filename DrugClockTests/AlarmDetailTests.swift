//
//  AlarmDetailTests.swift
//  DrugClockTests
//
//  Created by Nurikk T. on 30.06.2023.
//

import XCTest
@testable import DrugClock

class AlarmDetailTests: XCTestCase {

    var alarmDetailViewController: AlarmDetailViewController!
        
        override func setUp() {
            super.setUp()
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            alarmDetailViewController = storyboard.instantiateViewController(withIdentifier: "AlarmDetailViewController") as? AlarmDetailViewController
            
            _ = alarmDetailViewController.view
        }
        
        override func tearDown() {
            alarmDetailViewController = nil
            super.tearDown()
        }
        
        func testInitialState() {
            XCTAssertEqual(alarmDetailViewController.alarmDetailView?.backgroundColor, UIColor(hex: "#2F283B"), "Unexpected alarm detail view background color")
            
            // Check if date picker text color is set correctly
            let datePickerTextColor = alarmDetailViewController.datePicker.value(forKey: "textColor") as? UIColor
            XCTAssertEqual(datePickerTextColor, UIColor.white, "Unexpected date picker text color")
        }
        
        func testSaveButtonPressed() {
            // Given
            alarmDetailViewController.titleTextField.text = "Test Alarm"
            let currentDate = Date()
            alarmDetailViewController.datePicker.setDate(currentDate, animated: false)
            
            // When
            alarmDetailViewController.saveButtonPressed(self)
            
            // Then
            XCTAssertNil(alarmDetailViewController.presentingViewController, "Presenting view controller should be nil after dismissal")
        }
        
        func testCancelButtonPressed() {
            // Given
            let mockViewController = UIViewController()
            alarmDetailViewController.present(mockViewController, animated: false)
            
            // When
            alarmDetailViewController.cancelButtonPressed(self)
            
            // Then
            XCTAssertNil(alarmDetailViewController.presentingViewController, "Presenting view controller should be nil after cancellation")
        }
        
        // Helper classes for testing
        
        

}
