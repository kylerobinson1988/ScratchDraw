//
//  ViewController.swift
//  ScratchDraw
//
//  Created by Kyle Brooks Robinson on 5/14/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

var publicSliderSetting = 0.0

class ViewController: UIViewController {

    enum isStrokeFill {
        
        case Stroke
        case Fill
 
    }
    
//    var strokeOrFill: isStrokeFill.Stroke
    
    
    
    @IBOutlet weak var scratchPad: ScratchView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scratchPad)
        
//        scratchPad.frame = view.frame
//        scratchPad.backgroundColor = UIColor.whiteColor()

    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        if let touch = touches.first as? UITouch {
            
            let location = touch.locationInView(scratchPad)
            
            scratchPad.newScratchWithStartPoint(location)
            
            println(scratchPad.scratches)
            println(scratchPad.scratches.count)
        }
        
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        if let touch = touches.first as? UITouch {
            
            let location = touch.locationInView(scratchPad)
//            scratchPad.updateCurrentLineWithLastPoint(location)
            scratchPad.addPointToCurrentScratch(location)
            
//            println(scratchPad.scratches)
        }
        
        
        
    }
    
    
    @IBAction func changeColor(sender: UIButton) {
        
        if let color = sender.backgroundColor {
            
            scratchPad.currentColor = color
            
        }
        
        
    }
    
    
    
    @IBAction func undoLine(sender: AnyObject) {
        
//        println("Scratches count \(scratchPad.scratches.count)")
        
        if scratchPad.scratches.count > 0 {
        
            var removedLine = scratchPad.scratches.removeLast()
//            println("Removed line \(removedLine.points.count)")
            scratchPad.setNeedsDisplay()
            
        }
    }
    
    @IBAction func clearLines(sender: AnyObject) {
        
        scratchPad.scratches = []
        scratchPad.setNeedsDisplay()
        
        
        
    }
    
    @IBAction func strokeFillSegment(sender: AnyObject) {
        
        var strokeTrueFillFalse = true
         
        
            
        }
        
    @IBAction func thicknessSlider(sender: UISlider) {
        
        
            var sliderSetting = sender.value
        publicSliderSetting = Double(sliderSetting)
        

        
        
    
    

    }
}

