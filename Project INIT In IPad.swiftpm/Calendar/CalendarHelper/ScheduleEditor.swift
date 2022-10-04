import SwiftUI
import SwiftUICalendar

struct ScheduleEditor: View {
    @ObservedObject var modelData: ModelData
    @Binding var isPresented: Bool
    var focusDate: YearMonthDay?
    var internalfocusDate: YearMonthDay {
        var day = YearMonthDay.current
        if let focusDate = self.focusDate {
            day = focusDate
        }
        return day
    }
    var body: some View {
        VStack(spacing: 12) {
            
            
            Text("\(internalfocusDate.day)")
        }
    }
}

struct ScheduleEditor_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleEditor(modelData: ModelData(), isPresented: .constant(true), focusDate: YearMonthDay(year: 2022, month: 10, day: 5))
    }
}
