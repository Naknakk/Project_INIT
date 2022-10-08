import SwiftUI
import SwiftUICalendar

struct Information: Hashable, Identifiable {
    var id = UUID()
    
    var title: String = ""
    var color: Color = .black
    
    var startDate: Date = Date()
    var endDate: Date

    var dates: [YearMonthDay] {
        dateInterval(startDate, endDate)
    }
    var interval: Int {
        dateInterval(startDate, endDate).count
    }
    var isAllDay: Bool = false
}

extension Information {
    
    /** Caculate interval between startDate and endDate. */
    private func dateInterval(_ startDate: Date, _ endDate: Date) -> [YearMonthDay] {
        let startYMD = startDate.toYearMonthDay()
        let endYMD = endDate.toYearMonthDay()
        var dates = [startYMD]
        var nextDate = startDate.add(component: .day, value: 1)
        var nextYMD = nextDate.toYearMonthDay()

        while (endYMD >= nextYMD) {
            dates.append(nextYMD)
            nextDate = nextDate.add(component: .day, value: 1)
            nextYMD = nextDate.toYearMonthDay()
        }
        
        return dates
    }
}
