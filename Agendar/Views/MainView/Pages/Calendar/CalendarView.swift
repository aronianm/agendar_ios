//
//  CalendarView.swift
//  Agendar
//
//  Created by Michael Aronian Aronian on 12/6/23.
//

import SwiftUI

struct CalendarView: View {
    @State var selectedDay:String = ""
    var body: some View {
        VStack {
            // Calendar Header
            CalendarHeader(selectedDay: $selectedDay)
            ScrollViewReader { scrollView in
                ScrollView(.vertical, showsIndicators: false) {
                    CalendarHour(currentDay: selectedDay == getCurrentDay())
                }.onAppear {
                    scrollView.scrollTo("scrollTarget", anchor: .top)
                }
            }
            

            Spacer()
        }.onAppear {
            selectedDay = getCurrentDay()
        }
    }
    
    func getCurrentDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: Date())
    }
}
struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
