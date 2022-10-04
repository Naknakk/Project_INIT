import SwiftUI

struct InfoRow: View {
    var info: Information
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Circle()
                .fill(info.color.opacity(0.75))
                .frame(width: 12, height: 12)
            Text(info.title)
                .padding(.leading, 8)
        }
    }
}

struct InfoRow_Previews: PreviewProvider {
    static var previews: some View {
        InfoRow(info: ModelData().informations[0])
    }
}
