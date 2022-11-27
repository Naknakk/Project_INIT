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

struct InfoDetail_Previews: PreviewProvider {
    static var previews: some View {
        InfoDetail(info: ModelData().informationSet[YearMonthDay.current]![0])
    }
}
