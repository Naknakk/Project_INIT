import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("Home View")
            }.navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(leading: Text("Home").font(.system(size: 25, weight: .bold, design: .default)))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
