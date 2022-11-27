import SwiftUI

struct InfoList: View {
    var infos: [Information]
    var body: some View {
        List(infos.indices, id: \.self) { index in
            let info = infos[index]
            ZStack {
                NavigationLink(destination: InfoDetail(info: info)) {
                    EmptyView()
                }.frame(width: 0).opacity(0)
                InfoRow(info: info)
            }
        }.listStyle(.insetGrouped)
    }
}

struct InformationListView_Previews: PreviewProvider {
    static var previews: some View {
        InfoList(infos: ModelData().informationSet[YearMonthDay.current]!)
    }
}
