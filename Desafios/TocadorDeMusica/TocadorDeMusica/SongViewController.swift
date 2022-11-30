//
//  SongViewController.swift
//  TocadorDeMusica
//
//  Created by Student on 22/11/22.
//  Copyright © 2022 VelorioSoft. All rights reserved.
//

import UIKit

class SongViewController: UIViewController {

    var song: Song?
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var albumArtistNameLabel: UILabel!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var songDurationLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if self.song != nil {
            
            if let s = song {
                
                self.title = s.album.artist
                coverImage.image = UIImage(named: s.album.cover)
                albumArtistNameLabel.text = "\(s.album.artist) · \(s.album.name)"
                songNameLabel.text = s.name
                songDurationLabel.text = "\(s.duration / 60):\(s.duration % 60)"
            
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
