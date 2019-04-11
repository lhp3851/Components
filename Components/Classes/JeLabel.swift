//
//  JeLabel.swift
//  Components_Example
//
//  Created by sumian on 2019/4/10.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

extension String {
    // 指定文本高度，计算文本的宽度
    func width(withConstraniedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin,.truncatesLastVisibleLine], attributes: [.font: font], context: nil)
        return ceil(boundingBox.width)
    }
}

class JeLabel: UILabel {

    var edgeInsets: UIEdgeInsets? = UIEdgeInsetsMake(10, 10, -10, 10)
    
    override func draw(_ rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, self.edgeInsets!))
    }
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        if let inset = self.edgeInsets {
            var frame = super.textRect(forBounds: UIEdgeInsetsInsetRect(bounds, inset), limitedToNumberOfLines: numberOfLines)
            frame.origin.x -= inset.left
            frame.origin.y -= inset.top
            frame.size.width += (inset.left + inset.right)
            frame.size.height += (inset.top + inset.bottom)
            return frame
        }
        else{
            return self.frame
        }
    }
    
    /// 内容均匀分布，文字间隔一致
    ///
    /// - Parameter width: 固定宽度
    func textWithWidth(width:CGFloat) {
        if let text = self.text,!text.isEmpty {
            let textWidth = text.width(withConstraniedHeight: .greatestFiniteMagnitude, font: self.font)
            let count = text.count
            let length = count - 1
            let margin = fabs((width - textWidth))/CGFloat(length)
            let attrs = [NSAttributedStringKey.font:self.font,
                         NSAttributedStringKey.kern:margin] as [NSAttributedStringKey : Any]
            let attrText = NSMutableAttributedString.init(string: text, attributes: attrs)
            self.attributedText = attrText
            self.sizeToFit()
        }
    }
    
    func adjustFrame()  {
        if let _ = self.text {
            self.numberOfLines = 0
            self.lineBreakMode = .byTruncatingTail
            self.sizeToFit()
        }
    }
    
    
    /// 测试 内容边界计算方法
    ///
    /// - Parameter btn: UIButton
    func testSizeFit(btn:UIButton)  {
        btn.isSelected = !btn.isSelected
        if btn.isSelected {
            let size = btn.sizeThatFits(CGSize.init(width: 80, height: 150))
            let titleSize = btn.titleLabel?.text!.boundingRect(with: size,
                                                               options: .usesLineFragmentOrigin,
                                                               attributes: [NSAttributedStringKey.font : btn.titleLabel?.font],
                                                               context: nil)
            let rect = btn.titleLabel?.textRect(forBounds: btn.frame, limitedToNumberOfLines: 2)
            
            print("btn.frame:",btn.frame,
                  "fontSize:",btn.titleLabel?.font.lineHeight,
                  "size:",size,
                  "rect:",rect,
                  "titleSize:",titleSize)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                btn.frame = rect ?? btn.frame
            }
        }
        else{
            print("before btn.frame:",btn.frame)
            btn.sizeToFit()
            print("after btn.frame:",btn.frame)
        }
    }

}
