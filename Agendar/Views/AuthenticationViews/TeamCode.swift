//
//  TeamCode.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import SwiftUI

struct TeamCode: View {
    @State private var teamCode: String = ""
    @State private var userCode: String = ""
    
    @State private var ShowIndividualSignOn = false
    var body: some View {
        VStack {
            Spacer() // Spacer to push content to the middle of the screen

            if(ShowIndividualSignOn == false){
                TextField("Enter Team Code", text: $teamCode)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                
                
                Button(action: {
                    ShowIndividualSignOn = true
                }) {
                    Text("Next")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8.0)
                }
                .padding()
            }else{
                TextField("Individual Sign On Code", text: $userCode)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                Button(action: {
                    sendPostRequest()
                }) {
                    Text("Join")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8.0)
                }
                .padding()
            }

            Spacer() // Spacer to push content to the middle of the screen
        }
        .padding()
    }

    func sendPostRequest() {
        guard let url = URL(string: "http://aronian-2.local:3001/teams/signup") else {
            print("Invalid URL")
            return
        }

        // Create the JSON payload
        let json: [String: Any] = [
            "teams": [
                "team_code": teamCode,
                "user_code": userCode
            ]
        ]

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: json)

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            if let storedToken = KeychainHelper.getToken(key: "apiKey") {
                request.addValue("\(storedToken)", forHTTPHeaderField: "Authorization")
                URLSession.shared.dataTask(with: request) { (data, response, error) in
                    if let error = error {
                        print("Error: \(error)")
                    } else {
                        
                    }
                }.resume()
            }else{
                print("No token")
            }
        } catch {
            print("Error creating JSON data: \(error)")
        }
    }
    
}

#Preview {
    TeamCode()
}
