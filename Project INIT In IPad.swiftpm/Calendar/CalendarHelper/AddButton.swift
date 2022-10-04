import SwiftUI

struct AddButton: View {
    @Binding var addPage: Bool
    var body: some View {
        Button {
            addPage.toggle()
        } label: {
            ZStack(alignment: .center) {
                Circle()
                    .foregroundColor(.white)
                    .shadow(color: .secondary, radius: 3, y: 3)
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.brown)
                    .padding(10)
                    .opacity(0.8)
                
            }
            .frame(width: 40, height: 40, alignment: .topLeading)
        }
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton(addPage: .constant(true))
    }
}
