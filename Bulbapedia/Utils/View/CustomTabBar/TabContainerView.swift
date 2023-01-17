//
//  TabContainerView.swift
//  Pokedex
//
//  Created by Aurelia Yacob on 23/12/22.
//

import SwiftUI

public struct TabContainerView<Content: View>: View {
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    @State var showButton: Bool = true
    @State var title: String = "Bulbapédia"
    
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content){
        self._selection = selection
        self.content = content()
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.theme.stone.ignoresSafeArea()
                VStack(spacing:0) {
                    HeaderView(title: title)
                    ZStack {
                        content
                    }
                    CustomTabBarView(tabItems: tabs, selection: $selection)
                }
                .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
                    self.tabs = value
                }
                .onChange(of: selection) { newValue in
                    withAnimation(.spring()) {
                        if selection == tabItems[0] {
                            self.showButton = true
                            self.title = "Bulbapédia"
                        } else if selection == tabItems[1] {
                            self.showButton = false
                            self.title = "Favorites"
                        } else {
                            self.showButton = false
                            self.title = "About"
                        }
                    }
                }
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}
