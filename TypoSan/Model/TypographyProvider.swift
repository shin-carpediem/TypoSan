import Foundation

protocol TypographyProvidable {
    func typographyList(with size: TypographySize) -> [TypographyModel]
}

struct TypographyProvider: TypographyProvidable {
    // MARK: - TypographyProvidable
    
    func typographyList(with size: TypographySize) -> [TypographyModel] {
        switch size {
        case .xSmall:
            [.init(style: .largeTitle, weight: .regular,  size: 31),
             .init(style: .title1,     weight: .regular,  size: 25),
             .init(style: .title2,     weight: .regular,  size: 19),
             .init(style: .title3,     weight: .regular,  size: 17),
             .init(style: .headline,   weight: .semibold, size: 14),
             .init(style: .body,       weight: .regular,  size: 14),
             .init(style: .callout,    weight: .regular,  size: 13),
             .init(style: .subhead,    weight: .regular,  size: 12),
             .init(style: .footnote,   weight: .regular,  size: 12),
             .init(style: .caption1,   weight: .regular,  size: 11),
             .init(style: .caption2,   weight: .regular,  size: 11)]
            
        case .small:
            [.init(style: .largeTitle, weight: .regular,  size: 32),
             .init(style: .title1,     weight: .regular,  size: 26),
             .init(style: .title2,     weight: .regular,  size: 20),
             .init(style: .title3,     weight: .regular,  size: 18),
             .init(style: .headline,   weight: .semibold, size: 15),
             .init(style: .body,       weight: .regular,  size: 15),
             .init(style: .callout,    weight: .regular,  size: 14),
             .init(style: .subhead,    weight: .regular,  size: 13),
             .init(style: .footnote,   weight: .regular,  size: 12),
             .init(style: .caption1,   weight: .regular,  size: 11),
             .init(style: .caption2,   weight: .regular,  size: 11)]
            
        case .medium:
            [.init(style: .largeTitle, weight: .regular,  size: 33),
             .init(style: .title1,     weight: .regular,  size: 27),
             .init(style: .title2,     weight: .regular,  size: 21),
             .init(style: .title3,     weight: .regular,  size: 19),
             .init(style: .headline,   weight: .semibold, size: 16),
             .init(style: .body,       weight: .regular,  size: 15),
             .init(style: .callout,    weight: .regular,  size: 15),
             .init(style: .subhead,    weight: .regular,  size: 14),
             .init(style: .footnote,   weight: .regular,  size: 12),
             .init(style: .caption1,   weight: .regular,  size: 11),
             .init(style: .caption2,   weight: .regular,  size: 11)]
            
        case .largeDefault:
            [.init(style: .largeTitle, weight: .regular,  size: 34),
             .init(style: .title1,     weight: .regular,  size: 28),
             .init(style: .title2,     weight: .regular,  size: 22),
             .init(style: .title3,     weight: .regular,  size: 20),
             .init(style: .headline,   weight: .semibold, size: 17),
             .init(style: .body,       weight: .regular,  size: 17),
             .init(style: .callout,    weight: .regular,  size: 16),
             .init(style: .subhead,    weight: .regular,  size: 15),
             .init(style: .footnote,   weight: .regular,  size: 13),
             .init(style: .caption1,   weight: .regular,  size: 12),
             .init(style: .caption2,   weight: .regular,  size: 11)]
            
        case .xLarge:
            [.init(style: .largeTitle, weight: .regular,  size: 36),
             .init(style: .title1,     weight: .regular,  size: 30),
             .init(style: .title2,     weight: .regular,  size: 24),
             .init(style: .title3,     weight: .regular,  size: 22),
             .init(style: .headline,   weight: .semibold, size: 19),
             .init(style: .body,       weight: .regular,  size: 19),
             .init(style: .callout,    weight: .regular,  size: 18),
             .init(style: .subhead,    weight: .regular,  size: 17),
             .init(style: .footnote,   weight: .regular,  size: 15),
             .init(style: .caption1,   weight: .regular,  size: 14),
             .init(style: .caption2,   weight: .regular,  size: 13)]
            
        case .xxLarge:
            [.init(style: .largeTitle, weight: .regular,  size: 38),
             .init(style: .title1,     weight: .regular,  size: 32),
             .init(style: .title2,     weight: .regular,  size: 26),
             .init(style: .title3,     weight: .regular,  size: 24),
             .init(style: .headline,   weight: .semibold, size: 21),
             .init(style: .body,       weight: .regular,  size: 21),
             .init(style: .callout,    weight: .regular,  size: 20),
             .init(style: .subhead,    weight: .regular,  size: 19),
             .init(style: .footnote,   weight: .regular,  size: 17),
             .init(style: .caption1,   weight: .regular,  size: 16),
             .init(style: .caption2,   weight: .regular,  size: 15)]
            
        case .xxxLarge:
            [.init(style: .largeTitle, weight: .regular,  size: 40),
             .init(style: .title1,     weight: .regular,  size: 34),
             .init(style: .title2,     weight: .regular,  size: 28),
             .init(style: .title3,     weight: .regular,  size: 26),
             .init(style: .headline,   weight: .semibold, size: 23),
             .init(style: .body,       weight: .regular,  size: 22),
             .init(style: .callout,    weight: .regular,  size: 21),
             .init(style: .subhead,    weight: .regular,  size: 21),
             .init(style: .footnote,   weight: .regular,  size: 19),
             .init(style: .caption1,   weight: .regular,  size: 18),
             .init(style: .caption2,   weight: .regular,  size: 17)]
        }
    }
}
