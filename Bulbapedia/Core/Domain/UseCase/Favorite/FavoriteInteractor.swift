//
//  FavoriteInteractor.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 05/01/23.
//

import Foundation
import Combine

class FavoriteInteractor: FavoriteUseCase {
    
    private let repository: FavoritePokemonRepositoryProtocol
    
    init(repository: FavoritePokemonRepositoryProtocol) {
        self.repository = repository
    }
    
    func getData() -> AnyPublisher<[FavoritePokemonModel], Error> {
        repository.getData()
    }
    
    
}
