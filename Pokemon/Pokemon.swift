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
    let type: String
    let imageURL: URL
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
              let abilitityDiction = pokemonDictionary[Pokemon.kAbilities] as? [[String: AnyObject]] else {return nil}
          
          
          // the optional chaining "?" searches for "name" key inside of the "ability" keys dictionary, also reuires ANYOBJECT
          let abilities = abilitityDiction.compactMap{ $0["ability"]?["name"] as? String }
          
          self.init(name: <#T##String#>, id: <#T##Int#>, type: <#T##String#>, imageURL: <#T##URL#>, abilities: <#T##[String]#>)
          
          
          
          
      }
}


