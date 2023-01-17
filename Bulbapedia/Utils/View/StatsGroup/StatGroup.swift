//
//  StatGroup.swift
//  Pokedex
//
//  Created by nexsoft nexsoft on 13/12/22.
//

import SwiftUI

struct StatGroup: View {
    
    let pokemon: PokemonModel?
    @State var statColor: Color = .clear
    @State var atkValue = 0
    @State var defValue = 0
    @State var weightValue = 0
    @State var heightValue = 0
    @State var valued = false
    
    var body: some View {
        VStack(spacing: 0) {
            
            StatView(statName: "ATK", statColor: statColor, statValue: atkValue)
            StatView(statName: "DEF", statColor: statColor, statValue: defValue)
            StatView(statName: "WEIGHT", statColor: statColor, statValue: weightValue)
            StatView(statName: "HEIGHT", statColor: statColor, statValue: heightValue)
            
            
        }
        .onAppear {
            
            withAnimation(.spring().delay(0.2)){
                self.atkValue = pokemon?.attack ?? 0
                self.defValue = pokemon?.defense ?? 0
                self.weightValue = pokemon?.weight ?? 0
                self.heightValue = pokemon?.height ?? 0
            }
            
            self.statColor = ColorGenerator.getColor(for: pokemon?.type ?? "")
        }
    }
}

struct StatGroup_Previews: PreviewProvider {
    static var previews: some View {
			StatGroup(pokemon: PokemonModel(id: 1, attack: 64, defense: 32, description: "", height: 9, imageURL: "", name: "", type: "", weight: 67))
    }
}
