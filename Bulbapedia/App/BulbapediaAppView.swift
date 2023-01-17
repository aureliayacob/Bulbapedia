//
//  BulbapediaAppView.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 03/01/23.
//

import SwiftUI

struct BulbapediaAppView: View {
    @State private var selection = tabItems.first!
    
    let homeUseCase: HomeUseCase
    let homePresenter: HomePresenter
    
    let favoriteUseCase: FavoriteUseCase
    let favoritePresenter: FavoritePresenter
    
    init() {
        
        self.homeUseCase =  Injection.init().provideHome()
        self.homePresenter = HomePresenter(useCase: homeUseCase)
        
        self.favoriteUseCase = Injection.init().provideFavorite()
        self.favoritePresenter = FavoritePresenter(useCase: favoriteUseCase)
        
    }
    
    var body: some View {
        
        TabContainerView(selection: $selection) {
            
            HomeView(presenter: homePresenter)
                .tabBarItem(tab: tabItems[0], selection: $selection)
            
            FavoriteView(presenter: favoritePresenter)
                .tabBarItem(tab: tabItems[1], selection: $selection)
            
            AboutView()
                .tabBarItem(tab: tabItems[2], selection: $selection)
        }
    }
}
