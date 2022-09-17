//
//  YearMonth.swift
//  Project_INIT
//
//  Created by 이윤학 on 2022/09/17.
//
import SwiftUI
import SwiftUICalendar

extension YearMonth: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(year)
        hasher.combine(month)
    }
    
    static func < (lhs: YearMonth, rhs: YearMonth) -> Bool {
        return (lhs.year, lhs.month) < (rhs.year, rhs.month)
    }
    static func > (lhs: YearMonth, rhs: YearMonth) -> Bool {
        return (lhs.year, lhs.month) > (rhs.year, rhs.month)
    }
}

struct Previews_YearMonth_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
