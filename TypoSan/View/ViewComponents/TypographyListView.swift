import SwiftUI

struct TypographyListView: View {
    @Binding var typographyList: [TypographyModel]
    
    var body: some View {
        List {
            ForEach(typographyList, id: \.self) { (typography: TypographyModel) in
                Text("\(typography.size.roundToInt)pt: " + "\(typography.style)")
                    .font(.system(size: typography.size,
                                  weight: typography.weight))
            }
        }
    }
}

// MARK: - FilePrivate

fileprivate extension CGFloat {
    var roundToInt: Int {
        Int(self)
    }
}

// MARK: - Preview

#Preview {
    TypographyListView(typographyList: .constant(TypographyProvider().typographyList(with: .largeDefault)))
}
