//
//  PokemonCell.swift
//  PokemonList
//
//  Created by Virtual Machine on 11/07/22.
//

import Foundation
import UIKit

class PokemonCell: UITableViewCell {
    
    @IBOutlet weak var imgPokemon: UIImageView!
    @IBOutlet weak var namePokemon: UILabel!
    
    func pokemonImage(url: String, service: ServicePokemons) {
        service.getImage(url: url, completion: { result in
            do {
                let url = URL(string: result.front_default)!
                let data = try! Data(contentsOf: url)
                self.imgPokemon.image = UIImage(data: data)
            }
        })
        
    }
}
