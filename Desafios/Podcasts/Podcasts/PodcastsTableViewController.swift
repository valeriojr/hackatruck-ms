//
//  PodcastsTableViewController.swift
//  Podcasts
//
//  Created by Student on 21/11/22.
//  Copyright © 2022 VelorioSoft. All rights reserved.
//

import UIKit

class PodcastsTableViewController: UITableViewController,  UISearchBarDelegate {
    
    @IBOutlet weak var podcastSearchBar: UISearchBar!
    
    var podcasts: [Podcast] = [Podcast]()
    var filteredPodcasts: [Podcast] = [Podcast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.podcastSearchBar.delegate = self
        self.podcasts = PodcastsDAO.get()
        self.filteredPodcasts = PodcastsDAO.get()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.filteredPodcasts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "podcast", for: indexPath)

        // Configure the cell...
        if let podcastCell = cell as? PodcastTableViewCell {
            
            let podcast = self.filteredPodcasts[indexPath.row]
            podcastCell.nameLabel.text = podcast.name
            podcastCell.episodesLabel.text = "\(podcast.episodes) episódios"
            podcastCell.iconImage.image = UIImage(named: podcast.icon)
            
            return podcastCell
        
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

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.podcasts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // When there is no text, filteredData is the same as the original data
        // When user has entered text into the search box
        // Use the filter method to iterate over all items in the data array
        // For each item, return true if the item should be included and false if the
        // item should NOT be included
        filteredPodcasts = searchText.isEmpty ? self.podcasts : self.podcasts.filter { (item: Podcast) -> Bool in
            // If dataItem matches the searchText, return true to include it
            
            return item.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        
        tableView.reloadData()
    }
}
