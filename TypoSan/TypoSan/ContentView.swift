import SwiftUI

struct ContentView: View {
    @State private var sizeType: Int = 1
    
    @State private var largeTitleSize: CGFloat = 0
    @State private var titleSize: CGFloat = 0
    @State private var headLineSize: CGFloat = 0
    @State private var bodySize: CGFloat = 0
    @State private var calloutSize: CGFloat = 0
    @State private var subheadSize: CGFloat = 0
    @State private var footnoteSize: CGFloat = 0
    @State private var captionSize: CGFloat = 0
    
    // MARK: - View
    
    var body: some View {
        VStack {
            picker
            List {
                staticTypeSection
                dynamicTypeSection
            }
        }
    }
    
    private var picker: some View {
        Picker("", selection: $sizeType) {
            Text("xSmall").tag(0)
            Text("Small").tag(1)
            Text("Medium").tag(2)
            Text("Large (Default)").tag(3)
            Text("xLarge").tag(4)
            Text("xxLarge").tag(5)
            Text("xxxLarge").tag(6)
        }
        .pickerStyle(.wheel)
        .onAppear(perform: {
            updateFontSize(sizeType: 1)
        })
        .onChange(of: sizeType) { changedSize in
            updateFontSize(sizeType: changedSize)
        }
    }
   
    private var staticTypeSection: some View {
        Section {
            Text("\(largeTitleSize.int)pt: Large Title Large Title Large Title")
                .font(.system(size: largeTitleSize))
            Text("\(titleSize.int)pt: Title 1 Title 1 Title 1 Title 1 Title 1")
                .font(.system(size: titleSize))
            Text("\(headLineSize.int)pt: Headline Headline Headline Headline Headline")
                .font(.system(size: headLineSize, weight: .semibold))
            Text("\(bodySize.int)pt: Body Body Body Body Body Body Body Body")
                .font(.system(size: bodySize))
            Text("\(calloutSize.int)pt: Callout Callout Callout Callout Callout Callout")
                .font(.system(size: calloutSize))
            Text("\(subheadSize.int)pt: Subhead Subhead Subhead Subhead Subhead")
                .font(.system(size: subheadSize))
            Text("\(footnoteSize.int)pt: Footnone Footnone Footnone Footnone Footnone Footnone")
                .font(.system(size: footnoteSize))
            Text("\(captionSize.int)pt: Caption 1 Caption 1 Caption 1 Caption 1 Caption 1 Caption 1")
                .font(.system(size: captionSize))
        } header: {
            Text("STATIC TYPE")
        }
    }
    
    private var dynamicTypeSection: some View {
        // TODO: defaultのフォントサイズのままで、smallになっていない。
        Section {
            Text("32pt: Large Title Large Title Large Title")
                .font(.largeTitle)
            Text("26pt: Title 1 Title 1 Title 1 Title 1 Title 1")
                .font(.title)
            Text("15pt: Headline Headline Headline Headline Headline")
                .font(.headline)
            Text("15pt: Body Body Body Body Body Body Body Body")
                .font(.body)
            Text("14pt: Callout Callout Callout Callout Callout Callout")
                .font(.callout)
            Text("13pt: Subhead Subhead Subhead Subhead Subhead")
                .font(.subheadline)
            Text("12pt: Footnone Footnone Footnone Footnone Footnone Footnone")
                .font(.footnote)
            Text("11pt: Caption 1 Caption 1 Caption 1 Caption 1 Caption 1 Caption 1")
                .font(.caption)
        } header: {
            Text("DYNAMIC TYPE / SIZE - SMALL")
        }
    }
}

extension ContentView {
    private func updateFontSize(sizeType: Int) {
        if sizeType == 0 {
            largeTitleSize = HIGTypeSize.xSmall.sizeSet.largeTitle
            titleSize = HIGTypeSize.xSmall.sizeSet.title1
            headLineSize = HIGTypeSize.xSmall.sizeSet.headline
            bodySize = HIGTypeSize.xSmall.sizeSet.body
            calloutSize = HIGTypeSize.xSmall.sizeSet.callout
            subheadSize = HIGTypeSize.xSmall.sizeSet.subhead
            footnoteSize = HIGTypeSize.xSmall.sizeSet.footnote
            captionSize = HIGTypeSize.xSmall.sizeSet.caption1
        } else if sizeType == 1 {
            largeTitleSize = HIGTypeSize.small.sizeSet.largeTitle
            titleSize = HIGTypeSize.small.sizeSet.title1
            headLineSize = HIGTypeSize.small.sizeSet.headline
            bodySize = HIGTypeSize.small.sizeSet.body
            calloutSize = HIGTypeSize.small.sizeSet.callout
            subheadSize = HIGTypeSize.small.sizeSet.subhead
            footnoteSize = HIGTypeSize.small.sizeSet.footnote
            captionSize = HIGTypeSize.small.sizeSet.caption1
        } else if sizeType == 2 {
            largeTitleSize = HIGTypeSize.medium.sizeSet.largeTitle
            titleSize = HIGTypeSize.medium.sizeSet.title1
            headLineSize = HIGTypeSize.medium.sizeSet.headline
            bodySize = HIGTypeSize.medium.sizeSet.body
            calloutSize = HIGTypeSize.medium.sizeSet.callout
            subheadSize = HIGTypeSize.medium.sizeSet.subhead
            footnoteSize = HIGTypeSize.medium.sizeSet.footnote
            captionSize = HIGTypeSize.medium.sizeSet.caption1
        } else if sizeType == 3 {
            largeTitleSize = HIGTypeSize.largeDefault.sizeSet.largeTitle
            titleSize = HIGTypeSize.largeDefault.sizeSet.title1
            headLineSize = HIGTypeSize.largeDefault.sizeSet.headline
            bodySize = HIGTypeSize.largeDefault.sizeSet.body
            calloutSize = HIGTypeSize.largeDefault.sizeSet.callout
            subheadSize = HIGTypeSize.largeDefault.sizeSet.subhead
            footnoteSize = HIGTypeSize.largeDefault.sizeSet.footnote
            captionSize = HIGTypeSize.largeDefault.sizeSet.caption1
        } else if sizeType == 4 {
            largeTitleSize = HIGTypeSize.xLarge.sizeSet.largeTitle
            titleSize = HIGTypeSize.xLarge.sizeSet.title1
            headLineSize = HIGTypeSize.xLarge.sizeSet.headline
            bodySize = HIGTypeSize.xLarge.sizeSet.body
            calloutSize = HIGTypeSize.xLarge.sizeSet.callout
            subheadSize = HIGTypeSize.xLarge.sizeSet.subhead
            footnoteSize = HIGTypeSize.xLarge.sizeSet.footnote
            captionSize = HIGTypeSize.xLarge.sizeSet.caption1
        } else if sizeType == 5 {
            largeTitleSize = HIGTypeSize.xxLarge.sizeSet.largeTitle
            titleSize = HIGTypeSize.xxLarge.sizeSet.title1
            headLineSize = HIGTypeSize.xxLarge.sizeSet.headline
            bodySize = HIGTypeSize.xxLarge.sizeSet.body
            calloutSize = HIGTypeSize.xxLarge.sizeSet.callout
            subheadSize = HIGTypeSize.xxLarge.sizeSet.subhead
            footnoteSize = HIGTypeSize.xxLarge.sizeSet.footnote
            captionSize = HIGTypeSize.xxLarge.sizeSet.caption1
        } else if sizeType == 6 {
            largeTitleSize = HIGTypeSize.xxxLarge.sizeSet.largeTitle
            titleSize = HIGTypeSize.xxxLarge.sizeSet.title1
            headLineSize = HIGTypeSize.xxxLarge.sizeSet.headline
            bodySize = HIGTypeSize.xxxLarge.sizeSet.body
            calloutSize = HIGTypeSize.xxxLarge.sizeSet.callout
            subheadSize = HIGTypeSize.xxxLarge.sizeSet.subhead
            footnoteSize = HIGTypeSize.xxxLarge.sizeSet.footnote
            captionSize = HIGTypeSize.xxxLarge.sizeSet.caption1
        } else {
            return
        }
    }
}

// MARK: - Preview

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
