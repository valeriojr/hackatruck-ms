//
//  SourceViewController.swift
//  AulaStoryboardUFALManha
//
//  Created by Student on 22/11/22.
//  Copyright © 2022 VelorioSoft. All rights reserved.
//

import UIKit

class SourceViewController: UIViewController {

    @IBOutlet weak var colorTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "newColor" {
            
            if let view = segue.destination as? TargetViewController {
                view.newColor = colorTextField.text
            }
            
        }
    
    }

}
