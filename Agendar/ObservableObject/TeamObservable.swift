//
//  TeamObservable.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import Foundation
import SwiftUI

class TeamManager: ObservableObject {
    @Published var team: TeamModel?
    @Published var teams:[TeamModel] = []
    


    func fetchTeamInfo(id: Int) {
        guard let url = URL(string: "http://aronian-2.local:3001/api/v1/teams/\(id)") else {
            return
        }
        
        if let storedToken = KeychainHelper.getToken(key: "apiKey") {
            var request = URLRequest(url: url)
            request.addValue("\(storedToken)", forHTTPHeaderField: "Authorization")
            
            
            URLSession.shared.dataTask(with: request) { data, _, error in
                if let data = data {
                    do {
                        let decodedUser = try JSONDecoder().decode(TeamModel.self, from: data)
                        DispatchQueue.main.async {
                            self.team = decodedUser
                        }
                    } catch {
                        print("Error decoding user data: \(error)")
                    }
                }
            }.resume()
        }else {
            print("Token not found")
        }
        
    }
    
    func fetchUserTeams() {
        guard let url = URL(string: "http://aronian-2.local:3001/api/v1/teams.json") else {
            return
        }
        
        if let storedToken = KeychainHelper.getToken(key: "apiKey") {
            var request = URLRequest(url: url)
            request.addValue("\(storedToken)", forHTTPHeaderField: "Authorization")
            
            
            URLSession.shared.dataTask(with: request) { data, _, error in
                if let data = data {
                    do {
                        let decodedUser = try JSONDecoder().decode([TeamModel].self, from: data)
                        DispatchQueue.main.async {
                            self.teams = decodedUser
                        }
                    } catch {
                        print("Error decoding user data: \(error)")
                    }
                }
            }.resume()
        }else {
            print("Token not found")
        }
        
    }
}
