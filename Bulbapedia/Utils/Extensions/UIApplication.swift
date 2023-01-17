//
//  UIApplication.swift
//  Pokedex
//
//  Created by Aurelia Yacob on 22/12/22.
//

import Foundation
import SwiftUI

extension UIApplication {
	
	func endEditing() {
		sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}
