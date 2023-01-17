//
//  DetailUseCase.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 03/01/23.
//

import Foundation
import Combine


protocol DetailUseCase {
    
    func getDataById(id: Int) ->  AnyPublisher<FavoritePokemonModel, Error>
    
    func updateTabel(by pokemon: FavoritePokemonModel)
    
    func deleteById(id: Int)
    
}

    

