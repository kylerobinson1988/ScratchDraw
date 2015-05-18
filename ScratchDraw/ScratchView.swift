//
//  ScratchView.swift
//  ScratchDraw
//
//  Created by Kyle Brooks Robinson on 5/14/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

enum ShapeType {
    case Line
    case Ellipse
    case Rectangle
}

var publicShapeType = ShapeType.Line {
    didSet {
        
    }
}

class ScratchView: UIView {
    
    
    var scratches: [Scratch] = []
    var currentStrokeColor = UIColor.blackColor()
    var currentFillColor = UIColor.blackColor()
    var shapeType = publicShapeType

    
    override func drawRect(rect: CGRect) {
        
            var context = UIGraphicsGetCurrentContext()
            
            CGContextSetLineWidth(context, 5.0)
            CGContextSetLineCap(context, kCGLineCapRound)
            
            UIColor.blackColor()
            
            for scratch in scratches {
                
                if publicStrokeTrueFillFalse == true {
                    
                    if let firstPoint = scratch.points.first {
                        
                        if let strokeColor = scratch.strokeColor {
                            
                            strokeColor.set()
                            
                            CGContextMoveToPoint(context, firstPoint.x, firstPoint.y)
                            
                            for point in scratch.points {
                                
                               
                                
                                switch shapeType {

                                case .Line:
                                        
                                    CGContextSetLineWidth(context, CGFloat(scratch.strokeSize))
                                    CGContextAddLineToPoint(context, point.x, point.y)
                                    println("I'm drawing a line")
                                    
                                case .Ellipse:
                                    
                                    CGContextAddArc(context, point.x, point.y, CGFloat(scratch.strokeSize), 0.0, CGFloat(M_PI * 2.0), 1)
                                    println("I'm drawing a circle")
                                    
                                case .Rectangle:
                                    
                                    CGContextAddRect(context, rect)
                                    println("I'm drawing a rectangle")
                                    
                              
                                default:
                                    
                                    break
                                    
                                
                            }
                            
                            CGContextStrokePath(context)
                            
                        }
                        
                    }
                    
                } else {
                    
                    if let firstPoint = scratch.points.first {
                        
                        if let fillColor = scratch.fillColor {
                            
                            fillColor.set()
                            
                            CGContextMoveToPoint(context, firstPoint.x, firstPoint.y)
                            
                            for point in scratch.points {
                                
                                switch shapeType {
                                    
                                case .Line:
                                    
                                    CGContextSetLineWidth(context, CGFloat(scratch.strokeSize))
                                    CGContextAddLineToPoint(context, point.x, point.y)
                                    println("I'm drawing a line")
                                    
                                case .Ellipse:
                                    
                                    CGContextAddArc(context, point.x, point.y, CGFloat(scratch.strokeSize), 0.0, CGFloat(M_PI * 2.0), 1)
                                    println("I'm drawing a circle")
                                    
                                case .Rectangle:
                                    
                                    // What do i need for the second parameter below: rect: CGRect  ?
                                    CGContextAddRect(context, rect)
                                    println("I'm drawing a rectangle")
                                    
                                    //    CGContextAddLineToPoint(<#c: CGContext!#>, <#x: CGFloat#>, <#y: CGFloat#>)
                                    //    CGContextAddRect(<#c: CGContext!#>, <#rect: CGRect#>)

                                
                            }
                            
                            CGContextFillPath(context)
                            
                            
                            }
                        
                        }
                    
                    }
                
                }
            
            }
        
        }
    
    }
    
    func newScratchWithStartPoint(point: CGPoint) {
        
        
        var scratch = Scratch()
        scratch.points = [point,point]
        
        
        scratch.strokeColor = currentStrokeColor
        scratch.fillColor = currentFillColor
        scratch.strokeSize = publicSliderSetting
        
        
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
        var strokeSize: Double = 5.0
    
    // line dash
        
    // line cap
    // line join
    
    
}









