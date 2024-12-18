//
//  ViewController.swift
//  Pokemon
//
//  Created by Wylan L Neely on 12/9/24.
//

import UIKit

class PokemonViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    // Opening Flow: 1
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        
    }

    var pokemon: Pokemon?
    var pokemonImages: [UIImage] = []
    
    //MARK: - Collection View
    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    
    // Opening Flow: 2
    func setUpCollectionView(){
        //CollectionView require delegate and data source, as well as the protocols
        pokemonCollectionView.delegate = self
        pokemonCollectionView.dataSource = self
        
        //register nib for the .xib file we created
        let nib = UINib(nibName: "PokemonViewCell", bundle: nil)
        self.pokemonCollectionView.register(nib, forCellWithReuseIdentifier: "PokemonViewCell")
        
        setUpControlFlowLayout()
    }
    
    func setUpControlFlowLayout(){
        if let layout = pokemonCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
               let snappingLayout = CenterSnappingFlowLayout()
            snappingLayout.scrollDirection = .vertical // Ensure horizontal scrolling
               snappingLayout.itemSize = layout.itemSize
               snappingLayout.minimumLineSpacing = layout.minimumLineSpacing
            pokemonCollectionView.collectionViewLayout = snappingLayout
           }
           
        pokemonCollectionView.decelerationRate = .fast // Ensures snapping feels natural
       }
    
    // Opening Flow: 3 - return the number of cell items we have
    // Loading Pokemon Flow: 4
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonImages.count
    }
        
    // Loading Pokemon Flow: 5
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //load up a cell with the identifier "PokemonViewCell"
        // and cast it to the cell you are trying to create PokemonViewCell
        guard let cell = pokemonCollectionView.dequeueReusableCell(withReuseIdentifier: "PokemonViewCell", for: indexPath) as? PokemonViewCell else {
            // if fails return an empty default cell
            return UICollectionViewCell()
        }
        
        let image = pokemonImages[indexPath.row]
        cell.setImageView(with: image)
        
    
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                
        
        let width = (collectionView.frame.width + 40) / 2
        let height = (collectionView.frame.height) / 2
        return CGSize(width: width, height: height)

      }
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var pokemonTextField: UITextField!
    @IBOutlet weak var pokemonLabel: UILabel!
    @IBOutlet weak var pokemonSaveButton: UIButton!
    
    //Loading Pokemon Flow: 2
    func setPokemonOutlets(){
        //When you make a change to an object/UI element that is visable such s a label, UIImage ect.
        //Uou must update the object from the main thread, or it will break, or not update
        DispatchQueue.main.async {
            self.pokemonLabel.text = self.pokemon?.name
            //create and set the other variables like hight / moves
        }
        
        if let pokemonUrls = pokemon?.imageURLs {
            for url in pokemonUrls {
                NetworkController.downloadImage(from: url) { pokemonImage in
                    if let pokemonImage = pokemonImage {
                        self.reloadImage(pokeImage: pokemonImage)
                    }
                }
                }
            }

        
    }
    
    //Loading Pokemon Flow: 3
    func reloadImage(pokeImage:UIImage){
            pokemonImages.append(pokeImage)
            DispatchQueue.main.async {
                self.pokemonCollectionView.reloadData()
            }
    }
    
    //MARK: - Actions
    
    //Loading Pokemon Flow: 1
    @IBAction func fetchPokemonButtonTapped(_ sender: Any) {
        self.pokemonImages = []
        if let pokemonName = pokemonTextField.text {
            PokemonController.fetchPokemon(for: pokemonName) { pokemon in
                self.pokemon = pokemon
                self.setPokemonOutlets()
            }
        }
        
    }
    
    @IBAction func savePokemonTapped(_ sender: Any) {
    }
    
    
       

    
}
