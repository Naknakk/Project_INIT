import SwiftUI

struct CalendarGrid: View {
    @EnvironmentObject var modelData: ModelData
    @ObservedObject var controller: CalendarController
    @Binding var focusDate: YearMonthDay?
    @Binding var focusInfo: [Information]?
    let yearMonth: YearMonth
    
    var body: some View {
        let informationSet = modelData.informationSet
        TestCalendarView(controller, yearMonth: yearMonth, component: { date in
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
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 1.5) {
                                ForEach(infos.indices) { index in
                                    let info = infos[index]
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
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
                .border(.green.opacity(0.8), width: (focusDate == date ? 1 : 0))
                .cornerRadius(2)
                .contentShape(Rectangle())
                .onTapGesture {
                    if focusDate == date {
                       // isAddingNewInfo = true
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

struct CalendarGrid_Previews: PreviewProvider {
    static var previews: some View {
        CalendarGrid(controller: CalendarController(), focusDate: .constant(nil), focusInfo: .constant(nil), yearMonth: YearMonth(year: 2022, month: 10))
            .environmentObject(ModelData())
    }
}

extension Text {
    static func getColor(_ date: YearMonthDay) -> Color {
        if date.dayOfWeek == .sun {
            return Color.red
        } else if date.dayOfWeek == .sat {
            return Color.blue
        } else {
            return Color.black
        }
    }
    func todayFont()-> some View {
        return self.font(.system(size: 10, weight: .semibold, design: .default))
            .padding(4)
            .foregroundColor(.white)
            .background(Color.red.opacity(0.95))
            .cornerRadius(14)
    }
    
}
