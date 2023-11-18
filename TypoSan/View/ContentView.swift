import SwiftUI

protocol ViewStateProtocol: AnyObject {
    func updateTypographyList(with size: TypographySize)
    func updateTypographyList(with sizeTag: Int)
}

struct ContentView: View {
    // MARK: - Private
    
    private final class ViewState: ObservableObject, ViewStateProtocol {
        @Published var typographySize: TypographySize = .largeDefault
        @Published var typographyList = [TypographyModel]()
        @Published var stepperSize = 17
        @Published var inputText = "こんにちは"
        
        // MARK: - ViewStateProtocol
        
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
        
        // MARK: - Private
        
        private let provider = TypographyProvider()
    }
    
    @StateObject private var state = ViewState()
    
    // MARK: - View
    
    var body: some View {
        VStack {
            PickerView(viewDidAppear: {
                state.updateTypographyList(with: .largeDefault)
            }, didChangeSelection: { (newSizeTag: Int) in
                state.updateTypographyList(with: newSizeTag)
            })

            TypographyListView(typographyList: $state.typographyList)

            StepperView(stepperSize: $state.stepperSize,
                        inputText: $state.inputText)
                .padding()
        }
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
