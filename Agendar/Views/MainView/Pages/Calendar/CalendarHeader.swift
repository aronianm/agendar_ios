//
//  CalendarHeader.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import SwiftUI

struct CalendarHeader: View {
    @Binding var selectedDay:String
    var body: some View {
        VStack{
            HStack {
                Spacer()
                ForEach(["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"], id: \.self) { day in
                    let content: some View = selectedDay == day ? AnyView(Text(day)
                        .padding(.vertical, 8)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10.0)
                        .foregroundColor(.white)
                    ): AnyView(Text(day)
                        .padding(.vertical, 8)
                    )
                    HStack{
                        content
                        Spacer()
                    }.onTapGesture{
                        selectedDay = day
                    }
                    
                }
                
               
                
            }
            .background(Color.purple.opacity(0.3))
            
        }
    }
}

