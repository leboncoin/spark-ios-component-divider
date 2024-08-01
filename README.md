
# Divider

## Specifications

The divider specifications on Zeroheight is [here](https://zeroheight.com/1186e1705/v/latest/p/867b47-divider).

![Figma anatomy](https://github.com/adevinta/spark-ios-component-divider/blob/main/.github/assets/anatomy.png)

## UIKit

```swift
/// The UIKit version of the divider.
public final class DividerUIView: UIView {

    /// Initialize a new divider view.
    /// - Parameters:
    ///   - theme: The spark theme of the divider.
    ///   - intent: The intent of the divider.
    public init(
        theme: Theme,
        intent: DividerIntent
    )
}
```

To set a label, use the `label` property and set `showLabel` to `true`
```
    divider.label.text = "Your text"
    divider.showLabel = true
```

Note:
- The label text color is already set by Spark
- The label text font is already set by Spark

### SwiftUI

```swift
/// The SwiftUI version of the divider.
public struct DividerView: View {

    /// Initialize a new divider view without text.
    /// - Parameters:
    ///   - theme: The spark theme of the divider.
    ///   - intent: The intent of the divider.
    ///   - axis: The axis of the divider. The default is ``.horizontal``.
    ///   - alignment: The alignment of the divider. The default is ``.center``.
    public init(
        theme: Theme,
        intent: DividerIntent,
        axis: DividerAxis = .horizontal,
        alignment: DividerAlignment = .center
    )

    /// Initialize a new divider view with a text.
    /// - Parameters:
    ///   - theme: The spark theme of the divider.
    ///   - intent: The intent of the divider.
    ///   - axis: The axis of the divider. The default is ``.horizontal``.
    ///   - alignment: The alignment of the divider. The default is ``.center``.
    ///   - text: Text to show inbetween separators. Its `.foregroudColor` and `.font` will be overriden by Spark.
    public init(
        theme: Theme,
        intent: DividerIntent,
        axis: DividerAxis,
        alignment: DividerAlignment,
        text: @escaping () -> Text
    )
}
```

## Properties

### Intent

```swift
/// The intent of the divider.
public enum DividerIntent: CaseIterable {
    case outline
    case outlineHigh
}
```

### Axis

```swift
/// The axis of the divider.
public enum DividerAxis: CaseIterable {
    case horizontal
    case vertical
}
````

### Alignment

```swift
/// The alignment of the divider.
public enum DividerAlignment: CaseIterable {
    case top
    case leading
    case center
    case trailing
    case bottom
}
```

Note: 
- `.top` and `.bottom` are only used with the `.vertical` axis.  
- `.leading` and `.trailing` are only used with the `.horizontal` axis.  
- It will act as `.center` if otherwise.  

## License

```
MIT License

Copyright (c) 2024 Adevinta

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```