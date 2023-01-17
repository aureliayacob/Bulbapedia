//
//  PokemonRepository.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 03/01/23.
//

import Foundation
import Combine

class PokemonRepository: PokemonRepositoryProtocol {
    
    private let pokemonDataSource: PokemonDataSourceProtocol
    
    init(dataSource: PokemonDataSourceProtocol){
        self.pokemonDataSource = dataSource
    }
    
    func getAllPokemon() -> AnyPublisher<[PokemonModel], Error> {
        pokemonDataSource.getData()
            .map { response in
                PokemonMapper.mapPokemonResponsesToDomains(input: response)
            }
            .eraseToAnyPublisher()
    }
    
    
}
