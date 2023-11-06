import Foundation
import SwiftUI

struct TypographyModel: Hashable {
    let style: TypographyStyle
    let weight: Font.Weight
    let size: CGFloat
}

enum TypographyStyle: CGFloat {
    case largeTitle
    case title1
    case title2
    case title3
    case headline
    case body
    case callout
    case subhead
    case footnote
    case caption1
    case caption2
}
