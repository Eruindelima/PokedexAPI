//
//  ViewController.swift
//  PokemonList
//
//  Created by Virtual Machine on 05/07/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var pokemonsList: [PokemonEntry] = []
    var spritesPokemons: PokemonSprites?
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        pokemons()
    }
    
    func pokemons(){
        ServicePokemons().getData { pokemons in
            self.pokemonsList = pokemons
            self.tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemonsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = pokemonsList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonCell
        cell.namePokemon.text = item.name
        cell.pokemonImage(url: item.url, service: ServicePokemons())
        
        return cell
    }
   
}
