//
//  HomeView.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
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

            Text("Mike Aronian")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 10)

            Text("Senior Software Developer")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 5)

            Divider()
                .padding(.vertical, 10)

            HStack {
                VStack(alignment: .leading) {
                    Text("Email:")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Text("aronian.m@gmail.com")
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
            }
            .padding(.horizontal, 20)

            Spacer()
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
