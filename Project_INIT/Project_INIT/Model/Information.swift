//
//  Information.swift
//  Project_INIT
//
//  Created by 이윤학 on 2022/09/17.
//
import SwiftUI
import SwiftUICalendar

struct Information: Hashable, Identifiable {
    var id: UUID
    
    var title: String
    var color: Color
    
    var date: YearMonthDay
    var month: YearMonth {
        YearMonth(year: self.date.year, month: self.date.month)
    }
}

