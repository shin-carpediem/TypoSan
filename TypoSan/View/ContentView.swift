import SwiftUI

struct ContentView: View {
    init() {}
    
    // MARK: - Private
    
    private final class ViewState: ObservableObject {
        @Published var typographySize: TypographySize = .largeDefault
        @Published private(set) var typographyList = [TypographyModel]()
        @Published var stepperSize = 17
        @Published var inputText = "こんにちは"
        
        init() {}
        
        func updateTypographyList(with size: TypographySize) {
            typographyList = provider.typographyList(with: size)
        }
        
        func updateTypographyList(with sizeTag: Int) {
            let size: TypographySize
            if sizeTag == 0 { size = .xSmall }
            else if sizeTag == 1 { size = .small }
            else if sizeTag == 2 { size = .medium }
            else if sizeTag == 3 { size = .largeDefault }
            else if sizeTag == 4 { size = .xLarge }
            else if sizeTag == 5 { size = .xxLarge }
            else if sizeTag == 6 { size = .xxxLarge }
            else {
                assertionFailure()
                size = .largeDefault
            }
            typographyList = provider.typographyList(with: size)
        }
        
        private let provider = TypographyProvider()
    }
    
    @StateObject private var state = ViewState()
    @State private var pickerSelectionTag = 3
    
    private let provider = TypographyProvider()
    
    // MARK: - View
    
    var body: some View {
        VStack {
            picker
            typographyList
            stepper
                .padding()
        }
    }
    
    private var picker: some View {
        Picker("", selection: $pickerSelectionTag) {
            ForEach(Array(pickerLabelList.enumerated()), id: \.element) { (index: Int, pickerLabel: String) in
                Text(pickerLabel).tag(index)
            }
        }
        .pickerStyle(.wheel)
        .onAppear {
            state.updateTypographyList(with: .largeDefault)
        }
        .onChange(of: pickerSelectionTag) { (newSizeTag: Int) in
            state.updateTypographyList(with: newSizeTag)
        }
    }
    
    private var typographyList: some View {
        List {
            ForEach(state.typographyList, id: \.self) { (typography: TypographyModel) in
                Text("\(typography.size.roundToInt)pt: " + "\(typography.style)")
                    .font(.system(size: typography.size,
                                  weight: typography.weight))
            }
        }
    }
    
    private var stepper: some View {
        HStack {
            Stepper(value: $state.stepperSize, in: 1...99) {
                Text("\(state.stepperSize)pt")
            }
            TextField("", text: $state.inputText)
                .font(.system(size: CGFloat(state.stepperSize)))
        }
    }
}

// MARK: - FilePrivate

fileprivate let pickerLabelList = ["xSmall",
                                   "Small",
                                   "Medium",
                                   "Large (Default)",
                                   "xLarge",
                                   "xxLarge",
                                   "xxxLarge"]

fileprivate extension CGFloat {
    var roundToInt: Int {
        Int(self)
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
