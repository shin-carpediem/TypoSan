import SwiftUI

struct ContentView: View {
    @State private var sizeType: Int = 1
    
    @State private var largeTitleSize: CGFloat = 0
    @State private var title1Size: CGFloat = 0
    @State private var title2Size: CGFloat = 0
    @State private var title3Size: CGFloat = 0
    @State private var headLineSize: CGFloat = 0
    @State private var bodySize: CGFloat = 0
    @State private var calloutSize: CGFloat = 0
    @State private var subheadSize: CGFloat = 0
    @State private var footnoteSize: CGFloat = 0
    @State private var caption1Size: CGFloat = 0
    @State private var caption2Size: CGFloat = 0
    
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
            Group {
                Text("\(largeTitleSize.int)pt: Large Title Large Title Large Title")
                    .font(.system(size: largeTitleSize))
                Text("\(title1Size.int)pt: Title 1 Title 1 Title 1 Title 1 Title 1")
                    .font(.system(size: title1Size))
                Text("\(title2Size.int)pt: Title 2 Title 2 Title 2 Title 2 Title 2")
                    .font(.system(size: title2Size))
                Text("\(title3Size.int)pt: Title 3 Title 3 Title 3 Title 3 Title 3")
                    .font(.system(size: title3Size))
            }
            Group {
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
            }
            Group {
                Text("\(caption1Size.int)pt: Caption 1 Caption 1 Caption 1 Caption 1 Caption 1 Caption 1")
                    .font(.system(size: caption1Size))
                Text("\(caption2Size.int)pt: Caption 2 Caption 2 Caption 2 Caption 2 Caption 2 Caption 2")
                    .font(.system(size: caption2Size))
            }
        } header: {
            Text("STATIC TYPE")
        }
    }
    
    private var dynamicTypeSection: some View {
        Section {
            Group {
                Text("Large Title Large Title Large Title")
                    .font(.largeTitle)
                Text("Title 1 Title 1 Title 1 Title 1 Title 1")
                    .font(.title)
                Text("Title 2 Title 2 Title 2 Title 2 Title 2")
                    .font(.title2)
                Text("Title 3 Title 3 Title 3 Title 3 Title 3")
                    .font(.title3)
            }
            Group {
                Text("Headline Headline Headline Headline Headline")
                    .font(.headline)
                Text("Body Body Body Body Body Body Body Body")
                    .font(.body)
                Text("Callout Callout Callout Callout Callout Callout")
                    .font(.callout)
                Text("Subhead Subhead Subhead Subhead Subhead")
                    .font(.subheadline)
                Text("Footnone Footnone Footnone Footnone Footnone Footnone")
                    .font(.footnote)
            }
            Group {
                Text("Caption 1 Caption 1 Caption 1 Caption 1 Caption 1 Caption 1")
                    .font(.caption)
                Text("Caption 2 Caption 2 Caption 2 Caption 2 Caption 2 Caption 2")
                    .font(.caption2)
            }
        } header: {
            Text("DYNAMIC TYPE")
        }
    }
}

extension ContentView {
    private func updateFontSize(sizeType: Int) {
        if sizeType == 0 {
            largeTitleSize = HIGTypeSize.xSmall.sizeSet.largeTitle
            title1Size = HIGTypeSize.xSmall.sizeSet.title1
            title2Size = HIGTypeSize.xSmall.sizeSet.title2
            title3Size = HIGTypeSize.xSmall.sizeSet.title3
            headLineSize = HIGTypeSize.xSmall.sizeSet.headline
            bodySize = HIGTypeSize.xSmall.sizeSet.body
            calloutSize = HIGTypeSize.xSmall.sizeSet.callout
            subheadSize = HIGTypeSize.xSmall.sizeSet.subhead
            footnoteSize = HIGTypeSize.xSmall.sizeSet.footnote
            caption1Size = HIGTypeSize.xSmall.sizeSet.caption1
            caption2Size = HIGTypeSize.xSmall.sizeSet.caption2
        } else if sizeType == 1 {
            largeTitleSize = HIGTypeSize.small.sizeSet.largeTitle
            title1Size = HIGTypeSize.small.sizeSet.title1
            title2Size = HIGTypeSize.small.sizeSet.title2
            title3Size = HIGTypeSize.small.sizeSet.title3
            headLineSize = HIGTypeSize.small.sizeSet.headline
            bodySize = HIGTypeSize.small.sizeSet.body
            calloutSize = HIGTypeSize.small.sizeSet.callout
            subheadSize = HIGTypeSize.small.sizeSet.subhead
            footnoteSize = HIGTypeSize.small.sizeSet.footnote
            caption1Size = HIGTypeSize.small.sizeSet.caption1
            caption2Size = HIGTypeSize.small.sizeSet.caption2
        } else if sizeType == 2 {
            largeTitleSize = HIGTypeSize.medium.sizeSet.largeTitle
            title1Size = HIGTypeSize.medium.sizeSet.title1
            title2Size = HIGTypeSize.medium.sizeSet.title2
            title3Size = HIGTypeSize.medium.sizeSet.title3
            headLineSize = HIGTypeSize.medium.sizeSet.headline
            bodySize = HIGTypeSize.medium.sizeSet.body
            calloutSize = HIGTypeSize.medium.sizeSet.callout
            subheadSize = HIGTypeSize.medium.sizeSet.subhead
            footnoteSize = HIGTypeSize.medium.sizeSet.footnote
            caption1Size = HIGTypeSize.medium.sizeSet.caption1
            caption2Size = HIGTypeSize.medium.sizeSet.caption2
        } else if sizeType == 3 {
            largeTitleSize = HIGTypeSize.largeDefault.sizeSet.largeTitle
            title1Size = HIGTypeSize.largeDefault.sizeSet.title1
            title2Size = HIGTypeSize.largeDefault.sizeSet.title2
            title3Size = HIGTypeSize.largeDefault.sizeSet.title3
            headLineSize = HIGTypeSize.largeDefault.sizeSet.headline
            bodySize = HIGTypeSize.largeDefault.sizeSet.body
            calloutSize = HIGTypeSize.largeDefault.sizeSet.callout
            subheadSize = HIGTypeSize.largeDefault.sizeSet.subhead
            footnoteSize = HIGTypeSize.largeDefault.sizeSet.footnote
            caption1Size = HIGTypeSize.largeDefault.sizeSet.caption1
            caption2Size = HIGTypeSize.largeDefault.sizeSet.caption2
        } else if sizeType == 4 {
            largeTitleSize = HIGTypeSize.xLarge.sizeSet.largeTitle
            title1Size = HIGTypeSize.xLarge.sizeSet.title1
            title2Size = HIGTypeSize.xLarge.sizeSet.title2
            title3Size = HIGTypeSize.xLarge.sizeSet.title3
            headLineSize = HIGTypeSize.xLarge.sizeSet.headline
            bodySize = HIGTypeSize.xLarge.sizeSet.body
            calloutSize = HIGTypeSize.xLarge.sizeSet.callout
            subheadSize = HIGTypeSize.xLarge.sizeSet.subhead
            footnoteSize = HIGTypeSize.xLarge.sizeSet.footnote
            caption1Size = HIGTypeSize.xLarge.sizeSet.caption1
            caption2Size = HIGTypeSize.xLarge.sizeSet.caption2
        } else if sizeType == 5 {
            largeTitleSize = HIGTypeSize.xxLarge.sizeSet.largeTitle
            title1Size = HIGTypeSize.xxLarge.sizeSet.title1
            title2Size = HIGTypeSize.xxLarge.sizeSet.title2
            title3Size = HIGTypeSize.xxLarge.sizeSet.title3
            headLineSize = HIGTypeSize.xxLarge.sizeSet.headline
            bodySize = HIGTypeSize.xxLarge.sizeSet.body
            calloutSize = HIGTypeSize.xxLarge.sizeSet.callout
            subheadSize = HIGTypeSize.xxLarge.sizeSet.subhead
            footnoteSize = HIGTypeSize.xxLarge.sizeSet.footnote
            caption1Size = HIGTypeSize.xxLarge.sizeSet.caption1
            caption2Size = HIGTypeSize.xxLarge.sizeSet.caption2
        } else if sizeType == 6 {
            largeTitleSize = HIGTypeSize.xxxLarge.sizeSet.largeTitle
            title1Size = HIGTypeSize.xxxLarge.sizeSet.title1
            title2Size = HIGTypeSize.xxxLarge.sizeSet.title2
            title3Size = HIGTypeSize.xxxLarge.sizeSet.title3
            headLineSize = HIGTypeSize.xxxLarge.sizeSet.headline
            bodySize = HIGTypeSize.xxxLarge.sizeSet.body
            calloutSize = HIGTypeSize.xxxLarge.sizeSet.callout
            subheadSize = HIGTypeSize.xxxLarge.sizeSet.subhead
            footnoteSize = HIGTypeSize.xxxLarge.sizeSet.footnote
            caption1Size = HIGTypeSize.xxxLarge.sizeSet.caption1
            caption2Size = HIGTypeSize.xxxLarge.sizeSet.caption2
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
