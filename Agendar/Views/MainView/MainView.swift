//
//  MainView.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab: Int = 0
    @EnvironmentObject var token:TokenObverable
    @State private var showAlert = true
    var body: some View {
        TabView(selection: $selectedTab) {
            // Tab 1
            HomeView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(0)

            // Tab 2
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Schedule")
                }
                .tag(1)

            // Tab 3
            TeamView()
                .tabItem {
                    Image(systemName: "person.3.sequence.fill")
                    Text("Teams")
                }
                .tag(2)
            TeamCode()
                .tabItem {
                    Image(systemName: "qrcode")
                    Text("Team Code")
                }
                .tag(3)
            Text("").onAppear{
                if(selectedTab == 4){
                    showAlert = true
                }
            }.alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Are you sure?"),
                    message: Text("Logging out will end your session."),
                    primaryButton:.cancel(Text("Cancel"),
                                         action: {
                                             selectedTab = 0
                                             showAlert = false
                                         }),
                    secondaryButton: .destructive(
                        Text("Logout"),
                        action: {
                            KeychainHelper.deleteToken(key: "apiKey")
                            token.loggedIn = false
                        }
                    )
                )
            }.tabItem {
                Image(systemName: "door.left.hand.open")
                Text("Logout")
            }.tag(4)
        }
        .accentColor(.blue)
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
