import SwiftUI

enum TickerFont: CGFloat {
    case small = 10.0
    case medium = 12.0
    case regular = 14.0
    case large = 16.0
    case extraLarge = 18.0
    case xxl = 20.0
    case xxxl = 24.0
}

enum NunitoFont: String {
    case regular = "Nunito-Regular"
    case bold = "Nunito-Bold"
}

extension Font {
    static func tickerFont(font: NunitoFont, size: TickerFont) -> Font {
        return Font.custom(font.rawValue, size: size.rawValue)
    }
}

