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
    
    
    override func drawRect(rect: CGRect) {
        
        var context = UIGraphicsGetCurrentContext()
        
        CGContextSetLineWidth(context, 5.0)
        CGContextSetLineCap(context, kCGLineCapRound)
        
        UIColor.blackColor()
        
        for scratch in scratches {
            
            if let firstPoint = scratch.points.first {
                
                switch scratch.type {
                    
                case .Ellipse:
                    
                    scratch.drawEllipseWithContext(context)
                    
                case .Line:
                    
                    scratch.drawLineWithContext(context)
                    
                case .Rect:
                    
                    scratch.drawRectWithContext(context)
                    
                case .Triangle:
                    
                    scratch.drawTriangleWithContext(context)
                    
                }
                
                
                
            }
            
        }
        
    }
    
    
    
    
    func newScratchWithStartPoint(point: CGPoint) {
        
        
        var scratch = Scratch()
        scratch.points = [point,point]
        
        
        scratch.strokeColor = currentColor
        scratch.fillColor = currentColor
        scratch.strokeSize = publicSliderSetting
        scratch.type = .Triangle
        
        
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

enum ShapeType {
    
    case Line
    case Rect
    case Ellipse
    case Triangle
    
}

class Scratch {
    
    var points: [CGPoint] = []
    var fillColor: UIColor?
    var strokeColor: UIColor?
    var strokeSize: Double = 5.0
    var type: ShapeType = .Line
    
    // line dash
    
    // line cap
    // line join
    
    // Possible functions for drawing the shapes.
    func drawLineWithContext(context: CGContextRef) {
        
        if let fillColor = fillColor {
            
            fillColor.set()
            
            CGContextMoveToPoint(context, points[0].x, points[0].y)
            
            for point in points {
                
                CGContextAddLineToPoint(context, point.x, point.y)
                
                
            }
            
            //                        CGContextFillPath(context)
            CGContextStrokePath(context)
            
            
            
        }
        
    }
    
    func drawEllipseWithContext(context: CGContextRef) {
        
        if let fillColor = fillColor {
            
            fillColor.set()
            
            let x = points[0].x
            let y = points[0].y
            
            let width = points[1].x - points[0].x
            let height = points[1].y - points[0].y
            
            let rect = CGRectMake(x, y, width, height)
            
            CGContextFillEllipseInRect(context, rect)
            
            
        }
        
        
    }
    
    func drawRectWithContext(context: CGContextRef) {
        
        if let fillColor = fillColor {
            
            fillColor.set()
            
            let x = points[0].x
            let y = points[0].y
            
            let width = points[1].x - points[0].x
            let height = points[1].y - points[0].y
            
            let rect = CGRectMake(x, y, width, height)
            
            CGContextFillRect(context, rect)
            
            
        }
        
        
    }
    
    func drawTriangleWithContext(context: CGContextRef) {
        if let fillColor = fillColor {
            
            fillColor.set()
            
            CGContextMoveToPoint(context, points[1].x, points[1].y)
            
            CGContextAddLineToPoint(context, points[0].x, points[1].y)
            
            let midX = (points[0].x + points[1].x) / 2.0
            
            CGContextAddLineToPoint(context, midX, points[0].y)
            
            // Will automatically fill in line from last point to first point
            
            CGContextAddLineToPoint(context, points[1].x, points[1].y)
            
            CGContextFillPath(context)
            
        }
    }
    
    
    
}











