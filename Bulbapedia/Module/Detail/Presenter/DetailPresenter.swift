//
//  DetailPresenter.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 03/01/23.
//

import Foundation
import Combine

class DetailPresenter: ObservableObject {
    
    private var detailUseCase: DetailUseCase
    var cancellables = Set<AnyCancellable>()
    var favoritePokemon: [FavoritePokemonModel] = []
    @Published var favoritePokemon2: FavoritePokemonModel? = nil
    @Published var isFavorite: Bool = false
    
    init(useCase: DetailUseCase, id: Int) {
        self.detailUseCase = useCase
        
    }
    
    func doAddToFavorite(pokemon: FavoritePokemonModel) {

        if self.favoritePokemon2 == nil && isFavorite == false {
           detailUseCase.updateTabel(by: pokemon)
            self.isFavorite = true
            getPokemonById(id: pokemon.id ?? 0)

        } else if self.favoritePokemon2 != nil && isFavorite == true {
            detailUseCase.deleteById(id: pokemon.id ?? 0)
            self.isFavorite = false
            getPokemonById(id: pokemon.id ?? 0)
        }
    }
    
    func getPokemonById(id: Int) {
        detailUseCase.getDataById(id: id)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(_):
                    print("Data not found")
                    self.favoritePokemon2 = nil
                    
                }
            }, receiveValue: {[weak self] returnedDataPokemon in
                self?.favoritePokemon2 = returnedDataPokemon
            })
            .store(in: &cancellables)
        isPokemonAddedToFavorite()
    }
    
    func isPokemonAddedToFavorite() {
        if self.favoritePokemon2 == nil {
            self.isFavorite = false
        } else {
            self.isFavorite = true
        }
    }
}
