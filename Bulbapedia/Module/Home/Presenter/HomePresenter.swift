//
//  HomePresenter.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 03/01/23.
//

import Foundation
import SwiftUI
import Combine

class HomePresenter: ObservableObject {
    
    private var homeUseCase: HomeUseCase
    private let router = HomeRouter()
    var cancellables = Set<AnyCancellable>()
    
    @Published var isError: Bool = false
    @Published var isLoading: Bool = true
    @Published var allDataPokemon: [PokemonModel] = []
    @Published var showDataPokemon: [PokemonModel] = []
    @Published var searchPokemon: String = ""
    @Published var filterPokemon: String = "all"
    
    init(useCase: HomeUseCase) {
        self.homeUseCase = useCase
        getAllPokemon()
        subscribeToDataPokemon()
    }
    
    func getAllPokemon() {
        homeUseCase.getAllPokemon()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(_):
                    self.isError = true
                    self.isLoading = false
                }
            }, receiveValue: {[weak self] returnedDataPokemon in
                self?.allDataPokemon = returnedDataPokemon
                self?.showDataPokemon = returnedDataPokemon
                self?.isError = false
                self?.isLoading = false
            })
            .store(in: &cancellables)
        
    }
    
    func subscribeToDataPokemon() {
        $searchPokemon
            .combineLatest($allDataPokemon)
            .map(filterPokemon)
            .sink { filteredPokemon in
                self.showDataPokemon = filteredPokemon
            }
            .store(in: &cancellables)
        
        $filterPokemon
            .combineLatest($allDataPokemon)
            .map(filterPokemonByType)
            .sink { filteredPokemon in
                self.showDataPokemon = filteredPokemon
            }
            .store(in: &cancellables)
    }
    
    private func filterPokemon(text: String, pokemons: [PokemonModel]) -> [PokemonModel] {
        self.filterPokemon = "all"
        guard !text.isEmpty else {
            return allDataPokemon
        }
        let lowercasedText = text.lowercased()
        return pokemons.filter { (pokemon) -> Bool in
            return pokemon.name?.lowercased().contains(lowercasedText) ?? false
        }
    }
    
    private func filterPokemonByType(type: String, pokemons: [PokemonModel]) -> [PokemonModel] {
        self.searchPokemon = ""
        guard type != "all" else {
            return allDataPokemon
        }
        let lowercasedText = type.lowercased()
        return pokemons.filter { (pokemon) -> Bool in
            return pokemon.type?.lowercased().contains(lowercasedText) ?? false
        }
    }
    
    func linkBuilder<Content: View>(
        for pokemon: PokemonModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        CustomNavigationLink(destination: router.makeDetailView(for: pokemon),
                             title: pokemon.name ?? "",
                             label: {content()})
    }
    
}
