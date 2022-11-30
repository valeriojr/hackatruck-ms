//
//  CurrencyList.swift
//  Criptonita
//
//  Created by Student on 25/11/22.
//  Copyright © 2022 VelorioSoft. All rights reserved.
//

import UIKit

class CurrencyList: UITableViewController {

    var currencyData: [Currency] = []
    var filteredCurrencyData: [Currency] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.downloadJSON {
            self.filteredCurrencyData = self.currencyData
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.filteredCurrencyData.count
    }

    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://api.coincap.io/v2/assets")
       
        URLSession.shared.dataTask(with: url!) {
            data, response, error in
            
            if error == nil {
                do {
                    self.currencyData = try JSONDecoder().decode(CoinCapData.self, from: data!).data!
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                }
                catch {
                    print("Error fetching data")
                }
            }
        }.resume()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currency", for: indexPath)

        // Configure the cell...
        if let currencyCell = cell as? CurrencyCell {
            let currency = self.filteredCurrencyData[indexPath.row]
            
            currencyCell.rankLabel.text = "\(currency.rank!)˚"
            currencyCell.nameLabel.text = "\(currency.symbol!) \(currency.name!)"
            currencyCell.variationLabel.text = String(format: "%.2f%%", Float(currency.changePercent24Hr!)!)
            currencyCell.priceLabel.text = String(format: "%.2f$", Float(currency.priceUsd!)!)
            
            currencyCell.variationLabel.textColor = Float(currency.changePercent24Hr!)! > 0.0 ? UIColor.green : UIColor.red
            
            return currencyCell
            
        }

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "currencyInfo", let currencyInfo = segue.destination as? CurrencyInfo, let row = self.tableView.indexPathForSelectedRow?.row {
            
            currencyInfo.currency = self.filteredCurrencyData[row]
            
        }
    }
}
