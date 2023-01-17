//
//  FavoriteRouter.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 05/01/23.
//

import Foundation
import SwiftUI

class FavoriteRouter {
    
    func makeDetailView(for pokemon: PokemonModel) -> some View {
        let detailUseCase = Injection.init().provideDetail(pokemon: pokemon)
        let presenter = DetailPresenter(useCase: detailUseCase, id: pokemon.id ?? 0)
        return DetailVew(presenter: presenter, pokemon: pokemon)
    }
    
}
