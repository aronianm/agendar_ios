//
//  MainView.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var token: TokenObverable
    @State private var selectedTab: Int = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            // Tab 1
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)

            // Tab 2
            CalendarView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Schedule")
                }
                .tag(1)

            // Tab 3
            Text("Profile for user")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
            Text("Logout")
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Logout")
                }
                .tag(3)
        }.onChange(of: selectedTab) { newTab in
            if(newTab == 3){
                token.token = ""
            }
        }
        .accentColor(.blue)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
