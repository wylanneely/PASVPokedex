//
//  PokemonViewCell.swift
//  Pokemon
//
//  Created by Wylan L Neely on 12/13/24.
//

import UIKit


class PokemonViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    @IBOutlet weak var imageView: UIImageView!
    
    func setImageView(with image:UIImage){
        self.imageView.image = image
    }
    
    
}
