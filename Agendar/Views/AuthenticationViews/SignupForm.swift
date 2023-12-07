//
//  CreateUser.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import SwiftUI

struct SignupForm: View {
    
    @EnvironmentObject var token: TokenObverable
    @Binding var showAlert:Bool
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var login:Bool = true
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .padding(.bottom, 20)

                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                    .padding(.horizontal, 20)
                    .autocapitalization(.none)

                SecureField("Password", text: $password)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                    .padding(.horizontal, 20)

                if(!login){
                    SecureField("Confirm Password", text: $confirmPassword)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                        .padding(.horizontal, 20)
                }
                Spacer()
                Button(action: {
                    sendPostRequest()
                }) {
                    Text(login ? "Login" : "Sign Up")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                .padding(.top, 20)

                Spacer()
            }
            .navigationBarTitle("Agendar").toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        login = true
                    }) {
                        Text("Login")
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        login = false
                    }) {
                        Text("Signup")
                    }
                }
            }
        }
    }
    
    func sendPostRequest() {
        var urlString:String = login ? "http://aronian-2.local:3001/login"
        : "http://aronian-2.local:3001/signup"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        // Create the JSON payload
        let json: [String: Any] = [
            "user": [
                "email": email,
                "password": password
            ]
        ]

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: json)

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else {
                    if let httpResponse = response as? HTTPURLResponse {
                                        // Access the Authorization header from the response
                                        if let authorizationHeader = httpResponse.allHeaderFields["Authorization"] as? String {
                                            KeychainHelper.saveToken(token: authorizationHeader, key: "apiKey")
                                        }
                        token.loggedIn = true
                                    }
                }
            }.resume()
        } catch {
            print("Error creating JSON data: \(error)")
        }
    }
}

struct SignupForm_Previews: PreviewProvider {
    static var previews: some View {
        SignupForm(showAlert:.constant(false))
    }
}
