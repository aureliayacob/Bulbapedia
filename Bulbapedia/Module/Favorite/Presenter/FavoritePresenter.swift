//
//  FavoritePresenter.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 05/01/23.
//

import Foundation
import SwiftUI
import Combine

class FavoritePresenter: ObservableObject {
    
    private var useCase: FavoriteUseCase
    private var router = FavoriteRouter ()
    var cancellables = Set<AnyCancellable>()
    @Published var allFavoritePokemon: [FavoritePokemonModel] = []

    
    init(useCase: FavoriteUseCase) {
        self.useCase = useCase
    }
    
    func getAllPokemon() {
        useCase.getData()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(_):
                    print(CoreDataError.requestFailed)
                }
            } receiveValue: { [weak self] returnedPokemons in
                self?.allFavoritePokemon = returnedPokemons
            }
            .store(in: &cancellables)
        
    }
    
    func linkBuilder<Content: View>(
        for pokemon: FavoritePokemonModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        CustomNavigationLink(destination: router.makeDetailView(for:
                                                                    PokemonModel(id: pokemon.id,
                                                                                 attack: pokemon.atk,
                                                                                 defense: pokemon.def,
                                                                                 description: pokemon.desc,
                                                                                 height: pokemon.height,
                                                                                 imageURL: pokemon.image,
                                                                                 name: pokemon.name,
                                                                                 type: pokemon.type,
                                                                                 weight: pokemon.height)),
                             title: pokemon.name ?? "",
                             label: {content()})
    }
}
