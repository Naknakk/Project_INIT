import SwiftUI

struct CalendarCell: View {
    @EnvironmentObject var dateHolder: DateHolder
    let count: Int
    let startingSpaces: Int
    let daysInMonth: Int
    let daysInPrevMonth: Int
    
    var body: some View {
        Text(monthStrunct().day())
            .foregroundColor(textColor(type: monthStrunct().monthType))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func textColor(type: MonthType) -> Color {
        return type == MonthType.current ? Color.black : Color.gray
    }
    func monthStrunct() -> MonthStruct {
        let start = startingSpaces == 0 ? startingSpaces + 7 : startingSpaces
        if count <= start {
            let day = daysInPrevMonth + count - start
            return MonthStruct(monthType: MonthType.previous, dayInt: day)
        } else if (count - start) > daysInMonth {
            let day = count - start - daysInMonth
            return MonthStruct(monthType: MonthType.next, dayInt: day)
        }
        let day = count - start
        return MonthStruct(monthType: MonthType.current, dayInt: day)
    }
}

struct CalendarCell_Previews: PreviewProvider {
    static var previews: some View {
        let dateHolder = DateHolder()
        CalendarCell(count: 3, startingSpaces: 1, daysInMonth: 1, daysInPrevMonth: 1)
            .environmentObject(dateHolder)
    }
}
