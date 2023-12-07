//
//  UserObservable.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import SwiftUI

class UserManager: ObservableObject {
    @Published var user: UserModel?
    


    func fetchUserInfo() {
        // Replace this URL with your actual API endpoint
        guard let url = URL(string: "http://aronian-2.local:3001/users") else {
            return
        }
        
        if let storedToken = KeychainHelper.getToken(key: "apiKey") {
            var request = URLRequest(url: url)
            request.addValue("\(storedToken)", forHTTPHeaderField: "Authorization")
            
            
            URLSession.shared.dataTask(with: request) { data, _, error in
                if let data = data {
                    do {
                        let decodedUser = try JSONDecoder().decode(UserModel.self, from: data)
                        DispatchQueue.main.async {
                            self.user = decodedUser
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
