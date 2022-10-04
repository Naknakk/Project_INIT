import SwiftUI
import SwiftUICalendar

struct CalendarMonthHeader: View {
    @ObservedObject var controller: CalendarController
    
    @Binding var focusDate: YearMonthDay?
    @Binding var focusInfo: [Information]?
    
    var body: some View {
        HStack(spacing: 17) {
            Text("\(String(controller.yearMonth.year))년 \(controller.yearMonth.monthShortString)")
                .font(.system(size: 17, weight: .bold, design: .default))
                .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 0))
            Spacer()
            Button(
                action: {
                    withAnimation{
                        focusDate = nil
                        focusInfo = nil
                    }
                    controller.scrollTo(YearMonth.current)
                },
                label: {Image(systemName: "goforward.5.ar")
                        .foregroundColor(.black)
                }
            )
            Button(
                action: {
                    controller.setYearMonth(controller.yearMonth.addMonth(value: -1))
                },
                label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
            )
            Button(
                action: {
                    controller.setYearMonth(controller.yearMonth.addMonth(value: 1))
                }, 
                label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                        
                }
            ).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
        }
        
    }
}

struct MonthControlRow_Previews: PreviewProvider {
    static var previews: some View {
        CalendarMonthHeader(controller: CalendarController(), focusDate: .constant(nil), focusInfo: .constant(nil))
    }
}
