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
                    Group{
                        Text("\(hour == 0 || hour == 12 ? 12 : hour % 12)")
                            .padding([.top, .leading, .bottom], 10.0)
                        Text(hour < 12 ? "AM" : "PM")
                    }.font(.headline)
                    Spacer()
                }.background(hour == currentHour && currentDay ? /*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.542, saturation: 1.0, brightness: 1.0, opacity: 0.273)/*@END_MENU_TOKEN@*/ : Color.gray.opacity(0.2)).id((hour == currentHour) ? "scrollTarget" : "").frame(maxWidth: .infinity)
            }
    }
}

struct CalendarHour_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHour(currentDay: true)
    }
}
