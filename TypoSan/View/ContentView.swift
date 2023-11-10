import SwiftUI

struct ContentView: View {
    init() {}
    
    // MARK: - Private
    
    private final class State: ObservableObject {
        @Published var typographySize: TypographySize
        @Published var typographyList: [TypographyModel]
        @Published var stepperSize: Int
        @Published var inputText: String
        
        init(typographySize: TypographySize,
             typographyList: [TypographyModel],
             stepperSize: Int,
             inputText: String) {
            self.typographySize = typographySize
            self.typographyList = typographyList
            self.stepperSize = stepperSize
            self.inputText = inputText
        }
    }
    
    @StateObject private var state: State = .init(typographySize: .largeDefault,
                                                  typographyList: [],
                                                  stepperSize: 17,
                                                  inputText: "こんにちは")
    
    private let provider = TypographyProvider()
    
    // MARK: - View
    
    var body: some View {
        VStack {
            picker
            typographyList
            stepper
                .padding()
        }
        .onAppear {
            state.typographyList = provider.typographyList(with: .largeDefault)
        }
    }
    
    private var picker: some View {
        Picker("", selection: $state.typographySize) {
            ForEach(pickerLabelList, id: \.self) { pickerLabel in
                Text(pickerLabel).tag(pickerLabel.firstIndex(where: { String($0) == pickerLabel }))
            }
        }
        .pickerStyle(.wheel)
        .onChange(of: state.typographySize) { newSize in
            state.typographySize = newSize
            state.typographyList = provider.typographyList(with: newSize)
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

// MARK: - Private

private let pickerLabelList = ["xSmall",
                               "Small",
                               "Medium",
                               "Large (Default)",
                               "xLarge",
                               "xxLarge",
                               "xxxLarge"]

private extension CGFloat {
    var roundToInt: Int {
        Int(self)
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
