import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Setting View")
            }.navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(leading: Text("Setting").font(.system(size: 25, weight: .bold, design: .default)))
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
