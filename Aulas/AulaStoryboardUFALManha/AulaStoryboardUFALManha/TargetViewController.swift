//
//  TargetViewController.swift
//  AulaStoryboardUFALManha
//
//  Created by Student on 22/11/22.
//  Copyright © 2022 VelorioSoft. All rights reserved.
//

import UIKit

class TargetViewController: UIViewController {
    
    var newColor: String?

    @IBOutlet weak var colorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.colorLabel.text = newColor
        
        if newColor != nil {
            
            if let color = newColor {
                
                self.view.backgroundColor = UIColor.red
            
            }
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
