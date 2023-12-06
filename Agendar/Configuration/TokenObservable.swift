//
//  TokenObservable.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import Foundation

class TokenObverable: ObservableObject {
    @Published var token: String = ""

    init() {
        // Set initial value from UserDefaults or any other logic
        token = UserDefaults.standard.string(forKey: "token") ?? ""
    }
}
