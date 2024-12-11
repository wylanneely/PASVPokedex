//
//  PokemonController.swift
//  Pokemon
//
//  Created by Wylan L Neely on 12/9/24.
//

import Foundation

class PokemonController {
    
    static let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon/")
    
    //GET
    
    static func fetchPokemon(for searchTerm: String, completion: @escaping (Pokemon?) -> Void) {
        //APPENDING PATH COMPONENTS USING THE URL METHOD ___ DONT USE +=
        guard let url = baseURL?.appendingPathComponent(searchTerm.lowercased()) else {  completion(nil); return}
       
        NetworkController.performRequest(for: url, httpMethod: .get) { data, error in
            //body of closure      PARAMETERS
            //COnvert the data into a json dictionay format, guard against it being nil
            
            guard let data = data,
                  let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any] else {
                completion(nil); return }
            
            
            let pokemon = Pokemon(pokemonDictionary: jsonDictionary)
            
            completion(pokemon)
            
        }
    }

    
}


