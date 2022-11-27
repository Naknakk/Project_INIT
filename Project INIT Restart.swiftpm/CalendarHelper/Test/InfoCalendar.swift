
import SwiftUI

struct InfoCalendar: View {
    @EnvironmentObject var modelData: ModelData
    @ObservedObject var controller: CalendarController
    @State var focusDate: YearMonthDay? = nil
    @State var focusInfo: [Information]? = nil
    @State var showingMonthSelector: Bool = false
    @State var yearMonth: YearMonth
    var pages = [0]
    
    var body: some View {
        let yearMonths = pages.map{controller.yearMonth.addMonth(value: $0)}
        
        NavigationView {
            GeometryReader {reader in 
                VStack {
                    TestCalendarMonthHeader(controller: controller, showingMonthSelector: false, focusDate: $focusDate, focusInfo: $focusInfo)
                    
                    CalendarDayHeader()
                    
                    PageView(pages: yearMonths.map {
                        CalendarGrid(controller: controller, focusDate: $focusDate, focusInfo: $focusInfo, yearMonth: $0)
                    })
                    
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
        InfoCalendar(controller: CalendarController(), yearMonth: YearMonth(year: 2022, month: 12))
            .environmentObject(ModelData())
    }
}

