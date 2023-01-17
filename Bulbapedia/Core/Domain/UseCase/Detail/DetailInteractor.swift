//
//  DetailInteractor.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 03/01/23.
//

import Foundation
import Combine

class DetailInteractor: DetailUseCase {
    
    private let pokemonRepository: FavoritePokemonRepositoryProtocol
    
    init(repository: FavoritePokemonRepositoryProtocol) {
        self.pokemonRepository = repository
    }
        
    func getDataById(id: Int) -> AnyPublisher<FavoritePokemonModel, Error> {
        pokemonRepository.getDataById(id: id)
    }
    
    func updateTabel(by pokemon: FavoritePokemonModel) {
        pokemonRepository.updateTabel(by: pokemon)
    }
    
    func deleteById(id: Int) {
        pokemonRepository.deleteById(id: id)
    }
    
}
