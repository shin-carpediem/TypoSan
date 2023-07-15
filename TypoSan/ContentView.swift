import SwiftUI

struct ContentView: View {
    // MARK: - Private
    
    private typealias Size = HIGTypeSizeSet.HIGTypeSize
    
    @ObservedObject private var sizeSet = HIGTypeSizeSet()
    
    @State private var sizeType: Size = .largeDefault
    @State private var stepperSize: Int = 17
    @State private var inputText: String = "こんにちは"
    
    // MARK: - View
    
    var body: some View {
        VStack {
            picker
            List {
                section
                stepper
            }
        }
    }
    
    private var picker: some View {
        Picker("", selection: $sizeType) {
            Text("xSmall").tag(Size.xSmall)
            Text("Small").tag(Size.small)
            Text("Medium").tag(Size.medium)
            Text("Large (Default)").tag(Size.largeDefault)
            Text("xLarge").tag(Size.xLarge)
            Text("xxLarge").tag(Size.xxLarge)
            Text("xxxLarge").tag(Size.xxxLarge)
        }
        .pickerStyle(.wheel)
        .onChange(of: sizeType) {
            sizeSet.updateFontSize(size: $0)
        }
    }
   
    private var section: some View {
        Section {
            Group {
                Text("\(sizeSet.largeTitle.int)pt: Large Title Large Title 大きなタイトル 大きなタイトル")
                    .font(.system(size: sizeSet.largeTitle))
                Text("\(sizeSet.title1.int)pt: Title 1 Title 1 Title 1 タイトル 1 タイトル 1 タイトル1")
                    .font(.system(size: sizeSet.title1))
                Text("\(sizeSet.title2.int)pt: Title 2 Title 2 Title 2 タイトル 2 タイトル 2 タイトル2")
                    .font(.system(size: sizeSet.title2))
                Text("\(sizeSet.title3.int)pt: Title 3 Title 3 Title 3 タイトル 3 タイトル 3 タイトル3")
                    .font(.system(size: sizeSet.title3))
            }
            Group {
                Text("\(sizeSet.headline.int)pt: Headline Headline Headline 見出し 見出し 見出し")
                    .font(.system(size: sizeSet.headline, weight: .semibold))
                Text("\(sizeSet.body.int)pt: Body Body Body Body 本文 本文 本文 本文 本文")
                    .font(.system(size: sizeSet.body))
                Text("\(sizeSet.callout.int)pt: Callout Callout Callout Callout アウト アウト コールアウト")
                    .font(.system(size: sizeSet.callout))
                Text("\(sizeSet.subhead.int)pt: Subhead Subhead Subhead 小見出し 小見出し 小見出し")
                    .font(.system(size: sizeSet.subhead))
                Text("\(sizeSet.footnote.int)pt: Footnone Footnone Footnone Footnone 脚注 脚注 脚注")
                    .font(.system(size: sizeSet.footnote))
            }
            Group {
                Text("\(sizeSet.caption1.int)pt: Caption 1 Caption 1 Caption 1 Caption 1 キャプション 1 キャプション 1 キャプション1")
                    .font(.system(size: sizeSet.caption1))
                Text("\(sizeSet.caption2.int)pt: Caption 2 Caption 2 Caption 2 Caption 2 キャプション 2 キャプション 2 キャプション2")
                    .font(.system(size: sizeSet.caption2))
            }
        }
    }
    
    private var stepper: some View {
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

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
