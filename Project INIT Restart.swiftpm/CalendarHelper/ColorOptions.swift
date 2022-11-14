import SwiftUI

struct ColorOptions {
    static var all: [Color] = [
        .google.defaultColor,
        .google.tomato,
        .google.tangerine,
        .google.banana,
        .google.basil,
        .google.sage,
        .google.emerald,
        .google.peacock,
        .google.blueberry,
        .google.lavender,
        .google.grape,
        .google.flamingo,
        .google.graphite
    ]
    
    
    
    static func random() -> Color {
        if let element = ColorOptions.all.randomElement() {
            return element
        } else {
            return .google.defaultColor
        }
        
    }
}
