//
//  View-hidden().swift
//  HidingViews
//
//  Created by George Elsham on 15/01/2020.
//  Copyright © 2020 George Elsham. All rights reserved.
//

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
    func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        modifier(HiddenModifier(isHidden: hidden, remove: remove))
    }
    
}


/// Creates a view modifier to show and hide a view.
///
/// Variables can be used in place so that the content can be changed dynamically.
fileprivate struct HiddenModifier: ViewModifier {
    
    fileprivate let isHidden: Bool
    fileprivate let remove: Bool
    
    init(isHidden: Bool, remove: Bool = false) {
        self.isHidden   = isHidden
        self.remove     = remove
    }
    
    fileprivate func body(content: Content) -> some View {
        Group {
            if isHidden {
                if remove {
                    EmptyView()
                } else {
                    content.hidden()
                }
            } else {
                content
            }
        }
    }
    
}
