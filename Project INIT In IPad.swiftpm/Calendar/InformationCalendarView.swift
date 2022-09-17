import SwiftUI
import SwiftUICalendar

struct InformationCalendarView: View {
    @ObservedObject var modelData: ModelData
    @ObservedObject var controller: CalendarController
    var informations: [YearMonthDay: [Information]] {
        var informations = [YearMonthDay: [Information]]()
        for information in self.modelData.informations {
            if informations.keys.contains(information.date) {
                informations[information.date]?.append(information)
            } else {
                informations[information.date] = [information]
            }
        }
        return informations
    }
    @State var focusDate: YearMonthDay? = nil
    @State var focusInfo: [Information]? = nil
    
    /*
    init(modelData: ModelData, controller: CalendarController) {
        self.modelData = modelData
        self.controller = controller
        /* filtered Information Initiation
        let monthUnderbound = controller.yearMonth.addMonth(value: -5)
        let monthUpperBound = controller.yearMonth.addMonth(value: 5)
        let filteredInformations = self.modelData.informations.filter{monthUnderbound < $0.month && $0.month < monthUpperBound }
        
        for information in filteredInformations {
            if informations.keys.contains(information.date) {
                informations[information.date]?.append(information)
            } else {
                informations[information.date] = [information]
            }
        }
         */
        
        /* non filtered Information Initiation
        for information in self.modelData.informations {
            if informations.keys.contains(information.date) {
                informations[information.date]?.append(information)
            } else {
                informations[information.date] = [information]
            }
        }
         */
    }
     */
    
    var body: some View {
        NavigationView {
            GeometryReader { reader in
                VStack {
                    CalendarMonthHeader(controller: controller)
                    CalendarDayHeader()
                    CalendarView(controller, component: { date in
                        GeometryReader { geometry in
                            VStack(alignment: .leading, spacing: 2) {
                                if date.isToday {
                                    Text("\(date.day)")
                                        .font(.system(size: 10, weight: .bold, design: .default))
                                        .padding(4)
                                        .foregroundColor(.white)
                                        .background(Color.red.opacity(0.95))
                                        .cornerRadius(14)
                                } else {
                                    Text("\(date.day)")
                                        .font(.system(size: 10, weight: .light, design: .default))
                                        .opacity(date.isFocusYearMonth == true ? 1 : 0.4)
                                        .foregroundColor(getColor(date))
                                        .padding(4)
                                }
                                if let infos = informations[date] {
                                    ForEach(infos.indices) { index in
                                        let info = infos[index]
                                        if focusInfo != nil {
                                            Rectangle()
                                                .fill(info.color.opacity(0.75))
                                                .frame(width: geometry.size.width, height: 4, alignment: .center)
                                                .cornerRadius(2)
                                                .opacity(date.isFocusYearMonth == true ? 1 : 0.4)
                                        } else {
                                            Text(info.title)
                                                .lineLimit(1)
                                                .foregroundColor(.white)
                                                .font(.system(size: 8, weight: .bold, design: .default))
                                                .padding(EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4))
                                                .frame(width: geometry.size.width, alignment: .center)
                                                .background(info.color.opacity(0.75))
                                                .cornerRadius(4)
                                                .opacity(date.isFocusYearMonth == true ? 1 : 0.4)
                                        }
                                    }
                                }
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
                            .border(.green.opacity(0.8), width: (focusDate == date ? 1 : 0))
                            .cornerRadius(2)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation {
                                    if focusDate == date {
                                        focusDate = nil
                                        focusInfo = nil
                                    } else {
                                        focusDate = date
                                        focusInfo = informations[date]
                                    }
                                }
                            }
                        }
                    })
                    if let infos = focusInfo {
                        List(infos.indices, id: \.self) { index in
                            let info = infos[index]
                            HStack(alignment: .center, spacing: 0) {
                                Circle()
                                    .fill(info.color.opacity(0.75))
                                    .frame(width: 12, height: 12)
                                Text(info.title)
                                    .padding(.leading, 8)
                            }
                        }
                        .frame(width: reader.size.width, height: 160, alignment: .center)
                    }
                }  
                .navigationBarTitle("Explore", displayMode: .inline)
            }
            
        }
    }
    
    private func getColor(_ date: YearMonthDay) -> Color {
        if date.dayOfWeek == .sun {
            return Color.red
        } else if date.dayOfWeek == .sat {
            return Color.blue
        } else {
            return Color.black
        }
    }
}
