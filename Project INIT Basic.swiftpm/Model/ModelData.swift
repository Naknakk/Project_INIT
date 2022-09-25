import Foundation
import SwiftUICalendar
import Combine

public class ModelData: ObservableObject {
    @Published var informations: [Information] = [
        Information(id: UUID(), title: "Hello", color: .orange, date: YearMonthDay(year: 2022, month: 9, day: 16)),
        Information(id: UUID(), title: "World", color: .blue, date: YearMonthDay(year: 2022, month: 9, day: 16)),
        Information(id: UUID(), title: "Test", color: .pink, date: YearMonthDay(year: 2022, month: 9, day: 19)),
        Information(id: UUID(), title: "Happy Day Wow Long Too Long", color: .blue, date: YearMonthDay(year: 2022, month: 8, day: 31)),
        Information(id: UUID(), title: "Birthday", color: .blue, date: YearMonthDay(year: 2022, month: 7, day: 16)),
        Information(id: UUID(), title: "Pepero Day", color: .blue, date: YearMonthDay(year: 2022, month: 11, day: 11)),
        Information(id: UUID(), title: "Christmas", color: .blue, date: YearMonthDay(year: 2022, month: 12, day: 25)),
        Information(id: UUID(), title: "Balentein", color: .blue, date: YearMonthDay(year: 2023, month: 2, day: 14)),
        Information(id: UUID(), title: "OpenSky", color: .blue, date: YearMonthDay(year: 2022, month: 10, day: 1))
    ].sorted(by: {$0.date < $1.date})
}

