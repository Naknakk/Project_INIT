import SwiftUI

extension Color {
    struct google {
        static var defaultColor = Color(#colorLiteral(red: 0.2666666667, green: 0.5960784314, blue: 0.8784313725, alpha: 1))
        static var tomato = Color(#colorLiteral(red: 0.7647058824, green: 0.1607843137, blue: 0.1137254902, alpha: 1))
        static var tangerine = Color(#colorLiteral(red: 0.8823529412, green: 0.368627451, blue: 0.2039215686, alpha: 1))
        static var banana = Color(#colorLiteral(red: 0.9333333333, green: 0.7568627451, blue: 0.2980392157, alpha: 1))
        static var basil = Color(#colorLiteral(red: 0.2235294118, green: 0.4941176471, blue: 0.2823529412, alpha: 1))
        static var sage = Color(#colorLiteral(red: 0.3607843137, green: 0.7019607843, blue: 0.4941176471, alpha: 1))
        static var emerald = Color(#colorLiteral(red: 0.2549019608, green: 0.5764705882, blue: 0.5333333333, alpha: 1))
        static var peacock = Color(#colorLiteral(red: 0.2666666667, green: 0.5960784314, blue: 0.8784313725, alpha: 1))
        static var blueberry = Color(#colorLiteral(red: 0.2588235294, green: 0.3176470588, blue: 0.6823529412, alpha: 1))
        static var lavender = Color(#colorLiteral(red: 0.4823529412, green: 0.5176470588, blue: 0.7725490196, alpha: 1))
        static var grape = Color(#colorLiteral(red: 0.5098039216, green: 0.1764705882, blue: 0.6431372549, alpha: 1))
        static var flamingo = Color(#colorLiteral(red: 0.8470588235, green: 0.5058823529, blue: 0.4666666667, alpha: 1))
        static var graphite = Color(#colorLiteral(red: 0.3803921569, green: 0.3803921569, blue: 0.3803921569, alpha: 1))
    }
}

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
