import SwiftUI
import Combine

final class ModelData: ObservableObject {
    @Published var calendarController = CalendarController()
    @Published var informationSet: [YearMonthDay: [Information]] = [
        YearMonthDay.current: [
            Information(title: "Hello", color: Color.orange),
            Information(title: "world", color: Color.blue)
        ],
        YearMonthDay.current.addDay(value: 3): [
            Information(title: "Test", color: Color.pink)
        ], 
        YearMonthDay.current.addDay(value: 8): [
            Information(title: "Jack", color: Color.red)
        ], 
        YearMonthDay.current.addDay(value: 13): [
            Information(title: "Home", color: Color.yellow)
        ], 
        YearMonthDay.current.addDay(value: -10): [
            Information(title: "Baseball", color: Color.green)
        ]
    ]    
}
