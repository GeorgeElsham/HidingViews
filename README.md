# HidingViews

This is a custom ViewModifier, `.isHidden(_:)`. It allows a View to be hidden, controlled by a boolean property/value.

This project is an example of how to use it. Use it like so:

    Text("Hello World!")
        .isHidden(true)
        
`@State` can come in very useful for this situation, as demonstrated in the project's code, and it is very simple to do.
        
---
        
If you are just interested in the code for `View-hidden().swift` to create the modifier, here it is:

    import SwiftUI


    extension View {

        /// Whether the view is hidden.
        /// - Parameter bool: Set to `true` to hide the view. Set to `false` to show the view.
        func isHidden(_ bool: Bool) -> some View {
            modifier(HiddenModifier(isHidden: bool))
        }
    }


    /// Creates a view modifier that can be applied, like so:
    ///
    /// ```
    /// Text("Hello World!")
    ///     .isHidden(true)
    /// ```
    ///
    /// Variables can be used in place so that the content can be changed dynamically.
    private struct HiddenModifier: ViewModifier {

        fileprivate let isHidden: Bool

        fileprivate func body(content: Content) -> some View {
            Group {
                if isHidden {
                    content.hidden()
                } else {
                    content
                }
            }
        }
    }
