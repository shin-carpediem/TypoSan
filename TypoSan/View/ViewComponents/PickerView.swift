import SwiftUI

struct PickerView: View {
    @State private var pickerSelectionTag = 3
    
    var viewDidAppear: (() -> Void)?
    var didChangeSelection: ((Int) -> Void)?
    
    var body: some View {
        Picker("", selection: $pickerSelectionTag) {
            ForEach(Array(pickerLabelList.enumerated()), id: \.element) { (index: Int, pickerLabel: String) in
                Text(pickerLabel).tag(index)
            }
        }
        .pickerStyle(.wheel)
        .onAppear {
            viewDidAppear?()
        }
        .onChange(of: pickerSelectionTag) { (newSizeTag: Int) in
            didChangeSelection?(newSizeTag)
        }
    }
}

// MARK: - FilePrivate

fileprivate let pickerLabelList = ["xSmall", "Small",
                                   "Medium",
                                   "Large (Default)", "xLarge", "xxLarge", "xxxLarge"]

// MARK: - Preview

#Preview {
    PickerView()
}
