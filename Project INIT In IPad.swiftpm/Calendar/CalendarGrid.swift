import SwiftUI
import SwiftUICalendar

struct CalendarGrid: View {
    @ObservedObject var modelData: ModelData
    @ObservedObject var controller: CalendarController
    @Binding var focusDate: YearMonthDay?
    @Binding var focusInfo: [Information]?
    var informationSet: [YearMonthDay: [Information]]
    
    @Binding var isAddingNewInfo: Bool
    
    var body: some View {
        CalendarView(controller, component: { date in
            GeometryReader { geometry in
                VStack(alignment: .leading, spacing: 0) {
                    if date.isToday {
                        Text("\(date.day)")
                            .todayFont()
                    } else if date == focusDate {
                        Text("\(date.day)")
                            .font(.system(size: 10, weight: .heavy, design: .default))
                            .opacity(date.isFocusYearMonth == true ? 1 : 0.4)
                            .foregroundColor(Text.getColor(date))
                            .padding(4)
                    } else {
                        Text("\(date.day)")
                            .font(.system(size: 10, weight: .light, design: .default))
                            .opacity(date.isFocusYearMonth == true ? 1 : 0.4)
                            .foregroundColor(Text.getColor(date))
                            .padding(4)
                    }
                    if let infos = informationSet[date] {
                        let allDayInfos = infos.filter{ $0.isAllDay == true }
                        let dailyInfos = infos.filter{ $0.isAllDay == false }
                        
                        VStack(spacing: 1.5) {
                            VStack(spacing: 1.5) {
                                ForEach(allDayInfos.indices) { index in
                                    let info = allDayInfos[index]
                                    Text(info.title)
                                        .lineLimit(1)
                                        .foregroundColor(.white)
                                        .font(.system(size: 8, weight: .bold, design: .default))
                                        .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                                        .frame(width: geometry.size.width, alignment: .center)
                                        .background(info.color.opacity(0.75))
                                        .cornerRadius(2)
                                        .opacity(date.isFocusYearMonth == true ? 1 : 0.4)
                                }
                            }
                            ScrollView(showsIndicators: false) {
                                VStack(spacing: 1.5) {
                                    ForEach(dailyInfos.indices) { index in
                                        let info = dailyInfos[index]
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
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
                .border(.green.opacity(0.8), width: (focusDate == date ? 1 : 0))
                .cornerRadius(2)
                .contentShape(Rectangle())
                .onTapGesture {
                    if focusDate == date {
                        isAddingNewInfo = true
                    } else {
                        focusDate = date
                        withAnimation{
                            focusInfo = informationSet[date]
                        }
                    }
                }
            }
        })
    }
}

struct CalendarGrid_Previews: PreviewProvider {
    static var previews: some View {
        CalendarGrid(modelData: ModelData(), controller: CalendarController(), focusDate: .constant(nil), focusInfo: .constant(nil), informationSet: [YearMonthDay(year: 2022, month: 10, day: 9): [ModelData().informations[0]]], isAddingNewInfo: .constant(false))
    }
}
