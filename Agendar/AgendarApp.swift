//
//  AgendarApp.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import SwiftUI

@main
struct AgendarApp: App {
    @AppStorage("token") var token: String = ""
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(TokenObverable())
        }
    }
}
