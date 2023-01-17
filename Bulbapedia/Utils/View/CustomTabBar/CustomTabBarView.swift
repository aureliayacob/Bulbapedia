//
//  CustomTabBarView.swift
//  Pokedex
//
//  Created by Aurelia Yacob on 23/12/22.
//

import SwiftUI

public struct CustomTabBarView: View {
    var tabItems: [TabBarItem]
    @Binding var selection: TabBarItem
    let color: Color = Color.theme.stone
    
    public var body: some View {
        HStack {
            ForEach(tabItems, id: \.self){
                tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(8)
        .background(Color.theme.stone
            .ignoresSafeArea(edges: .bottom)
        )
        .frame(maxHeight: 55)
    }
    
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var tabItems = [TabBarItem(iconName: "house.fill", title: "Home"), TabBarItem(iconName: "heart.fill", title: "Favorites"), TabBarItem(iconName: "person.circle.fill", title: "Profile")]
    static var previews: some View {
        ZStack {
            Color.theme.stone.ignoresSafeArea()
            VStack {
                Spacer()
                CustomTabBarView(tabItems: tabItems, selection: .constant(tabItems.first!))
            }
            
        }
    }
}

extension CustomTabBarView {
    private func tabView(tab: TabBarItem) -> some View {
        VStack(spacing: 0) {
            Image(systemName: tab.iconName)
                .font(.title2)
                .padding(.bottom, 3)
            
            Text(tab.title)
                .font(.caption)
                .fontWeight(.bold)
        }
        .foregroundColor(selection == tab ? Color.theme.mint : Color.white)
        .frame(maxWidth:.infinity)
        .background(Color.theme.stone)
    }
    private func switchToTab(tab: TabBarItem){
        withAnimation(.easeInOut){
            selection = tab
        }
    }
}


public struct TabBarItem: Hashable {
    let iconName: String
    let title: String
}
