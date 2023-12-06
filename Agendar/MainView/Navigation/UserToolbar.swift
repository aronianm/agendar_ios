//
//  UserToolbar.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import SwiftUI

struct UserToolbar: View {
    var body: some View {
        TabView {
            // Tab 1
            Text("Tab 1")
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)

            // Tab 2
            Text("Tab 2")
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }
                .tag(1)

            // Tab 3
            Text("Tab 3")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
        }
        .accentColor(.blue) // Set the active tab color
    }
}

struct UserToolbar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserToolbar()
        }
    }
}
