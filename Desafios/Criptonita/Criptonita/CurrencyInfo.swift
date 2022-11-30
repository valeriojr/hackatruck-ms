//
//  CurrencyInfo.swift
//  Criptonita
//
//  Created by Student on 25/11/22.
//  Copyright © 2022 VelorioSoft. All rights reserved.
//

import UIKit

class CurrencyInfo: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var explorerLabel: UILabel!
    @IBOutlet weak var maxSupplyLabel: UILabel!
    @IBOutlet weak var variationLabel: UILabel!
    @IBOutlet weak var marketCapLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var supplyLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var currency: Currency?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let c = self.currency {
            self.setup(currency: c)
        }
    }
    
    func setup(currency: Currency) {
        nameLabel.text = currency.name
        explorerLabel.text = currency.explorer
        maxSupplyLabel.text = String(format: "$%.2f", Float(currency.maxSupply ?? "") ?? 0.0)
        variationLabel.text = String(format: "%.2f%%", 100 * Float(currency.changePercent24Hr!)!)
        marketCapLabel.text = String(format: "$%.2f", Float(currency.marketCapUsd!)!)
        volumeLabel.text = String(format: "$%.2f", Float(currency.volumeUsd24Hr!)!)
        supplyLabel.text = String(format: "$%.2f", Float(currency.supply!)!)
        priceLabel.text = String(format: "$%.2f", Float(currency.priceUsd!)!)
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
