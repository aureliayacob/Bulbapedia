//
//  AboutView.swift
//  Pokedex
//
//  Created by nexsoft nexsoft on 30/12/22.
//
import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            Color.theme.stone.ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                ZStack {
                    Circle()
                        .fill(Color.theme.mint)
                        .frame(width: 160)
                    
                    Image("Aurel")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .clipShape(Circle())
                        .padding()
                }
                
                
                Text("Devida Aurelia Yacob")
                    .foregroundColor(.theme.mint)
                    .font(.title2)
                    .fontWeight(.bold)
                Text("aureliayacob@gmail.com")
                    .font(.headline)
                    .tint(.theme.mint)
                    .padding(.bottom, 50)
                
                
                VStack(spacing: 25) {
                    AboutDetailView(label: "Birthday", desc: "December 29, 1999")
                    AboutDetailView(label: "Address", desc: "Tangerang, Banten")
                    AboutDetailView(label: "Education", desc: "Informatics - Sanata Dharma University")
                }
                
                Spacer()
            }
            .padding()
            
            
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
