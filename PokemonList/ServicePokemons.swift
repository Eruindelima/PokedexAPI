//
//  ServicePokemons.swift
//  PokemonList
//
//  Created by Virtual Machine on 05/07/22.
//
/*  */
import Foundation
import UIKit


class ServicePokemons {
    
    func getData(completion: @escaping ([PokemonEntry]) -> ()) {
        guard let url = URL(string:"https://pokeapi.co/api/v2/pokemon/?limit=100") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            let pokemonList = try! decoder.decode(Pokemon.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonList.results)
            }
        }.resume()
    }
    
    func getImage(url: String, completion: @escaping (PokemonSprites) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonSprite = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonSprite.sprites)
            }
        }.resume()
    }
}

