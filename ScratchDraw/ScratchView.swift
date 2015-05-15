//
//  ScratchView.swift
//  ScratchDraw
//
//  Created by Kyle Brooks Robinson on 5/14/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class ScratchView: UIView {
    
    
    var scratches: [Scratch] = []
    var currentColor = UIColor.blackColor()
//    var linesize = 5.0
    
    override func drawRect(rect: CGRect) {
        
        var context = UIGraphicsGetCurrentContext()
        
        CGContextSetLineWidth(context, CGFloat(5.0))
        CGContextSetLineCap(context, kCGLineCapRound)
        
//        myCGColor = CGColor
        
//        CGCOntextSetfillColorWithColor(context, currentColor)
        
        UIColor.blackColor()
        
        for scratch in scratches {
                
                if let firstPoint = scratch.points.first {
                    
                    
                    
                    if let fillColor = scratch.strokeColor {
                        
                        fillColor.set()
                        
                        CGContextMoveToPoint(context, firstPoint.x, firstPoint.y)
                        
                        for point in scratch.points {
                            
                            CGContextSetLineWidth(context, CGFloat(scratch.strokeSize))
                            CGContextAddLineToPoint(context, point.x, point.y)
                        
                        }
                        
                        CGContextFillPath(context)
                        
//                    }
//                
//                    if let strokeColor = scratch.strokeColor {
//                        
//                        strokeColor.set()
//                        
//                        CGContextMoveToPoint(context, firstPoint.x, firstPoint.y)
//                        
//                        for point in scratch.points {
//                            
//                            CGContextSetLineWidth(context, CGFloat(scratch.strokeSize))
//                            CGContextAddLineToPoint(context, point.x, point.y)
//                            
//                        }
//                        
//                        CGContextStrokePath(context)
//                        
                    }

                    
                    
                    
                }
                
            }
            
        }
        
    
    
    
    func newScratchWithStartPoint(point: CGPoint) {
        
        var scratch = Scratch()
        scratch.points = [point,point]
        
        scratch.strokeSize = publicSliderSetting
        scratch.strokeColor = currentColor
        scratch.fillColor = currentColor
        
        scratches.append(scratch)
        setNeedsDisplay()
        
    }
    
    func updateCurrentScratchWithLastPoint(point: CGPoint) {
        
        if scratches.last != nil {
            
           scratches[scratches.count - 1 ].points[1] = point
            setNeedsDisplay()
            
            
        }
        
        
    }
    
    func addPointToCurrentScratch(point: CGPoint) {
        
        if scratches.count > 0 {

            scratches[scratches.count - 1 ].points.append(point)
            setNeedsDisplay()

        }
    
    }
}

class Scratch {
    
        var points: [CGPoint] = []
        var fillColor: UIColor?
        var strokeColor: UIColor?
        var strokeSize: Double = 0
    
    // line dash
        
    // line cap
    // line join
    
    
}











