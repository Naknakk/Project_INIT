import SwiftUI
import SwiftUICalendar


extension YearMonthDay: Hashable {
    static func == (lhs: YearMonthDay, rhs: YearMonthDay) -> Bool {
        return lhs.year == rhs.year && lhs.month == rhs.month && lhs.day == rhs.day
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(year)
        hasher.combine(month)
        hasher.combine(day)
    }
}
