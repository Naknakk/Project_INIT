import SwiftUI
import SwiftUICalendar

struct CalendarMonthHeader: View {
    @ObservedObject var controller = CalendarController()
    
    var body: some View {
        HStack {
            Text("\(String(controller.yearMonth.year))년 \(controller.yearMonth.monthShortString)")
                .font(.system(size: 17, weight: .bold, design: .default))
                .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 0))
            Spacer()
            Button(
                action: {
                controller.setYearMonth(controller.yearMonth.addMonth(value: -1))
                },
                   label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            })
            Button(
                action: {
                controller.setYearMonth(controller.yearMonth.addMonth(value: 1))
            }, 
                   label: {
                Image(systemName: "chevron.right")
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 20))
            })
            
        }
        
    }
}

struct MonthControlRow_Previews: PreviewProvider {
    static var previews: some View {
        CalendarMonthHeader(controller: CalendarController())
    }
}
