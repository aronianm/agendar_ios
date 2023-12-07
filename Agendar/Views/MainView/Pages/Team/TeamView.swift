//
//  TeamView.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import SwiftUI

struct TeamView: View {
    @StateObject private var teamManager = TeamManager()

    var body: some View {
        NavigationView {
            if teamManager.teams.isEmpty {
                Text("You are not registered to any teams")
            } else {
                List {
                    ForEach(teamManager.teams, id: \.id) { team in
                        NavigationLink(destination: TeamPlayerListView(team: team)) {
                            VStack(alignment: .leading) {
                                Text("\(team.name)")
                                    .font(.headline)
                            }
                            .padding()
                        }
                    }
                }.listStyle(InsetListStyle()).listStyle(GroupedListStyle()).navigationTitle("Active Teams")  }
        }
        .onAppear {
            teamManager.fetchUserTeams()
        }
    }
}
#Preview {
    TeamView()
}
