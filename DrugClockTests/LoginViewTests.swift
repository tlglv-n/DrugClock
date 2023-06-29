//
//  LoginViewTests.swift
//  DrugClockTests
//
//  Created by Nurikk T. on 28.06.2023.
//

import XCTest
@testable import DrugClock

class LoginViewTests: XCTestCase {

    var loginViewController: LoginViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        
        _ = loginViewController.view
    }

    override func tearDown() {
        super.tearDown()
        loginViewController = nil
    }

    func testContinueButtonPressed() {
        // given
        let windowMock = UIWindow()
        let sceneDelegateMock = SceneDelegate()
        sceneDelegateMock.window = windowMock
        UIApplication.shared.connectedScenes.first?.delegate = sceneDelegateMock
        
        // when
        loginViewController.continueButtonPressed(self)
        
        // then
        XCTAssertTrue(windowMock.rootViewController is MainViewController, "Expected MainViewController for rootViewController")
    }
    
    func testViewDidLoad() {
        // when
        loginViewController.viewDidLoad()
        
        // then
        let expectedColor = UIColor(hex: "#2F283B")
        XCTAssertEqual(loginViewController.loginView?.backgroundColor, expectedColor, "Expected color is not \(expectedColor)")
    }

}
