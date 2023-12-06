//
//  Login.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import SwiftUI

struct Login: View {
    @State private var teamCode: String = ""
    @EnvironmentObject var token: TokenObverable
    var body: some View {
        ZStack {
            Color.purple
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Team Code")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                Text("You need a code from your teams manager to access")
                    .multilineTextAlignment(.center)
                Spacer()
                Spacer()
                TextField("Enter Team Code", text: $teamCode)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .font(.headline)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                Spacer()
                Button(action: {
                    token.token = teamCode
                        }) {
                            Text("Tap Me")
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .cornerRadius(10)
                                .shadow(color: Color.black, radius: 5, x: 0, y: 3)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.horizontal, 10.0)
                        .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Spacer()

            }
        }
    }
}
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
