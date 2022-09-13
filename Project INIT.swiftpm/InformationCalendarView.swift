import SwiftUI
import SwiftUICalendar

struct InformationCalendarView: View {
    @ObservedObject var controller = CalendarController()
    var informations = [YearMonthDay: [(String, Color)]]()
    @State var focusDate: YearMonthDay? = nil
    @State var focusInfo: [(String, Color)]? = nil
    
    init() {
        var date = YearMonthDay.current
        informations[date] = []
        informations[date]?.append(("Hello", Color.orange))
        informations[date]?.append(("World", Color.blue))
        
        date = date.addDay(value: 3)
        informations[date] = []
        informations[date]?.append(("Test", Color.pink))
        
        date = date.addDay(value: 8)
        informations[date] = []
        informations[date]?.append(("Jack", Color.green))
        
        date = date.addDay(value: 5)
        informations[date] = []
        informations[date]?.append(("Home", Color.red))
        
        date = date.addDay(value: -23)
        informations[date] = []
        informations[date]?.append(("Meet at 8, Home", Color.purple))
        
        date = date.addDay(value: -5)
        informations[date] = []
        informations[date]?.append(("Home", Color.yellow))
        
        date = date.addDay(value: -10)
        informations[date] = []
        informations[date]?.append(("Baseball", Color.green))
    }
    
    var body: some View {
        NavigationView {
        GeometryReader { reader in
            VStack {
                HStack {
                    Text("\(String(controller.yearMonth.year))년 \(controller.yearMonth.monthShortString)")
                        .font(.system(size: 17, weight: .bold, design: .default))
                        .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 0))
                    Spacer()
                    Button(action: {
                        controller.setYearMonth(controller.yearMonth.addMonth(value: -1))
                        controller.scrollTo(controller.yearMonth)
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    })
                    Button(action: {
                        controller.scrollTo(controller.yearMonth.addMonth(value: 1))
                    }, label: {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 20))
                    })
                    
                }
                HStack(alignment: .center, spacing: 0) {
                    ForEach(0..<7, id: \.self) { i in
                        Text(DateFormatter().shortWeekdaySymbols[i])
                            .font(.system(size: 10, weight: .bold, design: .default))
                            .frame(width: reader.size.width / 7)
                    }
                }
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
                                            .fill(info.1.opacity(0.75))
                                            .frame(width: geometry.size.width, height: 4, alignment: .center)
                                            .cornerRadius(2)
                                            .opacity(date.isFocusYearMonth == true ? 1 : 0.4)
                                    } else {
                                        Text(info.0)
                                            .lineLimit(1)
                                            .foregroundColor(.white)
                                            .font(.system(size: 8, weight: .bold, design: .default))
                                            .padding(EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4))
                                            .frame(width: geometry.size.width, alignment: .center)
                                            .background(info.1.opacity(0.75))
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
                                .fill(info.1.opacity(0.75))
                                .frame(width: 12, height: 12)
                            Text(info.0)
                                .padding(.leading, 8)
                        }
                    }
                    .frame(width: reader.size.width, height: 160, alignment: .center)
                }
            }
            
        }.navigationTitle("Explore")
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
