import SwiftUI

struct TestCalendarMonthHeader: View {
    @ObservedObject var controller: CalendarController
    @State var showingMonthSelector: Bool = false
    
    @Binding var focusDate: YearMonthDay?
    @Binding var focusInfo: [Information]?
    
    var body: some View {
        HStack(spacing: 17) {
            
            // display year&month
            Button(
                action: {
                    showingMonthSelector.toggle()
                },
                label: {
                    Text("\(String(controller.yearMonth.year))년 \(controller.yearMonth.monthShortString)")
                        .font(.system(size: 17, weight: .bold, design: .default))
                        .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 0))
                        .foregroundColor(.black)
                }
            ).popover(
                isPresented: $showingMonthSelector,
                attachmentAnchor: .rect(.bounds),
                arrowEdge: .top,
                content: {
                    popoverContents()
            })
            
            
            Spacer()
            
            // reset button
            Button(        
                action: {
                    withAnimation{
                        focusDate = nil
                        focusInfo = nil
                    }
                    controller.scrollTo(YearMonth.current)
                },
                label: {
                    Image(systemName: "goforward.5.ar")
                        .foregroundColor(.black)
                }
            )
            
            // lastMonth Button
            Button(
                action: {
                    controller.setYearMonth(controller.yearMonth.addMonth(value: -1))
                },
                label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
            )
            
            // nextMonth Button
            Button(
                action: {
                    controller.setYearMonth(controller.yearMonth.addMonth(value: 1))
                }, 
                label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                    
                }
            )
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
        }
        
    }
    // 수저ㅇ피ㄹ요
    func popoverContents() -> some View {
        VStack(alignment: .leading) {
            DatePicker(selection: $controller.date, displayedComponents: .date) {
                Text("시작").bold()
            }.datePickerStyle(.graphical)
        }
    }
}

struct TestCalendarMonthHeader_Previews: PreviewProvider {
    static var previews: some View {
        CalendarMonthHeader(controller: CalendarController(), focusDate: .constant(nil), focusInfo: .constant(nil))
    }
}
