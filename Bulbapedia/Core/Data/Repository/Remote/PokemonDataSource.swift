//
//  PokemonDataSource.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 03/01/23.
//

import Foundation
import Combine

class PokemonDataSource: PokemonDataSourceProtocol {
    
    func getData() -> AnyPublisher<PokemonResponse, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string:"https://pokedex-bb36f.firebaseio.com/pokemon.json")!)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ $0.data })
            .receive(on: DispatchQueue.main)
            .decode(type: PokemonResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
