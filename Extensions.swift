//
//  Extensions.swift
//  mood-tracker
//
//  Created by Lindsey M Still on 7/29/22.
//

import Foundation
import UIKit
import SwiftUI
import UIKit.UITabBar

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

public extension UITabBar {

    // if tab View is used get tabBar 'isHidden' parameter value
    static func isHidden(_ completion: @escaping (Bool) -> Void)  {
        DispatchQueue.main.async {
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            windowScene?.windows.first(where: { $0.isKeyWindow })?.allSubviews().forEach({ (v) in
                if let view = v as? UITabBar {
                    completion(view.isHidden)
                }
            })
        }
    }

    // if tab View is used toogle Tab Bar Visibility
    static func toogleTabBarVisibility(animated: Bool = true) {
        UITabBar.isHidden { isHidden in
            if isHidden {
                UITabBar.showTabBar(animated: animated)
            }
            else {
                UITabBar.hideTabBar(animated: animated)
            }
        }
    }

    // if tab View is used show Tab Bar
    static func showTabBar(animated: Bool = true) {
        DispatchQueue.main.async {
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            windowScene?.windows.first(where: { $0.isKeyWindow })?.allSubviews().forEach({ (v) in
                if let view = v as? UITabBar {
                    view.setIsHidden(false, animated: animated)
                }
            })
        }
    }

    // if tab View is used hide Tab Bar
    static func hideTabBar(animated: Bool = true) {
        DispatchQueue.main.async {
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            windowScene?.windows.first(where: { $0.isKeyWindow })?.allSubviews().forEach({ (v) in
                if let view = v as? UITabBar {
                    view.setIsHidden(true, animated: animated)
                }
            })
        }
    }

    // logic is implemented for hiding or showing the tab bar with animation
    private func setIsHidden(_ hidden: Bool, animated: Bool) {
        let isViewHidden = self.isHidden

        if animated {
            if self.isHidden && !hidden {
                self.isHidden = false
                self.frame.origin.y = UIScreen.main.bounds.height + 200
            }

            if isViewHidden && !hidden {
                self.alpha = 0.0
            }

            UIView.animate(withDuration: 0.8, animations: {
                self.alpha = hidden ? 0.0 : 1.0
            })
            UIView.animate(withDuration: 0.6, animations: {

                if !isViewHidden && hidden {
                    self.frame.origin.y = UIScreen.main.bounds.height + 200
                }
                else if isViewHidden && !hidden {
                    self.frame.origin.y = UIScreen.main.bounds.height - self.frame.height
                }
            }) { _ in
                if hidden && !self.isHidden {
                    self.isHidden = true
                }
            }
        } else {
            if !isViewHidden && hidden {
                self.frame.origin.y = UIScreen.main.bounds.height + 200
            }
            else if isViewHidden && !hidden {
                self.frame.origin.y = UIScreen.main.bounds.height - self.frame.height
            }
            self.isHidden = hidden
            self.alpha = 1
        }
    }
}

extension UIView {

    func allSubviews() -> [UIView] {
        var allSubviews = subviews
        for subview in subviews {
            allSubviews.append(contentsOf: subview.allSubviews())
        }
        return allSubviews
    }
}

import protocol SwiftUI.View
import struct SwiftUI.AnyView

//MARK: For Showing/Hiding Tab Bar

public extension View {
    func showTabBar(animated: Bool = true) -> some View {
        return self.modifier(ShowTabBar(animated: animated))
    }
    func hideTabBar(animated: Bool = true) -> some View {
        return self.modifier(HiddenTabBar(animated: animated))
    }

    func shouldHideTabBar(_ hidden: Bool, animated: Bool = true) -> AnyView {
        if hidden {
            return AnyView(hideTabBar(animated: animated))
        } else {
            return AnyView(showTabBar(animated: animated))
        }
    }
}

struct HiddenTabBar: ViewModifier {
    var animated = true

    func body(content: Content) -> some View {
        return content.padding(.zero).onAppear {
            UITabBar.hideTabBar(animated: animated)
        }
    }
}

struct ShowTabBar: ViewModifier {
    var animated = true
    func body(content: Content) -> some View {
        return content.padding(.zero).onAppear {
            UITabBar.showTabBar(animated: animated)
        }
    }
}

extension UIView {
     func makeCornerTabBar(shadowColor: UIColor = UIColor.black,
                     fillColor: UIColor = UIColor.white,
                     opacity: Float = 0.2,
                     corners: UIRectCorner,
                     offset: CGSize = CGSize(width: 0.0, height: 5.0),
                           radius: CGFloat = 0.0, cornerRadius: CGFloat) -> CAShapeLayer {
    
      let shadowLayer = CAShapeLayer()
      shadowLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
      shadowLayer.fillColor = fillColor.cgColor
      shadowLayer.shadowColor = shadowColor.cgColor
      shadowLayer.shadowPath = shadowLayer.path
      shadowLayer.shadowOffset = offset
      shadowLayer.shadowOpacity = opacity
      shadowLayer.cornerRadius = 20.0
      layer.mask = shadowLayer
      layer.insertSublayer(shadowLayer, at: 0)
      return shadowLayer
   }
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

struct TagCloudView: View {
    var tags: [String]

    @State private var totalHeight
          = CGFloat.zero       // << variant for ScrollView/List
    //    = CGFloat.infinity   // << variant for VStack

    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)// << variant for ScrollView/List
        //.frame(maxHeight: totalHeight) // << variant for VStack
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.tags, id: \.self) { tag in
                self.item(for: tag)
                    .padding(.horizontal, 4)
                    .padding(.bottom, 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == self.tags.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag == self.tags.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func item(for text: String) -> some View {
        HStack{
            if feelingIconDict[text] != nil {
            Text(feelingIconDict[text]!)
                .font(.title2)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            Text(text)
                .font(.body)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .foregroundColor(Color(hex: "FF9999")!)
            }else if activityIconDict[text] != nil  {
                Image(systemName: activityIconDict[text]!)
                    .font(.title2)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .foregroundColor(Color(hex: "FF9999")!)
                Text(text)
                    .font(.body)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .foregroundColor(Color(hex: "FF9999")!)
            }

        }
        .frame(minWidth: 50, maxWidth: 102, minHeight: 30, maxHeight: 30, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 25)
               .fill(Color(hex: "EEEFFC")!)
                )
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

extension Color {
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        let length = hexSanitized.count

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }

        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0

        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0

        } else {
            return nil
        }

        self.init(red: r, green: g, blue: b, opacity: a)
    }
}
