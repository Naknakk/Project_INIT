
import SwiftUI

struct InfoCalendar: View {
    @EnvironmentObject var modelData: ModelData
    @ObservedObject var controller: CalendarController
    @State var focusDate: YearMonthDay? = nil
    @State var focusInfo: [Information]? = nil
    @State var showingMonthSelector: Bool = false
    
    var body: some View {
        let pages = [-2, -1, 0, 1, 2]
        let yearMonths = pages.map{controller.yearMonth.addMonth(value: $0)}
        
        NavigationView {
            GeometryReader {reader in 
                VStack {
                    TestCalendarMonthHeader(controller: controller, showingMonthSelector: false, focusDate: $focusDate, focusInfo: $focusInfo)
                    
                    CalendarDayHeader()
                    
                    PageView(pages: pages.map {
                        CalendarGrid(controller: controller, focusDate: $focusDate, focusInfo: $focusInfo, yearMonth: controller.yearMonth.addMonth(value: $0))
                    }, controller: controller)
                    
                   // CalendarGrid(controller: controller, focusDate: $focusDate, focusInfo: $focusInfo, yearMonth: yearMonth)
                    
                    if let infos = focusInfo {
                        InfoList(infos: infos)
                            .frame(width: reader.size.width, height: reader.size.height/4, alignment: .center)
                        
                    }
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(leading: Text("Explore").font(.system(size: 25, weight: .bold, design: .default)))
                
            }
            
            
        }
    }
    
}

struct InfoCalendaer_Previews: PreviewProvider {
    static var previews: some View {
        InfoCalendar(controller: CalendarController())
            .environmentObject(ModelData())
    }
}

