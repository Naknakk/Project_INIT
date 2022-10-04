//
//  InformationCalendarView.swift
//  Project_INIT
//
//  Created by 이윤학 on 2022/09/17.
//
import SwiftUI
import SwiftUICalendar
import PopupView

struct InfoCalendar: View {
    @ObservedObject var modelData: ModelData
    @ObservedObject var controller: CalendarController
    @State var focusDate: YearMonthDay? = nil
    @State var focusInfo: [Information]? = nil
    @State var addPage: Bool = false
    var informationSet: [YearMonthDay: [Information]] {
        var informations = [YearMonthDay: [Information]]()
        for information in self.modelData.informations {
            for date in information.dates {
                if informations.keys.contains(date) {
                    informations[date]?
                        .append(information)
                } else {
                    informations[date] = [information]
                }
            }
        }
        return informations
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { reader in
                VStack {
                    CalendarMonthHeader(controller: controller, focusDate: $focusDate, focusInfo: $focusInfo)
                    CalendarDayHeader()
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
                                    let allDayInfos = infos.filter{ $0.isLong == true }
                                    let dailyInfos = infos.filter{ $0.isLong == false }
                                    
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
                                        addPage = true
                                    } else {
                                        focusDate = date
                                        withAnimation{
                                            focusInfo = informationSet[date]
                                        }
                                    }
                            }
                        }
                    })
                    if let infos = focusInfo {
                        InfoList(infos: infos)
                            .frame(width: reader.size.width, height: reader.size.height/4, alignment: .center)
                            .animation(.easeInOut)
                    }
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(leading: Text("Explore").font(.system(size: 25, weight: .bold, design: .default)))
                .overlay(alignment: .bottomTrailing){
                    AddButton(addPage: $addPage)
                        .padding(20)
                }
                .sheet(isPresented: $addPage) {
                    ScheduleEditor(modelData: modelData, isPresented: $addPage, focusDate: focusDate)
                }
            }
            
        }
    }
}


extension InfoCalendar {
    
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
