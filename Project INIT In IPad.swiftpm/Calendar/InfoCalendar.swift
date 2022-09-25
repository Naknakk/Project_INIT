//
//  InformationCalendarView.swift
//  Project_INIT
//
//  Created by 이윤학 on 2022/09/17.
//
import SwiftUI
import SwiftUICalendar

struct InfoCalendar: View {
    @ObservedObject var modelData: ModelData
    @ObservedObject var controller: CalendarController
    @State var focusDate: YearMonthDay? = nil
    @State var focusInfo: [Information]? = nil
    @State var toggle = false
    var informations: [YearMonthDay: [Information]] {
        var informations = [YearMonthDay: [Information]]()
        for information in self.modelData.informations {
            if informations.keys.contains(information.date) {
                informations[information.date]?
                    .append(information)
            } else {
                informations[information.date] = [information]
            }
        }
        return informations
    }
    
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
                                        .todayFont(size: 10)
                                } else {
                                    Text("\(date.day)")
                                        .font(.system(size: 10, weight: .light, design: .default))
                                        .opacity(date.isFocusYearMonth == true ? 1 : 0.4)
                                        .foregroundColor(getColor(date))
                                        .padding(4)
                                }
                                if let infos = informations[date] {
                                    ScrollView(showsIndicators: false) {
                                        VStack(spacing: 2) {
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
                        InfoList(infos: infos)
                        .frame(width: reader.size.width, height: 160, alignment: .center)
                    }
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(leading: Text("Explore").font(.system(size: 25, weight: .bold, design: .default)))
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

extension Text {
    func todayFont(size: CGFloat) -> some View {
        return self.font(.system(size: size, weight: .semibold, design: .default))
            .padding(4)
            .foregroundColor(.white)
            .background(Color.red.opacity(0.95))
            .cornerRadius(14)
    }
}
