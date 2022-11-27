import SwiftUI
struct WeeklyCalendarView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Weekly Calendar View")
            }
            .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(leading: Text("Weekly").font(.system(size: 25, weight: .bold, design: .default)))
        }
    }
}

struct WeeklyCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyCalendarView()
    }
}
