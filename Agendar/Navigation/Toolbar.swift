//
//  Toolbar.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import SwiftUI

import SwiftUI

struct Toolbar: View {
    var body: some View {
        NavigationView {
            Text("Agendar")
                .navigationTitle("Teams")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Item 1") {
                            // Handle the tap for item 1
                            print("Item 1 tapped")
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Item 2") {
                            // Handle the tap for item 2
                            print("Item 2 tapped")
                        }
                    }
                }
        }
    }
}

struct ToolBar_Previews: PreviewProvider {
    static var previews: some View {
        Toolbar()
    }
}


