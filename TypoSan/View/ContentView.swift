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
            ForEach(Array(pickerLabelList.enumerated()), id: \.element) { index, pickerLabel in
                Text(pickerLabel).tag(index)
            }
        }
        .pickerStyle(.wheel)
        .onAppear {
            state.updateTypographyList(with: .largeDefault)
        }
        .onChange(of: state.typographySize) { (newSize: TypographySize) in
            state.updateTypographyList(with: newSize)
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
