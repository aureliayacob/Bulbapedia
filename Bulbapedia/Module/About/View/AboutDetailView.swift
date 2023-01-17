//
//  AboutDetailView.swift
//  Pokedex
//
//  Created by nexsoft nexsoft on 30/12/22.
//

import SwiftUI

struct AboutDetailView: View {
    var label: String
    var desc: String
    
    var body: some View {
        ZStack {
            Color.theme.mint
                .ignoresSafeArea()
                .frame(height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            HStack{
                VStack(alignment: .leading, spacing: 8) {
                    Text(label)
                        .font(.subheadline)
                    Text(desc)
                        .fontWeight(.bold)
                }
                .padding()
                Spacer()
            }
        }
        .foregroundColor(.theme.stone)
    }
}

struct AboutDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AboutDetailView(label: "Education", desc: "Sanata Dharma University")
    }
}
