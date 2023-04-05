//
//  AdhiPradanaViewModel.swift
//  AdhiPradanaMarket
//
//  Created by grifondev on 04.04.2023.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

func endEditing() {
    UIApplication.shared.endEditing()
}
