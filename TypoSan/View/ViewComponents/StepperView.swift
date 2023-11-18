import SwiftUI

struct StepperView: View {
    @Binding var stepperSize: Int
    @Binding var inputText: String
    
    var body: some View {
        HStack {
            Stepper(value: $stepperSize, in: 1...99) {
                Text("\(stepperSize)pt")
            }
            TextField("", text: $inputText)
                .font(.system(size: CGFloat(stepperSize)))
        }
    }
}

// MARK: - Preview

#Preview {
    StepperView(stepperSize: .constant(17),
                inputText: .constant("こんにちは"))
}
