//
//  ViewController.swift
//  AulaAutoLayoutUFALManha
//
//  Created by Student on 19/11/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBAction func sendDataButton(_ sender: Any) {
        nameLabel.text = nameTextField.text
        nameTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

