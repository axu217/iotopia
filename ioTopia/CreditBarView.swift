//
//  CreditBarView.swift
//  ioTopia
//
//  Created by AXE07 on 10/28/16.
//  Copyright © 2016 ZheChengXu. All rights reserved.
//

import UIKit

class CreditBarView: UIView {
    
    var barValue: Int = 0;
    var barMax: Int = 0;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(rect: rect)
        UIColor.darkGray.setFill()
        path.fill()
        
        //let rectTop = rect.maxY
        let rectLeft = rect.origin.x
        
        let rectOrigin = rect.origin
        let rectTop = rectOrigin.y
        let rectHeight = rect.height
        
        
        let percentage = CGFloat(barValue) / CGFloat(barMax)
        
        let difference = (1-percentage) * rectHeight
        
        let newHeight = percentage * rectHeight
        
        let point = CGPoint(x: rectLeft, y: rectTop + difference)
        let size = CGSize(width: rect.width, height: newHeight)
        let rectNew = CGRect(origin: point, size: size)
        
        print("newTop")
        print(rectNew.origin.y)
        
        print("newTopOriginal")
        print(rect.origin.y)
        
        
        
        
        let path2 = UIBezierPath(rect: rectNew)
        UIColor(red:0.00, green:0.63, blue:0.52, alpha:1.0).setFill()
        path2.fill()
        
        
    }
    
    func setBarValue(temp: Int) {
        barValue = temp
    }
    
    func setBarMax(temp: Int) {
        barMax = temp
    }
}
