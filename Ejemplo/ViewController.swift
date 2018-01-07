//
//  ViewController.swift
//  Ejemplo
//
//  Created by Matias Gualino on 21/12/17.
//  Copyright © 2017 Brubank. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.red
        
        let text1 = UITextField()
        let text2 = UITextField()
        let text3 = UITextField()
        let text4 = UITextField()
        
        let textL = UITextField()
        let textR = UITextField()
        
        let welcome = UILabel()
        
        
        [textL, textR].forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
            
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 1.0
        })
        
        [text1, text2, text3, text4, welcome].forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
            
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 1.0
            
            NSLayoutConstraint.activate([
                $0.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
                $0.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
                $0.heightAnchor.constraint(equalToConstant: 40),
            ])
        })
        
        NSLayoutConstraint.activate([
            text1.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
            text2.bottomAnchor.constraint(equalTo: text1.topAnchor, constant: -30),
            text3.bottomAnchor.constraint(equalTo: text2.topAnchor, constant: -30),
            text4.bottomAnchor.constraint(equalTo: text3.topAnchor, constant: -30),
            welcome.bottomAnchor.constraint(equalTo: text4.topAnchor, constant: -30),
            
            
            textL.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            textR.topAnchor.constraint(equalTo: textL.topAnchor),
            textL.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            textR.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5, constant: -40),
            textL.widthAnchor.constraint(equalTo: textR.widthAnchor),
            textR.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            ])
     
        welcome.textColor = UIColor.white
        welcome.text = "Hola Aye"
        welcome.textAlignment = .center
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

