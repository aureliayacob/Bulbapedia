//
//  PokemonRepositoryProtocol.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 03/01/23.
//

import Foundation
import Combine

protocol PokemonRepositoryProtocol {
    
    func getAllPokemon() -> AnyPublisher<[PokemonModel], Error>
}
