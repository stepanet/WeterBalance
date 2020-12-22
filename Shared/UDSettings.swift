//
//  UDSettings.swift
//  WeterBalance
//
//  Created by Пятин Дмитрий on 23.12.2020.
//


import SwiftUI

class UDSettings: ObservableObject {
    @Published var userWeigth: Int = UserDefaults.standard.integer(forKey: "userWeigth") {
        didSet {
            UserDefaults.standard.set(self.userWeigth, forKey: "userWeigth")
        }
    }
}
