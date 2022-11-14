import SwiftUI

extension YearMonthDay: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(year)
        hasher.combine(month)
        hasher.combine(day)
    }
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        return (lhs.year, lhs.month, lhs.day) < (rhs.year, rhs.month, rhs.day)
    }
    static func > (lhs: Self, rhs: Self) -> Bool {
        return (lhs.year, lhs.month, lhs.day) > (rhs.year, rhs.month, rhs.day)
    }
    static func <= (lhs: Self, rhs: Self) -> Bool {
        return (lhs.year, lhs.month, lhs.day) <= (rhs.year, rhs.month, rhs.day)
    }
    static func >= (lhs: Self, rhs: Self) -> Bool {
        return (lhs.year, lhs.month, lhs.day) >= (rhs.year, rhs.month, rhs.day)
    }
    
    func toDate() -> Date {
        let date = Date().set(year: self.year, month: self.month, day: self.day)
        return date
    }
    
}
