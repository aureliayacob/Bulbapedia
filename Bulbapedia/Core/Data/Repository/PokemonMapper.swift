//
//  PokemonMapper.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 09/01/23.
//

import Foundation

final class PokemonMapper {
    
    static func mapPokemonResponsesToDomains(
        input pokemonResponse: PokemonResponse
    ) -> [PokemonModel] {
        return pokemonResponse
            .compactMap({$0})
            .map { result in
                return PokemonModel(id: result.id, attack: result.attack, defense: result.defense, description: result.description
                                , height: result.height, imageURL: result.imageURL, name: result.name, type: result.type, weight: result.weight)
            
            
        }
    }
}
