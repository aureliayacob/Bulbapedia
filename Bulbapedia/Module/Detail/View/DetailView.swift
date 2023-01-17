//
//  DetailView.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 03/01/23.
//

import SwiftUI

struct DetailVew: View {
    
    @ObservedObject var presenter: DetailPresenter
    @State private var liked = false
    @State private var typeColor: Color = .clear
    
    var pokemon: PokemonModel?
    
    var body: some View {
        ZStack {
            Color.theme.stone.ignoresSafeArea()
            backDrop
            imageView
            likeButton
            VStack {
                Spacer()
                VStack {
                    VStack(alignment: .center) {
                        pokemonDetail
                        Spacer()
                            .frame(maxHeight: 20)
                        pokemonDescription
                        StatGroup(pokemon: pokemon)
                            .padding()
                    }
                    .padding(.top)
                }
                .padding()
                .background(RoundedCorners(color: .theme.stone, tl: 25, tr: 25))
                .frame(maxHeight: 500)
            }.ignoresSafeArea()
        }
        .onAppear {
            self.typeColor = ColorGenerator.getColor(for: pokemon?.type ?? "")
            presenter.getPokemonById(id: pokemon?.id ?? 0)
        }
    }
}


extension DetailVew {
    
    private var imageView: some View {
        VStack {
            Spacer()
                .frame(maxHeight: 80)
            AsyncImage(url: URL(string: pokemon?.imageURL ?? ""))
            {
                phase in
                
                switch phase {
                case .empty :
                    ProgressView()
                        .progressViewStyle(.circular)
                        .tint(Color.theme.stone)
                        .frame(height: 220)
                case .success(let image) :
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 220)
                case .failure(_) :
                    VStack {
                        Image(systemName: "photo.fill")
                            .font(.largeTitle)
                            .frame(height: 220)
                    }
                @unknown default:
                    EmptyView()
                }
            }
            Spacer()
        }
    }
    
    
    private var backDrop: some View {
        VStack {
            ZStack {
                typeColor
                    .frame(height: UIScreen.main.bounds.height / 3 * 2)
                    .ignoresSafeArea()
                
                Image("Pokeball")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color.white)
                    .scaledToFit()
                    .frame(width: 400)
                    .offset(x: 80, y: 75)
                    .rotationEffect(Angle(degrees: -30.0))
                    .opacity(0.15)
            }
            Spacer()
        }
    }
    
    private var likeButton: some View {
        VStack {
            HStack {
                Spacer()
                ZStack {
                    Circle()
                        .fill(Color.theme.stone)
                        .frame(width: 45)
                    
                    Button {
                        presenter.doAddToFavorite(pokemon:  FavoritePokemonModel(id: pokemon?.id,
                                                                                 name: pokemon?.name,
                                                                                 type: pokemon?.type,
                                                                                 image: pokemon?.imageURL,
                                                                                 desc: pokemon?.description,
                                                                                 atk: pokemon?.attack,
                                                                                 def: pokemon?.defense,
                                                                                 height: pokemon?.height,
                                                                                 weight: pokemon?.weight))
                        
                        
                    } label: {
                        Image(systemName: presenter.isFavorite ? "heart.fill" : "heart")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(presenter.isFavorite ? Color.pink : Color.white)
                            .padding()
                    }
                }
                .frame(height: 65)
                .padding(.horizontal)
            }
            Spacer()
        }
    }
    
    private var pokemonDetail: some View {
        HStack(spacing: 45) {
            VStack(spacing: 5) {
                
                Text(pokemon?.type?.capitalized ?? "-")
                    .fontWeight(.bold)
                    .foregroundColor(typeColor)
                    .font(.title3)
                
                Text("Type")
                    .fontWeight(.semibold)
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.8))
            }
            
            Rectangle()
                .fill(typeColor)
                .frame(width: 2)
            
            VStack(spacing: 5) {
                Text("\(pokemon?.height ?? 0)")
                    .fontWeight(.bold)
                    .foregroundColor(typeColor)
                    .font(.title3)
                Text("Height")
                    .fontWeight(.semibold)
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.8))
            }
            
            Rectangle()
                .fill(typeColor)
                .frame(width: 2)
            
            VStack(spacing: 5) {
                Text("\(pokemon?.weight ?? 0)")
                    .fontWeight(.bold)
                    .foregroundColor(typeColor)
                    .font(.title3)
                Text("Weight")
                    .fontWeight(.semibold)
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.8))
            }
        }
        .frame(maxHeight: 50)
    }
    
    private var pokemonDescription: some View {
        Text(pokemon?.description ?? "")
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.vertical)
    }
}

