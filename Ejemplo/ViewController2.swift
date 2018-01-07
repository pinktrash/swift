//
//  ViewController2.swift
//  Ejemplo
//
//  Created by Matias Gualino on 22/12/17.
//  Copyright © 2017 Brubank. All rights reserved.
//

import Foundation
// 1.
import UIKit

// 2.
class ViewController2 : UIViewController {
    
    var name: String!
    var lastName: String!
    var age: String!
    
    convenience init(name: String, lastName: String, age: String) {
        self.init(nibName: nil, bundle: nil)
        self.name = name
        self.lastName = lastName
        self.age = age
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    // 3.
    override func viewDidLoad() {
        // 4.
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        // 5. Creo los controles
        let resultLabel = UILabel()
        let backButton = UIButton()
        
        // 6.
        [resultLabel, backButton].forEach({
            // hace lo que yo te digo
            $0.translatesAutoresizingMaskIntoConstraints = false
            // Agregate a la vista
            self.view.addSubview($0)
        })
        
        // 7. Constraints
        NSLayoutConstraint.activate([
            // centrado vertical
            resultLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            // centrado horizontal
            resultLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            // 25 de cada margen
            resultLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            resultLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
            
            // 50% del ancho
            backButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
            // centrado horizontal
            backButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            // 50 de alto
            backButton.heightAnchor.constraint(equalToConstant: 50),
            // 50 del bottom
            backButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50)
            ])
        
        resultLabel.numberOfLines = 0
        resultLabel.textColor = UIColor.black
        resultLabel.textAlignment = .center
        resultLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        resultLabel.text = "Hola \(self.name!) \(self.lastName!) \(self.age!)"
        
        backButton.backgroundColor = UIColor.orange
        backButton.setTitle("VOLVER", for: .normal)
        backButton.setTitleColor(UIColor.white, for: .normal)
        
        // Borde redondeado
        backButton.layer.cornerRadius = 25
        backButton.layer.masksToBounds = true
        
        backButton.addTarget(self, action: #selector(ViewController2.backButtonTapped), for: .touchUpInside)
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
}


