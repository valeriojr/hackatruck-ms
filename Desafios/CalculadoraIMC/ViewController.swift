//
//  ViewController.swift
//  CalculadoraIMC
//
//  Created by Student on 19/11/22.
//  Copyright © 2022 VelorioSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    
    @IBAction func calculateBMI(_ sender: Any) {
        let weight = Float(weightTextField.text ?? "") ?? 0.0
        let height = Float(heightTextField.text ?? "") ?? 0.0
        
        if weightTextField.text == "" || heightTextField.text == "" {
            resultLabel.text = "-"
            resultDescriptionLabel.text = " "
            weightTextField.text = ""
            heightTextField.text = ""
            
            let alert = UIAlertController(title: "Alerta", message: "Entrada invalida", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                    case .default:
                    print("default")
                    
                    case .cancel:
                    print("cancel")
                    
                    case .destructive:
                    print("destructive")
                    
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let bmi = weight / (height * height)
            
            let animation: CATransition = CATransition()
            animation.duration = 1.0
            animation.type = CATransitionType.fade
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            resultLabel.layer.add(animation, forKey: "changeTextTransition")
            
            resultLabel.text = String(format: "%.1f", bmi)
            
            if bmi <= 18.5 {
                resultDescriptionLabel.text = "Abaixo do peso"
            }
            else if 18.5 < bmi && bmi <= 24.9 {
                resultDescriptionLabel.text = "Peso ideal (parabens)"
            }
            else if 24.9 < bmi && bmi <= 29.9 {
                resultDescriptionLabel.text = "Levemente acima do peso"
            }
            else if 29.9 < bmi && bmi <= 34.9 {
                resultDescriptionLabel.text = "Obesidade grau I"
            }
            else if 34.9 < bmi && bmi <= 39.9 {
                resultDescriptionLabel.text = "Obesidade grau II (severa)"
            }
            else if 39.9 < bmi {
                resultDescriptionLabel.text = "Obesidade grau III (morbida)"
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

