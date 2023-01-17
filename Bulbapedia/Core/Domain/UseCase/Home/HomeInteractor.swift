//
//  HomeInteractor.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 03/01/23.
//

import Foundation
import Combine

class HomeInteractor: HomeUseCase {
    
    private let pokemonRepository: PokemonRepositoryProtocol
    
    init(repository: PokemonRepositoryProtocol) {
        self.pokemonRepository = repository
    }
    
    func getAllPokemon() -> AnyPublisher<[PokemonModel], Error> {
        pokemonRepository.getAllPokemon()
    }
}
