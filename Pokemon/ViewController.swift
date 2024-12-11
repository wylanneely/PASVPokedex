//
//  ViewController.swift
//  Pokemon
//
//  Created by Wylan L Neely on 12/9/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    
    @IBOutlet weak var pokemonTextField: UITextField!
    
    @IBOutlet weak var pokemonLabel: UILabel!
    
    @IBAction func fetchPokemonButtonTapped(_ sender: Any) {
        if let pokemonName = pokemonTextField.text {
            
            
            PokemonController.fetchPokemon(for: pokemonName) { pokemon in
                if let pokemon = pokemon {
                    DispatchQueue.main.async{
                        self.pokemonLabel.text = pokemon.name
                    }
                   
                }
            }
        }
        
    }
    
    
    
       

    
}

