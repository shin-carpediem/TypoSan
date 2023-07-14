import Foundation

struct HIGTypeSizeSet {
    var largeTitle: CGFloat
    var title1: CGFloat
    var title2: CGFloat
    var title3: CGFloat
    var headline: CGFloat
    var body: CGFloat
    var callout: CGFloat
    var subhead: CGFloat
    var footnote: CGFloat
    var caption1: CGFloat
    var caption2: CGFloat
}

enum HIGTypeSize {
    case xSmall
    case small
    case medium
    case largeDefault
    case xLarge
    case xxLarge
    case xxxLarge
    
    var sizeSet: HIGTypeSizeSet {
        switch self {
        case .xSmall:
            return HIGTypeSizeSet(largeTitle: 31, title1: 25, title2: 19, title3: 17, headline: 14, body: 14, callout: 13, subhead: 12, footnote: 12, caption1: 11, caption2: 11)
            
        case .small:
            return HIGTypeSizeSet(largeTitle: 32, title1: 26, title2: 20, title3: 18, headline: 15, body: 15, callout: 14, subhead: 13, footnote: 12, caption1: 11, caption2: 11)
            
        case .medium:
            return HIGTypeSizeSet(largeTitle: 33, title1: 27, title2: 21, title3: 19, headline: 16, body: 15, callout: 15, subhead: 14, footnote: 12, caption1: 11, caption2: 11)
            
        case .largeDefault:
            return HIGTypeSizeSet(largeTitle: 34, title1: 28, title2: 22, title3: 20, headline: 17, body: 17, callout: 16, subhead: 15, footnote: 13, caption1: 12, caption2: 11)
            
        case .xLarge:
            return HIGTypeSizeSet(largeTitle: 36, title1: 30, title2: 24, title3: 22, headline: 19, body: 19, callout: 18, subhead: 17, footnote: 15, caption1: 14, caption2: 13)
            
        case .xxLarge:
            return HIGTypeSizeSet(largeTitle: 38, title1: 32, title2: 26, title3: 24, headline: 21, body: 21, callout: 20, subhead: 19, footnote: 17, caption1: 16, caption2: 15)
            
        case .xxxLarge:
            return HIGTypeSizeSet(largeTitle: 40, title1: 34, title2: 28, title3: 26, headline: 23, body: 23, callout: 22, subhead: 21, footnote: 19, caption1: 18, caption2: 17)
        }
    }
}
