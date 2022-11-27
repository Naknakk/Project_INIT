import SwiftUI
import Foundation

public struct YearMonthDay: Equatable {
    public let year: Int
    public let month: Int
    public let day: Int
    public let isFocusYearMonth: Bool?
    
    public init(year: Int, month: Int, day: Int) {
        self.year = year
        self.month = month
        self.day = day
        self.isFocusYearMonth = nil
    }
    
    public init(year: Int, month: Int, day: Int, isFocusYearMonth: Bool) {
        self.year = year
        self.month = month
        self.day = day
        self.isFocusYearMonth = isFocusYearMonth
    }
    
    public static var current: YearMonthDay {
        get {
            let today = Date()
            return YearMonthDay(
                year: Calendar.current.component(.year, from: today),
                month: Calendar.current.component(.month, from: today),
                day: Calendar.current.component(.day, from: today)
            )
        }
    }
    
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.year == rhs.year && lhs.month == rhs.month && lhs.day == rhs.day
    }
    
    public var isToday: Bool {
        let today = Date()
        let year = Calendar.current.component(.year, from: today)
        let month = Calendar.current.component(.month, from: today)
        let day = Calendar.current.component(.day, from: today)
        return self.year == year && self.month == month && self.day == day
    }
    
    public var dayOfWeek: Week {
        let weekday = Calendar.current.component(.weekday, from: self.date!)
        return Week.allCases[weekday - 1]
    }
    
    public var date: Date? {
        let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)!
        return gregorianCalendar.date(from: self.toDateComponents())
    }
    
    public func toDateComponents() -> DateComponents {
        var components = DateComponents()
        components.year = self.year
        components.month = self.month
        components.day = self.day
        return components
    }
    
    public func addDay(value: Int) -> YearMonthDay {
        let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)!
        let toDate = self.toDateComponents()
        
        var components = DateComponents()
        components.day = value
        
        let addedDate = Calendar.current.date(byAdding: components, to: gregorianCalendar.date(from: toDate)!)!
        let ret = YearMonthDay(
            year: Calendar.current.component(.year, from: addedDate),
            month: Calendar.current.component(.month, from: addedDate),
            day: Calendar.current.component(.day, from: addedDate)
        )
        return ret
    }
    
    public func diffDay(value: YearMonthDay) -> Int {
        var origin = self.toDateComponents()
        origin.hour = 0
        origin.minute = 0
        origin.second = 0
        var new = value.toDateComponents()
        new.hour = 0
        new.minute = 0
        new.second = 0
        return Calendar.current.dateComponents([.day], from: Calendar.current.date(from: origin)!, to: Calendar.current.date(from: new)!).month!
    }
}


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
