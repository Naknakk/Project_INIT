import SwiftUI
import SwiftUICalendar

struct InfoList: View {
    var infos: [Information]
    @State var toggle = false
    @State var selection: Int = 0
    var body: some View {
        List(infos.indices, id: \.self) { index in
            let info = infos[index]
            Button {
                selection = index
                toggle.toggle()
                print(info.title)
                print(toggle)
            } label: {
                HStack(alignment: .center, spacing: 0) {
                    Circle()
                        .fill(info.color.opacity(0.75))
                        .frame(width: 12, height: 12)
                    Text(info.title)
                        .padding(.leading, 8)
                }
            }
        }.sheet(isPresented: $toggle) {
            InfoDetail(info: infos[selection])
        }
    }
}
/*
struct InformationListView_Previews: PreviewProvider {
    static var previews: some View {
        InfoList(infos: ModelData().informations, toggle: )
    }
}
 */
