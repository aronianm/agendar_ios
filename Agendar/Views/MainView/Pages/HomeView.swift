//
//  HomeView.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import SwiftUI

struct HomeView: View {

    @StateObject private var userManager = UserManager()
    var body: some View {
        VStack {
            if let user = userManager.user {
                Image("profile_picture")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 4)
                    )
                    .shadow(radius: 5)
                
                
                Text("\(user.fname) \(user.lname)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                HStack{
                    Text("Job title:")
                        .fontWeight(.bold)
                    Text("Senior Software Developer")
                        
                }.font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 5)
                
                Divider()
                    .padding(.vertical, 10)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Email:")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Text(user.email)
                            .font(.subheadline)
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                
                Divider()
                    .padding(.vertical, 10)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Location:")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Text("Shrewsbury, MA")
                            .font(.subheadline)
                    }
                    Spacer()
                }.padding(.horizontal, 20)
            }else {
                    Text("Fetching user information")
                }
            Spacer()
        }.padding().onAppear{
            userManager.fetchUserInfo()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
