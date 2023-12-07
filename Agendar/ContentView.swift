//
//  ContentView.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var token:TokenObverable
    @State var showAlert:Bool = false
    var body: some View {
        if (KeychainHelper.getToken(key: "apiKey") != nil || token.loggedIn) {
            
            MainView().alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Welcome!"),
                    message: Text("You have successfully signed in."),
                    dismissButton: .default(Text("OK"))
                )
            }
            .padding()
        }else{
            SignupForm(showAlert: $showAlert)
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(TokenObverable())
    }
}
