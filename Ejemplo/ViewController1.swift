//
//  ViewController1.swift
//  Ejemplo
//
//  Created by Matias Gualino on 22/12/17.
//  Copyright © 2017 Brubank. All rights reserved.
//

import Foundation
import UIKit

class ViewController1 : UIViewController {
    
    // 1. Declaro los controles
    var nameField : UITextField!
    var lastNameField : UITextField!
    var ageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        // 2. Los declaro internamente
        let welcomeLabel = UILabel()
        let nameField = UITextField()
        let lastNameField = UITextField()
        let ageField = UITextField()
        let continueButton = UIButton()
        
        // 3. Los agrego a la vista
        [welcomeLabel, nameField, lastNameField, ageField, continueButton].forEach({
            // hace lo que yo te digo
            $0.translatesAutoresizingMaskIntoConstraints = false
            // Agregate a la vista
            self.view.addSubview($0)
        })
        
        // 4. Seteo las Constraints
        NSLayoutConstraint.activate([
            
            welcomeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            // a 80 del top
            welcomeLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80),
            welcomeLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            welcomeLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            
            // nameField a 50 del welcome
            nameField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 50),
            // a 30 de los margenes
            nameField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            nameField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            // 44 de alto
            nameField.heightAnchor.constraint(equalToConstant: 44),
            
            // lastName es igual nada mas que a 20 del nameField
            lastNameField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
            // a 30 de los margenes
            lastNameField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            lastNameField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            // 44 de alto
            lastNameField.heightAnchor.constraint(equalToConstant: 44),
           
            // ageField igual pero a 20 de lastName
            ageField.topAnchor.constraint(equalTo: lastNameField.bottomAnchor, constant: 20),
            // a 30 de los margenes
            ageField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            ageField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            // 44 de alto
            ageField.heightAnchor.constraint(equalToConstant: 44),
            
            // 50 de alto
            continueButton.heightAnchor.constraint(equalToConstant: 50),
            // pegado a los bordes
            continueButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            // pegado abajo
            continueButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            ])
        
        // 5. Seteo los atributos de cada control
        
        welcomeLabel.text = "Bienvenido"
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = UIColor.black
        welcomeLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        nameField.placeholder = "Ingresa tu nombre"
        nameField.borderStyle = .line
        
        lastNameField.placeholder = "Ingresa tu apellido"
        lastNameField.borderStyle = .line
        
        ageField.placeholder = "Ingresa tu edad"
        ageField.borderStyle = .line
        
        continueButton.backgroundColor = UIColor.orange
        continueButton.setTitle("CONTINUAR", for: .normal)
        continueButton.setTitleColor(UIColor.white, for: .normal)
        continueButton.addTarget(self, action: #selector(ViewController1.continueButtonTapped), for: .touchUpInside)
        
        // 6. Los asigno a las variables de clase.
        // Me permite usarlos afuera del viewDidLoad, por ejemplo, en el click del boton.
        self.nameField = nameField
        self.lastNameField = lastNameField
        self.ageField = ageField
        
    }
    
    @objc func continueButtonTapped() {
        // Verifico los valores de las cajas de texto
        if self.nameField.text != "" && self.lastNameField.text != "" && self.ageField.text != "" {
            // Si no son vacios, llamo al otro controller
            self.navigationController?.pushViewController(ViewController2(name: self.nameField.text!, lastName: self.lastNameField.text!,age: self.ageField.text!), animated: true)
        } else {
            // Si son vacios, muestro una alerta
            let alertController = UIAlertController(title: "Ups!", message: "Faltan completar algunos datos.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: .cancel, handler: { _ in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
}
