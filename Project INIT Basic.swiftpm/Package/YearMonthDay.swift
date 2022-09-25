import SwiftUI
import SwiftUICalendar


extension YearMonthDay: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(year)
        hasher.combine(month)
        hasher.combine(day)
    }
    
    static func == (lhs: YearMonthDay, rhs: YearMonthDay) -> Bool {
        return lhs.year == rhs.year && lhs.month == rhs.month && lhs.day == rhs.day
    }
    static func < (lhs: YearMonthDay, rhs: YearMonthDay) -> Bool {
        return (lhs.year, lhs.month, lhs.day) < (rhs.year, rhs.month, lhs.day)
    }
    static func > (lhs: YearMonthDay, rhs: YearMonthDay) -> Bool {
        return (lhs.year, lhs.month, lhs.day) > (rhs.year, rhs.month, lhs.day)
    }
}

