//
//  HeaderView.swift
//  Pokedex
//
//  Created by nexsoft nexsoft on 13/12/22.
//

import SwiftUI

struct HeaderView: View {
	var title: String
	var body: some View {
		VStack(alignment: .center) {
			Text(title)
				.font(.title)
				.fontWeight(.heavy)
				.foregroundColor(.theme.mint)
		}
		.padding(10)
	}
}
