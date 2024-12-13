//
//  ViewController.swift
//  Pokemon
//
//  Created by Wylan L Neely on 12/9/24.
//

import UIKit

class PokemonViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        if let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png")  {      NetworkController.downloadImage(from: url) { pokeImage in
//            if let pokeImage = pokeImage {
//                self.reloadIMage(pokeImage: pokeImage)
//            }
//        }
//        }
    }

    
    
    var pokemon: Pokemon? 
    
    //MARK: - Outlets
    
    @IBOutlet weak var pokemonTextField: UITextField!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonLabel: UILabel!
    
    func setPokemonOutlets(){
        if let pokemon = pokemon {
            if let pokeUrl = pokemon.imageURLs.first {
                NetworkController.downloadImage(from: pokeUrl) { pokemonImage in
                    self.reloadImage(pokeImage: pokemonImage)
                }
            }
            
            DispatchQueue.main.async{
                self.pokemonLabel.text = pokemon.name
            }
           
        }
    }
    
    func reloadImage(pokeImage:UIImage?){
        if let pokeImage = pokeImage {
            DispatchQueue.main.async {
                self.pokemonImageView.image = pokeImage
            }
        }
    }
    
    //MARK: - Actions
    
    @IBAction func fetchPokemonButtonTapped(_ sender: Any) {
        if let pokemonName = pokemonTextField.text {
            PokemonController.fetchPokemon(for: pokemonName) { pokemon in
                self.pokemon = pokemon
                self.setPokemonOutlets()
            }
        }
        
    }
    
    
    
       

    
}

