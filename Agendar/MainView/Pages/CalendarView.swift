//
//  CalendarView.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import SwiftUI

struct CalendarView: View {
    let daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    let timeSlots = ["8:00 AM", "9:00 AM", "10:00 AM", "11:00 AM", "12:00 PM", "1:00 PM", "2:00 PM", "3:00 PM", "4:00 PM", "5:00 PM", "6:00 PM", "7:00 PM", "8:00 PM"]

    var body: some View {
        VStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: Array(repeating: GridItem(), count: daysOfWeek.count + 1), spacing: 0) {
                    // Empty space in the top-left corner
                    Rectangle()
                        .fill(Color.clear)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)

                    // Days of the week headers
                    ForEach(daysOfWeek, id: \.self) { day in
                        Text(day)
                            .font(.caption)
                            .fontWeight(.bold)
                    }

                    // Time slots and schedule cells
                    ForEach(timeSlots, id: \.self) { timeSlot in
                        // Time slots column
                        Text(timeSlot)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .border(Color.gray.opacity(0.5), width: 0.5)

                        // Schedule cells for each day
                        ForEach(0..<daysOfWeek.count, id: \.self) { _ in
                            Rectangle().fill(Color.gray)
                        }
                    }
                }
                .frame(minHeight: 0, maxHeight: .infinity)
            }
        }
        .navigationTitle("Weekly Schedule")
    }
}
struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
