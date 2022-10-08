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
    
    @State var isAddingNewInfo: Bool = false
    @State var newInfo = Information(endDate: Date())
    var basicDate: Date {
        var day = YearMonthDay.current
        if let focusDate = self.focusDate {
            day = focusDate
        }
        return day.toDate()
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { reader in
                VStack {
                    CalendarMonthHeader(controller: controller, focusDate: $focusDate, focusInfo: $focusInfo)
                    
                    CalendarDayHeader()
                    
                    CalendarGrid(modelData: modelData, controller: controller, focusDate: $focusDate, focusInfo: $focusInfo, informationSet: informationSet, isAddingNewInfo: $isAddingNewInfo)
                    
                    if let infos = focusInfo {
                        InfoList(infos: infos)
                            .frame(width: reader.size.width, height: reader.size.height/4, alignment: .center)
                    }
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(leading: Text("Explore").font(.system(size: 25, weight: .bold, design: .default)))
                .overlay(alignment: .bottomTrailing){
                    AddButton(addPage: $isAddingNewInfo, newInfo: $newInfo, basicDate: basicDate)
                        .padding(20)
                }
                .sheet(isPresented: $isAddingNewInfo) {
                    ScheduleEditor(modelData: modelData, isPresented: $isAddingNewInfo, schedule: $newInfo)
                }
            }
            
        }
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
