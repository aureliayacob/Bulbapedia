//
//  HomeView.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 03/01/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var presenter: HomePresenter
    
    var body: some View {
        ZStack {
            Color.theme.stone
                .ignoresSafeArea()
            ScrollView {
                SearchBarView(searchText: $presenter.searchPokemon)
                ChipView(selection: $presenter.filterPokemon)
                    .padding()
                if presenter.isLoading {
                    loadingPokemon
                } else {
                    if presenter.isError {
                        ErrorPageView {
                            presenter.getAllPokemon()
                        }
                    } else {
                        listPokemon
                    }
                }
            }
        }
    }
}

extension HomeView {
    private var listPokemon: some View {
        ForEach(presenter.showDataPokemon, id: \.id){
            poke in
            self.presenter.linkBuilder(for: poke) {
                            PokemonCardView(
                                name: poke.name ?? "",
                                image: poke.imageURL ?? "",
                                type: poke.type ?? "")
                        }
        }
    }
    
    private var loadingPokemon: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .tint(.white)
    }
}
