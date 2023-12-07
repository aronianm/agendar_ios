//
//  CalendarDay.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import SwiftUI

struct CalendarDay: View {
    let day: Int
    
    var body: some View {
        VStack {
            Text("\(day)")
                .padding()
                .background(Color.blue)
                .clipShape(Circle())
                .foregroundColor(.white)
        }
        .frame(width: 40, height: 40)
        .padding(.vertical, 8)
    }
}

struct CalendarDay_Previews: PreviewProvider {
    static var previews: some View {
        CalendarDay(day: 1)
    }
}
