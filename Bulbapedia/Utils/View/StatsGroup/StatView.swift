//
//  StatView.swift
//  Pokedex
//
//  Created by nexsoft nexsoft on 13/12/22.
//

import SwiftUI

struct StatView: View {
    
    var statName: String
    var statColor: Color
    var statValue: Int
    
    var body: some View {
        HStack {
            
            HStack {
                Text(statName)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .frame(width: 80)
            
            Rectangle()
                .frame(width: 2)
                .frame(height: 30)
            
            VStack(alignment: .leading) {
                Text("\(statValue)")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .frame(width: 50)
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.gray.opacity(0.5))
                    .frame(height: 20)
                
							RoundedRectangle(cornerRadius: 15)
								.foregroundColor(statColor)
								.frame(width: statValue <= 100 ? 150 * (CGFloat(statValue) / 100) : 150,
											 height: 20)
								
							}
						.clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .foregroundColor(statColor)
        
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
			ZStack {
				Color.theme.stone
				VStack(spacing: 0) {
							StatView(statName: "ATK", statColor: .pink, statValue: 76)
							StatView(statName: "DEF", statColor: .pink, statValue: 35)
							StatView(statName: "WEIGHT", statColor: .pink, statValue: 83)
							StatView(statName: "HEIGHT", statColor: .pink, statValue: 7)
					}
				.padding()
			}
    }
}
