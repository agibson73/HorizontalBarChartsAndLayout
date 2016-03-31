//
//  HorizontalDesignableBarChart.swift
//  HorizontalBarChartsAndLayout
//
//  Created by Alex Gibson on 3/30/16.
//  Copyright © 2016 AG. All rights reserved.
//

import UIKit

@IBDesignable
class HorizontalDesignableBarChart: UIView{

    @IBInspectable var chartValue : CGFloat = 0.0{
        didSet{
            setNeedsDisplay()
        }
    }
    @IBInspectable var chartFillColor : UIColor = UIColor.lightGrayColor(){
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var chartGraphColor : UIColor = UIColor.greenColor(){
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable override var backgroundColor: UIColor?{
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
   
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        
        let context = UIGraphicsGetCurrentContext();
        CGContextClearRect(context, rect);
        
        let bezierPath = UIBezierPath(rect: rect)
        CGContextSetFillColorWithColor(context, chartFillColor.CGColor);
        bezierPath.fill()
        CGContextSetFillColorWithColor(context, chartGraphColor.CGColor);
        let graphRect = CGRectMake(rect.origin.x, rect.origin.y, rect.width * chartValue, rect.height)
        
        let graphPath = UIBezierPath(rect: graphRect)
        graphPath.fill()
        
    }
    
}
