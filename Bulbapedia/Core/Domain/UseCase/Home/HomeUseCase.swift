//
//  HomeUseCase.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 03/01/23.
//

import Foundation
import Combine


protocol HomeUseCase {
    
    func getAllPokemon() -> AnyPublisher<[PokemonModel], Error>
    
}
