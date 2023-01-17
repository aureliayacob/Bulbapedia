//
//  CustomNavigationContainer.swift
//  Pokedex
//
//  Created by nexsoft nexsoft on 15/12/22.
//

import Foundation
import SwiftUI

struct CustomNavigationBarContainer<Content: View>: View {
    let content: Content
    let title: String
    
    init(title: String, @ViewBuilder content: () -> Content){
        self.content = content()
        self.title = title
    }
    
    var body: some View {
        ZStack{
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                CustomNavigationBar(title: title)
                Spacer()
            }
        }
    }
}

struct CustomNavigationBarContainer_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBarContainer(title: "Ivysaur") {
            Color.theme.stone
                .ignoresSafeArea()
            
            
        }
    }
}
