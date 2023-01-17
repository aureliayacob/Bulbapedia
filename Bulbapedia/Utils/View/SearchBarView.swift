//
//  SearchBarView.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 03/01/23.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(searchText.isEmpty ? .gray : .theme.mint)
            
            ZStack {
                HStack {
                    Text("Search pokemon by name...")
                        .fontWeight(.regular)
                        .font(.headline)
                        .foregroundColor(.gray)
                        .opacity(searchText.isEmpty ? 1.0 : 0.0)
                    Spacer()
                }
                TextField("", text: $searchText)
                    .foregroundColor(.theme.mint)
                    .disableAutocorrection(true)
                    .overlay(
                        Image(systemName: "xmark.circle.fill")
                            .padding()
                            .offset(x: 10)
                            .foregroundColor(.theme.mint)
                            .opacity(searchText.isEmpty ? 0.0 : 1.0)
                            .onTapGesture {
                                UIApplication.shared.endEditing()
                                searchText = ""
                            }
                        , alignment: .trailing
                    )
                
            }
        }
        .font(.headline)
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.theme.ash)
        )
        .padding(.horizontal)
    }
}
