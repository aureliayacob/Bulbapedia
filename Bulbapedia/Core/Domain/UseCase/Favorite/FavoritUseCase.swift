//
//  FavoritUseCase.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 05/01/23.
//

import Foundation
import Combine

protocol FavoriteUseCase {
    
    func getData() ->  AnyPublisher<[FavoritePokemonModel], Error>
    
}
