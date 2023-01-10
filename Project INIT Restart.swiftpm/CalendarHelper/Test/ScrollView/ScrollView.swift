import SwiftUI

struct ScrollCalendarView: View {
    let colors: [Color] = [.purple, .pink, .orange]
    var body: some View {
        GeometryReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 0) {
                    ForEach(colors.indices) { index in
                        colors[index]
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height)
                }
            }
        }.onAppear {
            UIScrollView.appearance().isPagingEnabled = true
        }
    }
}

struct ScrollCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollCalendarView()
    }
}
