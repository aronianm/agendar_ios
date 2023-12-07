//
//  TeamPlayerListView.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/7/23.
//

import SwiftUI

struct TeamPlayerListView: View {
    var team:TeamModel
    @State var showMenu:Bool = false
    @State var phone:Bool = false
    @State var email:Bool = false
    @State var text:Bool = false
    var body: some View {
        List {
            ForEach(team.players, id: \.self) { player in
                HStack {
                    Text(player.formatted_name)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(3)
                    Spacer()
                    Image(systemName: "envelope.fill")
                        .frame(minWidth: 0,  alignment: .leading)
                        .padding(3).onTapGesture {
                            resetContact()
                            email = true
                            showMenu = true
                        }
                    Spacer()
                    Image(systemName: "phone.arrow.right")
                        .frame(minWidth: 0,  alignment: .leading)
                        .padding(3).onTapGesture {
                            resetContact()
                            phone = true
                            showMenu = true
                            
                        }
                    Spacer()
                    Image(systemName: "message.badge").frame(minWidth: 0,alignment: .leading)
                        .padding(3).onTapGesture {
                            resetContact()
                            text = true
                            showMenu = true
                        }
                    Spacer()
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Employees for \(team.name)")
        .sheet(isPresented: $showMenu) {
                       Text("Show users schedule here")
            if(text){
                Text("Sending a text")
            }
            if(phone){
                Text("Sending a phne call")
            }
            if(email){
                Text("Sending a email")
            }
        }
        
    }
    
    func resetContact() {
        phone = false
        email = false
        text = false
    }
    
}
struct TeamPlayerListView_Previews: PreviewProvider {
    static var previews: some View {
        TeamPlayerListView(team: TeamModel(id: 1, name: "Test Test Test", players: [
                TeamPlayerModel(id: 1, formatted_name: "Test Test test test test", email: "foo@gamil.com", phone_number: "978-726-5882")
        ]))
    }
}
