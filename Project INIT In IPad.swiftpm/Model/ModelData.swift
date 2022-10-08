//
//  ModelData.swift
//  Project_INIT
//
//  Created by 이윤학 on 2022/09/17.
//
import Foundation
import SwiftUICalendar
import Combine

public class ModelData: ObservableObject {
    @Published var informations: [Information] = [
        Information(title: "Long Schedule", color: .black, startDate: Date().set(year: 2022, month: 9, day: 30, hour: 3, minute: 5), endDate: Date().set(year: 2022, month: 10, day: 2, hour: 3, minute: 50)),
        /*Information(id: UUID(), title: "Hello", color: .orange, date: YearMonthDay(year: 2022, month: 9, day: 16)),
        Information(id: UUID(), title: "World", color: .blue, date: YearMonthDay(year: 2022, month: 9, day: 16)),
        Information(id: UUID(), title: "Today", color: .red, date: YearMonthDay(year: 2022, month: 9, day: 16)),
        Information(id: UUID(), title: "Is", color: .green, date: YearMonthDay(year: 2022, month: 9, day: 16)),
        Information(id: UUID(), title: "Veeeery", color: .yellow, date: YearMonthDay(year: 2022, month: 9, day: 16)),
        Information(id: UUID(), title: "Busy", color: .brown, date: YearMonthDay(year: 2022, month: 9, day: 16)),
        Information(id: UUID(), title: "Day", color: .purple, date: YearMonthDay(year: 2022, month: 9, day: 16)),
        Information(id: UUID(), title: "Test", color: .pink, date: YearMonthDay(year: 2022, month: 9, day: 19)),
        Information(id: UUID(), title: "Happy Day Wow Long Too Long", color: .blue, date: YearMonthDay(year: 2022, month: 8, day: 31)),
        Information(id: UUID(), title: "Test", color: .blue, date: YearMonthDay(year: 2022, month: 7, day: 16)),
        Information(id: UUID(), title: "Pepero Day", color: .blue, date: YearMonthDay(year: 2022, month: 11, day: 11)),
        Information(id: UUID(), title: "Christmas", color: .blue, date: YearMonthDay(year: 2022, month: 12, day: 25)),
        Information(id: UUID(), title: "Balentein", color: .blue, date: YearMonthDay(year: 2023, month: 2, day: 14)),
        Information(id: UUID(), title: "OpenSky", color: .blue, date: YearMonthDay(year: 2022, month: 10, day: 1))
         */
    ].sorted(by: {$0.startDate.toYearMonthDay() < $1.startDate.toYearMonthDay()})
}


