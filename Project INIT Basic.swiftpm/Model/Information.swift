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
