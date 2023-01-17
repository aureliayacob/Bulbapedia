//
//  ChipView.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 03/01/23.
//

import SwiftUI

struct ChipView: View {
    @Binding var selection: String
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(pokemonTypes, id: \.self) {
                    type in
                    ZStack {
                        Text(type.capitalized)
                            .font(.callout)
                            .fontWeight(.heavy)
                            .foregroundColor(.clear)
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .background(.white.opacity(0.5))
                            .cornerRadius(50)
                        Text(type.capitalized)
                            .font(.callout)
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .background(ColorGenerator.getColor(for: type).opacity(selection == type ? 1.0 : 0.3))
                            .cornerRadius(50)
                            .onTapGesture {
                                switchChip(chip: type)
                        }
                    }
                }
            }
        }
    }
    
    private func switchChip(chip: String){
        withAnimation(.easeInOut){
            selection = chip
        }
    }
}
