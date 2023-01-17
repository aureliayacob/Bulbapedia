//
//  PokemonCardView.swift
//  Pokedex
//
//  Created by nexsoft nexsoft on 09/12/22.
//

import SwiftUI

struct PokemonCardView: View {
    
    var name: String
    var image: String
    var type: String
    @State var typeColor: Color = .clear
    
    var body: some View {
        
        ZStack {
            typeColor
            HStack {
                Spacer()
                    CacheAsyncImage(url: URL(string: image)) { phase in
                        switch phase {
                        case .empty :
                            ProgressView()
                                .offset(x: -70, y: 0)
                                .progressViewStyle(.circular)
                                .tint(.white)
                        case .success(let image) :
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 170)
                                .clipped()
                                .offset(x: 0, y: 15)
                            
                        case .failure(_) :
                            Image(systemName: "photo.fill")
                                .foregroundColor(.white)
                                .offset(x: -70, y: 0)
                        @unknown default:
                            EmptyView()
                        }
                    }
               
            }
            
            
            VStack(alignment: .leading, spacing: 10) {
                Spacer()
                    .frame(maxHeight: 35)
                HStack {
                    Text(name.capitalized)
                        .foregroundColor(Color.white)
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Spacer()
                }
                
                HStack {
                    Text(type.capitalized)
                        .font(.footnote)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(50)
                    
                }
                Spacer()
                
            }
            .padding(.horizontal, 25)
            .clipped()
            
        }
        .frame(height: 110)
        .cornerRadius(16)
        .onAppear {
            self.typeColor = ColorGenerator.getCardColor(for: self.type)
        }
        .padding(.horizontal)
        .padding(.vertical, 6)
        
    }
    
}

struct PokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color.theme.stone.ignoresSafeArea()
            VStack(spacing: 15) {
                PokemonCardView(name: "Ivysaur", image: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334", type: "psychic")
                PokemonCardView(name: "Spearow", image: "Spearow", type: "fairy")
                PokemonCardView(name: "Wartortle", image: "Wartortle", type: "flying")
                Spacer()
            }
            .padding()
        }
    }
}
