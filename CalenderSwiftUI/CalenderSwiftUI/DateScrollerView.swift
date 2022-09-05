//
//  DateScrollerView.swift
//  CalenderSwiftUI
//
//  Created by 이윤학 on 2022/09/02.
//

import SwiftUI

struct DateScrollerView: View {
    @EnvironmentObject var dateHolder: DateHolder
    var body: some View {
        HStack {
            Spacer()
            Button(action: previousMonth) {
                Image(systemName: "arrow.left")
                    .font(Font.title.weight(.bold))
            }
            Text(CalenderHelper().monthYearString(dateHolder.date))
                .font(.title)
                .bold()
                .animation(.none)
                .frame(maxWidth: .infinity)
            Button(action: nextMonth) {
                Image(systemName: "arrow.right")
                    .font(Font.title.weight(.bold))
            }
            Spacer()
            
        }
        
    }
    func previousMonth() {
        dateHolder.date = CalenderHelper().minusMonth(dateHolder.date)
    }
    func nextMonth() {
        dateHolder.date = CalenderHelper().plusMonth(dateHolder.date)
    }
}

struct DateScrollerView_Previews: PreviewProvider {
    static var previews: some View {
        DateScrollerView()
    }
}
