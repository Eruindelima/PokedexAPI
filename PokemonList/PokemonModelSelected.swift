//
//  PokemonModelSelected.swift
//  PokemonList
//
//  Created by Virtual Machine on 06/07/22.
//

import Foundation
import UIKit



struct PokemonSelected: Codable {
    var sprites: PokemonSprites
}


struct PokemonSprites: Codable {
    var front_default: String
}
