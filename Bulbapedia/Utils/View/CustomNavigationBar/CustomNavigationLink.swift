//
//  CustomNavigationLink.swift
//  Pokedex
//
//  Created by nexsoft nexsoft on 15/12/22.
//

import Foundation
import SwiftUI

struct CustomNavigationLink<Label: View, Destination: View>: View {
    let destination: Destination
    let label: Label
    let title: String
    
    init(destination: Destination, title: String, @ViewBuilder label: () -> Label){
        self.destination = destination
        self.label = label()
        self.title = title
    }
    
    var body: some View {
        NavigationLink {
            CustomNavigationBarContainer(title: title) {destination}
                .navigationBarHidden(true)
        } label: {
            label
        }
        
    }
}

struct CustomNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationLink(destination: Color.theme.stone, title: "Ivysaur") {
            Text("Go")
        }
    }
}
