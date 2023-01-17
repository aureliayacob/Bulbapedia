//
//  ErrorPageView.swift
//  Bulbapedia
//
//  Created by nexsoft nexsoft on 03/01/23.
//

import SwiftUI

struct ErrorPageView: View {
    var tryAgainAction: () -> () = {}
    var body: some View {
        ZStack {
            Color.theme.stone.ignoresSafeArea()
            VStack(alignment: .center) {
               
                    Text("Failed to load data")
                    .font(.subheadline)
                    Text("Please check your internet connection")
                    .font(.subheadline)
                    .padding(.bottom)
                
                Button {
                    tryAgainAction()
                } label: {
                    HStack {
                        Text("Try Again")
                        Image(systemName: "arrow.counterclockwise")
                    }
                    .font(.subheadline)
                    .fontWeight(.bold)
                }
                
            }
            .foregroundColor(.theme.mint)
        }
    }
}

struct ErrorPageView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorPageView()
    }
}
