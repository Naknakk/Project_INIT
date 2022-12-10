import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @ObservedObject var controller: CalendarController
    @State private var currentPage = 2
    
    var body: some View {
        ZStack {
            PageViewController(pages: pages, calendarController: controller, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
                .hidden()
            
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: [
            CalendarGrid(controller: CalendarController(), focusDate: .constant(nil), focusInfo: .constant(nil), yearMonth: YearMonth(year: 2022, month: 10)).environmentObject(ModelData()),
            CalendarGrid(controller: CalendarController(), focusDate: .constant(nil), focusInfo: .constant(nil), yearMonth: YearMonth(year: 2022, month: 11)).environmentObject(ModelData()),
            CalendarGrid(controller: CalendarController(), focusDate: .constant(nil), focusInfo: .constant(nil), yearMonth: YearMonth(year: 2022, month: 12)).environmentObject(ModelData())
        ], controller: CalendarController())
    }
}
