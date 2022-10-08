import SwiftUI
import SwiftUICalendar

struct ScheduleEditor: View {
    @ObservedObject var modelData: ModelData
    @Binding var isPresented: Bool
    @Binding var schedule: Information
    
    var body: some View {
        VStack(spacing: 12) {
            List {
                TextField(text: $schedule.title, label: {
                    Text("제목")
                        .font(.title)
                        .bold()
                })
                Toggle(isOn: $schedule.isAllDay) {
                    Text("종일")
                        .bold()
                }
                /*
                VStack(alignment: .leading, spacing: 20) {
                    Text("Seasonal Photo").bold()
                    
                    Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                        ForEach(Profile.Season.allCases) { season in
                            Text(season.rawValue).tag(season)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                 */
                DatePicker(selection: $schedule.startDate, displayedComponents: .date) {
                    Text("Goal Date").bold()
                }
            }
        }
    }
}

struct ScheduleEditor_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleEditor(modelData: ModelData(), isPresented: .constant(true), schedule: .constant(ModelData().informations[0]))
    }
}
