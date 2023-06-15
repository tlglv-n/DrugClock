//
//  ViewController.swift
//  DrugClock
//
//  Created by Nurikk T. on 14.06.2023.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var loginView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView?.backgroundColor = UIColor(hex: "#2F283B")
    }

    @IBAction func continueButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            UIView.transition(with: sceneDelegate.window!, duration: 0.3,
                              options: .transitionCrossDissolve,
                              animations: {
                                sceneDelegate.window?.rootViewController = mainViewController
                              },
                              completion: nil)
        }
    }
    
}

