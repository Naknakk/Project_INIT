import SwiftUI

public extension Date {
    func add(component: Calendar.Component, value: Int) -> Date {
        return Calendar.current.date(byAdding: component, value: value, to: self)!
    }
    
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    var endOfDay: Date {
        return self.set(hour: 23, minute: 59, second: 59)
    }
    
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    static func daysBetween(start: Date, end: Date, ignoreHours: Bool) -> Int {
        let startDate = ignoreHours ? start.startOfDay : start
        let endDate = ignoreHours ? end.startOfDay : end
        return Calendar.current.dateComponents([.day], from: startDate, to: endDate).day!
    }
    
    /// return difference time of second
    static func timeBetween(start: Date, end: Date, ignoreDate: Bool) -> Int {
        if ignoreDate {
            let d = (start.hour*3600) + (start.minute*60) + start.second
            let c = (end.hour*3600) + (end.minute*60) + end.second
            return c - d
        }
        return Calendar.current.dateComponents([.second], from: start, to: end).second!
    }
    
    static let components: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second, .weekday]
    private var dateComponents: DateComponents {
        return  Calendar.current.dateComponents(Date.components, from: self)
    }
    
    var year: Int { return dateComponents.year! }
    var month: Int { return dateComponents.month! }
    var day: Int { return dateComponents.day! }
    var hour: Int { return dateComponents.hour! }
    var minute: Int { return dateComponents.minute! }
    var second: Int { return dateComponents.second! }
    var weekday: Int { return dateComponents.weekday! }
    
    func getDayOfWeek() -> WeekDay {
        let weekDayNum = Calendar.current.component(.weekday, from: self)
        let weekDay = WeekDay(rawValue: weekDayNum)!
        return weekDay
    }
    
    func set(year: Int?=nil, month: Int?=nil, day: Int?=nil, hour: Int?=nil, minute: Int?=nil, second: Int?=nil, tz: String?=nil) -> Date {
        let timeZone = Calendar.current.timeZone
        let year = year ?? self.year
        let month = month ?? self.month
        let day = day ?? self.day
        let hour = hour ?? self.hour
        let minute = minute ?? self.minute
        let second = second ?? self.second
        let dateComponents = DateComponents(timeZone: timeZone, year: year, month: month, day: day, hour: hour, minute: minute, second: second)
        let date = Calendar.current.date(from: dateComponents)
        return date!
    }
    
    func toYearMonthDay() -> YearMonthDay{
        let year = self.year
        let month = self.month
        let day = self.day
        
        return YearMonthDay(year: year, month: month, day: day)
    }
    func toYearMonth() -> YearMonth{
        let year = self.year
        let month = self.month
        
        return YearMonth(year: year, month: month)
    }
}

public enum WeekDay: Int {
    case Sunday = 1, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
}
