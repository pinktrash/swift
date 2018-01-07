//
//  MenuViewController.swift
//  Ejemplo
//
//  Created by Matias Gualino on 22/12/17.
//  Copyright © 2017 Brubank. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController : UIViewController {
    
    override func viewDidLoad() {
        
        let constraintsButton = UIButton()
        let loginButton = UIButton()
        
        [constraintsButton, loginButton].forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        })
        
        NSLayoutConstraint.activate([
            constraintsButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            constraintsButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: constraintsButton.bottomAnchor, constant: 40)
            ])
        
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(MenuViewController.loginTapped), for: .touchUpInside)
        
        constraintsButton.setTitle("Constraints", for: .normal)
        constraintsButton.addTarget(self, action: #selector(MenuViewController.constraintsTapped), for: .touchUpInside)
    }
    
    @objc func constraintsTapped() {
        self.navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    @objc func loginTapped() {
        self.navigationController?.pushViewController(ViewController1(), animated: true)
    }
}
