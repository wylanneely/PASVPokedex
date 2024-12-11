//
//  Pokemon.swift
//  Pokemon
//
//  Created by Wylan L Neely on 12/9/24.
//

import Foundation
import UIKit

struct Pokemon {
    
    let name: String
    let id: Int
    let types: [String]
    let imageURL: URL?
    let abilities: [String]
    
}

extension Pokemon {
    
    private static let kName = "name"
    private static let kId = "id"
    private static let kAbilities = "abilities"
    private static let kTypes = "types"
    private static let KImageUrl = "sprites"
      
    init?(pokemonDictionary: [String: Any]) {
          guard let name = pokemonDictionary[Pokemon.kName] as? String,
                
          let id = pokemonDictionary[Pokemon.kId] as? Int,
                
          let abilitityDictionaries = pokemonDictionary[Pokemon.kAbilities] as? [[String: Any]],
                
         //Go over the differences between Any and AnyObject
          let typesDictionary = pokemonDictionary[Pokemon.kTypes] as? [[String: Any]]  else {return nil}
          
          
          // the optional chaining "?" searches for "name" key inside of the "ability" keys dictionary, also reuires ANYOBJECT
           // Objective-C bridging can do subscripting
        
//        let abilities = abilitityDiction.compactMap{ $0["ability"]?["name"] as? String }
//        
//        
//        let types = typesDictionary.compactMap { typeDict in
//            (typeDict["types"] as? [String: Any])?["type"] as? String
//        }
        
        var abilities = [String]()
        
        for abilityDictionary in abilitityDictionaries {
            if let ability = abilityDictionary["ability"] as? [String:Any],
               let abilityName = ability["name"] as? String {
                abilities.append(abilityName)
            }
        }
        
        
        var types: [String] = []

        for typeDict in typesDictionary {
            if let type = typeDict["type"] as? [String: Any],
               let name = type["name"] as? String {
                types.append(name)
            }
        }

        
        self.init(name:name , id: id, types: types, imageURL: nil, abilities: abilities)
          
          
          
      }
}


