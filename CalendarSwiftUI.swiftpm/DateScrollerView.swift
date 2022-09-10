import SwiftUI

struct DateScrollerView : View {
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: previousMonth) {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .font(Font.title.weight(.bold))
            }
            Text(CalendarHelper().monthYearString(dateHolder.date))
                .font(.title)
                .bold()
                .animation(.none)
                .frame(maxWidth: .infinity)
            Button(action: nextMonth) {
                Image(systemName: "arrow.right")
                    .imageScale(.large)
                    .font(Font.title.weight(.bold))
            }
            Spacer()
        }
    }
}

extension DateScrollerView {
    func previousMonth() {
        dateHolder.date = CalendarHelper().minusMonth(dateHolder.date)
    }
    func nextMonth() {
        dateHolder.date = CalendarHelper().plusMonth(dateHolder.date)
        print(CalendarHelper().weekDay(dateHolder.date))
    }
}

struct DateScrollerView_Previews: PreviewProvider {
    @EnvironmentObject var dateHolder: DateHolder
    static var previews: some View {
        let dateHolder = DateHolder()
        DateScrollerView()
            .environmentObject(dateHolder)
    }
}
