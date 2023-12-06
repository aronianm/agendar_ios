//
//  CalendarHour.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import SwiftUI

struct CalendarHour: View {
    let currentHour = Calendar.current.component(.hour, from: Date())
    var currentDay:Bool

    var body: some View {
            
            ForEach(0..<24, id: \.self) { hour in
                HStack{
                    Text("\(hour == 0 ? 12 : hour % 12)")
                        .font(.headline)
                        .padding()
                        .id((hour == currentHour) ? "scrollTarget" : "")
                        
                    Spacer()
                }.background(hour == currentHour && currentDay ? /*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.542, saturation: 1.0, brightness: 1.0, opacity: 0.273)/*@END_MENU_TOKEN@*/ : Color.gray.opacity(0.2))
            }
        
        .navigationBarTitle("Current Times by Hour", displayMode: .inline)
    }
}

struct CalendarHour_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHour(currentDay: true)
    }
}
