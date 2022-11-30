//
//  Animal.swift
//  AulaTableViewUFALManha
//
//  Created by Student on 21/11/22.
//  Copyright © 2022 VelorioSoft. All rights reserved.
//

import Foundation

class Animal {
    
    let name: String
    let species: String
    let image: String
    
    init(name: String, species: String, image: String) {
        self.name = name
        self.species = species
        self.image = image
    }
    
}


class AnimalsDAO {
    
    static func getAnimals() -> [Animal] {
        return [
            Animal(name: "Donatello", species: "Tartaruga", image: "tartaruga"),
            Animal(name: "Jack", species: "Canguru", image: "canguru"),
            Animal(name: "Nemo", species: "Peixe", image: "peixe"),
            Animal(name: "Pato Donald", species: "Pato", image: "pato"),
            Animal(name: "Pernalonga", species: "Coelho", image: "coelho"),
            Animal(name: "Snoop", species: "Cachorro", image: "cachorro"),
            Animal(name: "Ze carioca", species: "Papagaio", image: "papagaio"),
        ]
    }
    
}
