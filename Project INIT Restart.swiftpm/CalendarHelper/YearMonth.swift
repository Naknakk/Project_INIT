import SwiftUI

extension YearMonth: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(year)
        hasher.combine(month)
    }
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        return (lhs.year, lhs.month) < (rhs.year, rhs.month)
    }
    static func > (lhs: Self, rhs: Self) -> Bool {
        return (lhs.year, lhs.month) > (rhs.year, rhs.month)
    }
}
