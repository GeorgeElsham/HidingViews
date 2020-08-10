# HidingViews

This is a custom ViewModifier, `.isHidden(_:)`. It allows a View to be hidden, controlled by a boolean property/value.

This project is an example of how to use it. Use it like so:

```swift
Text("Hello World!")
    .isHidden(true)
```
        
Or:

```swift
Text("Label")
    .isHidden(true, remove: true)
```
        
`@State` can come in very useful for this situation to actively change whether a view is hidden, for example controlled by a `Toggle`.

---
        
If you are just interested in the code for it to create the modifier, here it is:

```swift
import SwiftUI


extension View {
    
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    /// ```
    /// Text("Label")
    ///     .isHidden(true)
    /// ```
    ///
    /// Example for complete removal:
    /// ```
    /// Text("Label")
    ///     .isHidden(true, remove: true)
    /// ```
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
```
