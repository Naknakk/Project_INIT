import SwiftUI

struct Information: Hashable, Identifiable {
    var id: UUID = UUID()
    
    var title: String
    var color: Color
}
