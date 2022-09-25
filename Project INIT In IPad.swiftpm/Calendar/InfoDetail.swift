import SwiftUI

struct InfoDetail: View {
    var info: Information
    var body: some View {
        VStack {
            Text("\(info.title)")
        }.navigationTitle("\(info.title)")
        //.navigationBarTitleDisplayMode(.inline)
    }
}

struct InformationSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        InfoDetail(info: ModelData().informations[1])
    }
}
