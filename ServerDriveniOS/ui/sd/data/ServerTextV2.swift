//
//  ServerTextV2.swift
//  ServerDriveniOS
//
//  Created by mustafa.alkan on 2.11.2022.
//

import Foundation
import SwiftUI

struct ServerTextV2: ServerView {
    var type: ServerItemType = .TEXT_V2
    var id = UUID()
    var isHeading: Bool?
    var modifier: ServerModifier?
    var textAlignment: ServerTextAlignment?
    var styledTexts: [ServerStyledText] = []
    @available(iOS 15, *)
    func getAttributedString()->AttributedString{
        var saverAttributes = AttributedString("")
        styledTexts.forEach { attributeds in
            saverAttributes.append(attributeds.toAttributedString())
        }
        return saverAttributes
    }
}

struct ServerStyledText {
    var text: String
    var size: Int?
    var style: FontType?
    var color: String?
    var backgroundColor: String?
    var letterSpacing: CGFloat?
    var decoration: [DecorationType] = []
    var weight: String?
    
    @available(iOS 15, *)
    func toAttributedString()->AttributedString{
        var attributedString: AttributedString = AttributedString(text)
        attributedString.foregroundColor = fontColor()
        if backgroundColor != nil
        {
            attributedString.backgroundColor = textBackgroundColor()
        }
        attributedString.font = font()
        if letterSpacing != nil{
            attributedString.kern = letterSpacing!
        }
        for deco in decoration
        {
            if deco == DecorationType.STRIKETHROUGH
            {
                attributedString.strikethroughColor = attributedString.foregroundColor
                attributedString.strikethroughStyle = .single
            }
            else if deco == DecorationType.UNDERLINE{
                attributedString.underlineColor = attributedString.foregroundColor
                attributedString.underlineStyle = .single
            }
        }
        return attributedString
    }
    
    func fontWeight() -> Font.Weight {
        switch weight {
        case "100": return .light
        case "200": return .light
        case "300": return .light
        case "400": return .regular
        case "500": return .medium
        case "600": return .semibold
        case "700": return .bold
        case "800": return .heavy
        case "900": return .black
        default: return .regular
        }
    }
    
    func uiFontWeight() -> UIFont.Weight {
        switch weight {
        case "100": return .light
        case "200": return .light
        case "300": return .light
        case "400": return .regular
        case "500": return .medium
        case "600": return .semibold
        case "700": return .bold
        case "800": return .heavy
        case "900": return .black
        default: return .regular
        }
    }
    
    func font()->UIFont{
        return fontWithSize(size: fontSize(), fontStyle: style ?? FontType.NORMAL)
    }
    
    func fontWithSize(size:CGFloat, fontStyle:FontType)->UIFont{
        if fontStyle == FontType.ITALIC
        {
            return .italicSystemFont(ofSize: UIFontMetrics.default.scaledValue(for: size), weight: uiFontWeight())
        }
        else{
            
            return  UIFont.systemFont(ofSize: UIFontMetrics.default.scaledValue(for: size), weight: uiFontWeight())
        }
    }
    
    func fontColor() -> Color{
        guard let c = color else{return Color.black}
        return Color(UIColor(withHex: c))
    }
    
    func textBackgroundColor() -> Color{
        guard let c = backgroundColor else{return Color.clear}
        return Color(UIColor(withHex: c))
    }
    
    func fontSize() -> CGFloat{
        return CGFloat(size ?? 16)
    }
}

extension UIFont {
    
    class func italicSystemFont(ofSize size: CGFloat, weight: UIFont.Weight = .regular)-> UIFont {
        let font = UIFont.systemFont(ofSize: size, weight: weight)
        switch weight {
        case .ultraLight, .light, .thin, .regular:
            return font.withTraits(.traitItalic, ofSize: size)
        case .medium, .semibold, .bold, .heavy, .black:
            return font.withTraits(.traitBold, .traitItalic, ofSize: size)
        default:
            return UIFont.italicSystemFont(ofSize: size)
        }
    }
    
    func withTraits(_ traits: UIFontDescriptor.SymbolicTraits..., ofSize size: CGFloat) -> UIFont {
        let descriptor = self.fontDescriptor
            .withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits))
        return UIFont(descriptor: descriptor!, size: size)
    }
}
