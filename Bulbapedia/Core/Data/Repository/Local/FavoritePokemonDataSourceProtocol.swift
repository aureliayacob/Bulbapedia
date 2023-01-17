//
//  FavoritePokemonDataSourceProtocol.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 03/01/23.
//

import Foundation
import Combine

protocol FavoritePokemonDataSourceProtocol {
    
    func getData() ->  AnyPublisher<[FavoritePokemonEntity], Error>
    
    func getDataById(id: Int) ->  AnyPublisher<FavoritePokemonEntity, Error>
    
    func updateTabel(by pokemon: FavoritePokemonModel)
    
    func deleteById(id: Int)
}
