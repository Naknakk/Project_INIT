import SwiftUI
import SwiftUICalendar

struct CalendarDayHeader: View {
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(0..<7, id: \.self) { i in
                Text(DateFormatter().shortWeekdaySymbols[i])
                    .font(.system(size: 10, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

struct DayOfWeekHeader_Previews: PreviewProvider {
    static var previews: some View {
        CalendarDayHeader()
    }
}

