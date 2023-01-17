//
//  FavoritePokemonRepositoryProtocol.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 04/01/23.
//

import Foundation
import Combine

protocol FavoritePokemonRepositoryProtocol {
    
    func getData() ->  AnyPublisher<[FavoritePokemonModel], Error>
    
    func getDataById(id: Int) ->  AnyPublisher<FavoritePokemonModel, Error>
    
    func updateTabel(by pokemon: FavoritePokemonModel)
    
    func deleteById(id: Int)
    
}
