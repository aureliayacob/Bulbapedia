//
//  CustomNavigationBar.swift
//  Pokedex
//
//  Created by nexsoft nexsoft on 15/12/22.
//

import Foundation
import SwiftUI

struct CustomNavigationBar: View {
	
	@Environment(\.presentationMode) var presentationMode
	private var title: String
	
	init (title: String) {
		self.title = title
	}
	
	var body: some View {
		
		ZStack {
			HStack{
				Button {
					presentationMode.wrappedValue.dismiss()
				} label: {
					ZStack {
						Circle()
							.fill(Color.theme.stone)
							.frame(width: 45)
						Image(systemName: "chevron.left")
							.font(.system(size: 20, weight: .bold))
							.foregroundColor(Color.white)
						
					}
				}
				
				Spacer()
				
				Text(title.uppercased())
					.foregroundColor(Color.theme.stone)
					.fontWeight(.heavy)
					.font(.title)
				
				Spacer()
				
				ZStack {
					Circle()
						.fill(Color.theme.stone)
						.frame(width: 45)
					
					
					Image(systemName: "heart.fill")
						.font(.system(size: 20, weight: .bold))
						.foregroundColor(Color.pink)
					
				}
				.opacity(0.0)
			}
			
		}
		.frame(height: 65)
		.padding(.horizontal)
	}
}

struct CustomNavigationBar_Previews: PreviewProvider {
	static var previews: some View {
		ZStack {
			Color.theme.mint.ignoresSafeArea()
			VStack {
				CustomNavigationBar(title: "Ivysaur")
				Spacer()
			}
		}
	}
}

