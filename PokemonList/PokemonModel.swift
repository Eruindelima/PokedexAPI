//
//  PokemonModel.swift
//  PokemonList
//
//  Created by Virtual Machine on 06/07/22.
//

import Foundation
import UIKit


struct Pokemon : Codable {
    var results: [PokemonEntry]
}


struct PokemonEntry : Codable {
    var name: String
    var url: String
}


