//
//  ViewController.swift
//  Pokemon
//
//  Created by Wylan L Neely on 12/9/24.
//

import UIKit

class PokemonViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }

    var pokemon: Pokemon?
    var pokemonImages: [UIImage]?
    
    //MARK: - Collection View
    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    
    func setUpCollectionView(){
        pokemonCollectionView.delegate = self
        pokemonCollectionView.dataSource = self
        
        let nib = UINib(nibName: "PokemonViewCell", bundle: nil)
        self.pokemonCollectionView.register(nib, forCellWithReuseIdentifier: "PokemonViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonImages?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = pokemonCollectionView.dequeueReusableCell(withReuseIdentifier: "PokemonViewCell", for: indexPath) as? PokemonViewCell else {
            return UICollectionViewCell()
        }
        
        if let image = pokemonImages?[indexPath.item] {
            cell.setImageView(with: image)
        }
        
        return cell
    }
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var pokemonTextField: UITextField!
    @IBOutlet weak var pokemonLabel: UILabel!
    
    func setPokemonOutlets(){
        if let pokemon = pokemon?.imageURLs {
            var i = 0
            
                NetworkController.downloadImage(from: pokeUrl) { pokemonImage in
                    self.reloadImage(pokeImage: pokemonImage,index: <#T##Int#>)
                    
                }
                

        }
    }
    
    func reloadImage(pokeImage:UIImage?,index:Int){
        let indexpath = IndexPath(item: index, section: 0)
        if let pokeImage = pokeImage {
            DispatchQueue.main.async {
                pokemonCollectionView.reloadItems(at: [indexpath])
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

