//
//  ContentView.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var token:TokenObverable

    var body: some View {
        let content: some View = token.token == "" ? AnyView(Login()) : AnyView(MainView())
        content
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(TokenObverable())
    }
}
