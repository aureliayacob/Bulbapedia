//
//  FavoriteView.swift
//  Pokedex
//
//  Created by Aurelia Yacob on 26/12/22.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var presenter: FavoritePresenter
    
    var body: some View {
        ZStack {
            Color.theme.stone
                .ignoresSafeArea()
            
            
            if presenter.allFavoritePokemon.isEmpty {
                VStack(alignment: .center) {
                    Spacer()
                    Text("No favorite pokemon added yet")
                        .font(.subheadline)
                        .foregroundColor(.theme.mint)
                        .padding()
                    Spacer()
                    //                        .padding(.top, UIScreen.main.bounds.height / 3)
                }
            } else {
                ScrollView {
                    VStack(alignment: .center) {
                        ForEach(presenter.allFavoritePokemon, id: \.id) {
                            pokemon in
                            presenter.linkBuilder(for: pokemon) {
                                PokemonCardView(name: pokemon.name ?? "",
                                                image: pokemon.image ?? "",
                                                type: pokemon.type ?? "")
                            }
                        }
                    }
                    
                }
                
            }
            
        }
        .onAppear {
            presenter.getAllPokemon()
        }
    }
}
