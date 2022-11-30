//
//  Podcast.swift
//  Podcasts
//
//  Created by Student on 21/11/22.
//  Copyright © 2022 VelorioSoft. All rights reserved.
//

import Foundation

class Podcast {
    
    var name: String
    var episodes: Int
    var icon: String
    
    init(name: String, episodes: Int, icon: String) {
        self.name = name
        self.episodes = episodes
        self.icon = icon
    }
    
}

class PodcastsDAO {
    
    static func get() -> [Podcast] {
        return [
            Podcast(name: "A Deriva", episodes: 622, icon: "a_deriva"),
            Podcast(name: "Academia CBN com Mário Sérgio Cortella", episodes: 70, icon: "academia_CBN"),
            Podcast(name: "Histórias em Inglês com Duolingo", episodes: 127, icon: "duolingo"),
            Podcast(name: "Flow Podcast", episodes: 545, icon: "flow_podcast"),
            Podcast(name: "Foro de Teresina", episodes: 309, icon: "foro_teresina"),
            Podcast(name: "NerdCast", episodes: 1038, icon: "nerdcast"),
            Podcast(name: "PodPah", episodes: 365, icon: "podpah"),
            Podcast(name: "Xadrez Verbal", episodes: 220, icon: "xadrez_verbal"),
        ]
    }
    
}
