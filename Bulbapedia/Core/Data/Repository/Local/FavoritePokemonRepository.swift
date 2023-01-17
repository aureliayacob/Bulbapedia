//
//  FavoritePokemonRepository.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 04/01/23.
//

import Foundation
import Combine

class FavoritePokemonRepository: FavoritePokemonRepositoryProtocol {
    
    private let favoritePokemonDataSource: FavoritePokemonDataSourceProtocol
    
    init(dataSource: FavoritePokemonDataSourceProtocol) {
        self.favoritePokemonDataSource = dataSource
    }
    
    func getData() -> AnyPublisher<[FavoritePokemonModel], Error> {
        favoritePokemonDataSource.getData()
            .map({ fav in
                var arr: [FavoritePokemonModel] = []
                for favo in fav {
                    arr.append(self.transformPokemon(entity: favo))
                }
                return arr
            })
            .eraseToAnyPublisher()
        
    }
   
        func getDataById(id: Int) -> AnyPublisher<FavoritePokemonModel, Error> {
            return self.favoritePokemonDataSource.getDataById(id: id)
                .tryMap({self.transformPokemon(entity: $0)})
                .eraseToAnyPublisher()
        }
    
        func updateTabel(by pokemon: FavoritePokemonModel) {
            self.favoritePokemonDataSource.updateTabel(by: pokemon)
        }

        func deleteById(id: Int) {
            self.favoritePokemonDataSource.deleteById(id: id)
}
    
    func transformPokemon(entity: FavoritePokemonEntity) -> FavoritePokemonModel {
        return FavoritePokemonModel(
            id: Int(entity.id),
            name: entity.name,
            type: entity.type,
            image: entity.image,
            desc: entity.desc,
            atk: Int(entity.atk),
            def: Int(entity.def),
            height: Int(entity.height),
            weight: Int(entity.weight))
    }
}


