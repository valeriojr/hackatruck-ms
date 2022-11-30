//
//  Song.swift
//  TocadorDeMusica
//
//  Created by Student on 22/11/22.
//  Copyright © 2022 VelorioSoft. All rights reserved.
//

import Foundation


class Album {
    var name: String
    var artist: String
    var cover: String
    
    init(name: String, artist: String, cover: String) {
        self.name = name
        self.artist = artist
        self.cover = cover
    }
}


class Song {
    
    var name: String
    var album: Album
    var duration: Int
    
    init(name: String, album: Album, duration: Int) {
        self.name = name
        self.album = album
        self.duration = duration
    }
}


class SongDAO {
    static func getList() -> [Song] {
        
        let theSinglesBoxSet = Album(name: "The Singles Box Set", artist: "Eminem", cover: "the-singles-box-set")
        let nadaComoUmDiaAposOOutroDia = Album(name: "Nada como um dia após o outro dia", artist: "Racionais MC", cover: "nada-como-um-dia")
        let acoustic = Album(name: "The Singles Box Set", artist: "Coldplay", cover: "unknown")
        let justice = Album(name: "Justice", artist: "Justin Bieber", cover: "justice")
        let aRushOfBloodToTheHead = Album(name: "", artist: "Coldplay", cover: "a-rush-of-blood-to-the-head")
        
        return [
            Song(name: "Bussiness", album: theSinglesBoxSet, duration: 252),
            Song(name: "Bump Heads", album: theSinglesBoxSet, duration: 279),
            Song(name: "Sing For The Moment", album: theSinglesBoxSet, duration: 340),
            Song(name: "Rabbit Run", album: theSinglesBoxSet, duration: 191),
            Song(name: "Lose Yourself", album: theSinglesBoxSet, duration: 321),
            Song(name: "Sou mais você", album: nadaComoUmDiaAposOOutroDia, duration: 109),
            Song(name: "Vivão e Vivendo", album: nadaComoUmDiaAposOOutroDia, duration: 118),
            Song(name: "Vida Loka", album: nadaComoUmDiaAposOOutroDia, duration: 352),
            Song(name: "Negro Drama", album: nadaComoUmDiaAposOOutroDia, duration: 414),
            Song(name: "A Vítima", album: nadaComoUmDiaAposOOutroDia, duration: 441),
            Song(name: "Sparks", album: acoustic, duration: 228),
            Song(name: "Careful Where You Stand", album: acoustic, duration: 286),
            Song(name: "Yellow (Acoustic version from Jo Whiley's Lunchtime Social)", album: acoustic, duration: 273),
            Song(name: "See You Soon", album: acoustic, duration: 212),
            Song(name: "Yellow (Video)", album: acoustic, duration: 273),
            Song(name: "2 Much", album: justice, duration: 193),
            Song(name: "Deserve You", album: justice, duration: 0),
            Song(name: "As I Am (feat. Khalid)", album: justice, duration: 0),
            Song(name: "Off My Face", album: justice, duration: 0),
            Song(name: "HOLY (feat. Chance The Rapper)", album: justice, duration: 0),
            Song(name: "Politik", album: aRushOfBloodToTheHead, duration: 0),
            Song(name: "In My Place", album: aRushOfBloodToTheHead, duration: 0),
            Song(name: "God Put A Smile Upon Your Face", album: aRushOfBloodToTheHead, duration: 0),
            Song(name: "The Scientist", album: aRushOfBloodToTheHead, duration: 0),
            Song(name: "Clocks", album: aRushOfBloodToTheHead, duration: 0),
        ]
        
    }
}
