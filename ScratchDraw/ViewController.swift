//
//  ViewController.swift
//  ScratchDraw
//
//  Created by Kyle Brooks Robinson on 5/14/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

var fillColors: [UIColor] = [
    UIColor.blackColor(),
    UIColor.grayColor(),
    UIColor.redColor(),
    UIColor.orangeColor(),
    UIColor.yellowColor(),
    UIColor.greenColor(),
    UIColor.blueColor(),
    UIColor.cyanColor(),
    UIColor.purpleColor()
]

var strokeColors: [UIColor] = [

    UIColor.blackColor(),
    UIColor.grayColor(),
    UIColor.redColor(),
    UIColor.orangeColor(),
    UIColor.yellowColor(),
    UIColor.greenColor(),
    UIColor.blueColor(),
    UIColor.cyanColor(),
    UIColor.purpleColor(),
]

var publicSliderSetting = 5.0
var publicStrokeTrueFillFalse = true

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var viewBottomConstraint: NSLayoutConstraint!
    
 
    @IBOutlet weak var fillColorCollectionView: FillCollectionView!
    
    @IBOutlet weak var strokeColorCollectionView: UICollectionView!
    
    @IBOutlet weak var scratchPad: ScratchView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillColorCollectionView.dataSource = self
        fillColorCollectionView.delegate = self
        
        strokeColorCollectionView.dataSource = self
        strokeColorCollectionView.delegate = self
        
        
        
        viewBottomConstraint.constant = -300
        
        
        view.addSubview(scratchPad)
        
//        scratchPad.frame = view.frame
//        scratchPad.backgroundColor = UIColor.whiteColor()

    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let cell1 = collectionView.cellForItemAtIndexPath(indexPath) as! ColorCell1
        
        if let color = cell1.backgroundColor {
            
            scratchPad.currentStrokeColor = color
            
        }
        

        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            return strokeColors.count
    
    }
    
    func collectionView2(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //            return fillColors.count
        return fillColors.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell1 = collectionView.dequeueReusableCellWithReuseIdentifier("colorCell1", forIndexPath: indexPath) as! ColorCell1
        
        cell1.backgroundColor = strokeColors[indexPath.item]
        
        cell1.layer.cornerRadius = 3
        
        return cell1
        
    }
    
//    func collectionView2(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//            
//        let cell2 = collectionView2.dequeueReusableCellWithReuseIdentifier("colorCell2", forIndexPath: indexPath) as! ColorCell2
//            
//        cell2.backgroundColor = fillColors[indexPath.item]
//        cell2.layer.cornerRadius = 3
//        return cell2
//            
//        }
//    

    

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
    
    

        
        
    
    
    
    
    @IBAction func undoLine(sender: AnyObject) {
        
        println("Scratches count \(scratchPad.scratches.count)")
        
        if scratchPad.scratches.count > 0 {
        
            var removedLine = scratchPad.scratches.removeLast()
            println("Removed line \(removedLine.points.count)")
            scratchPad.setNeedsDisplay()
            
        }
    }
    
    @IBAction func clearLines(sender: AnyObject) {
        
        scratchPad.scratches = []
        scratchPad.setNeedsDisplay()
        
        
        
    }
    
    @IBAction func showHide(sender: AnyObject) {
        
        viewBottomConstraint.constant = (viewBottomConstraint.constant == 0) ? -300 : 0
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in })
        
        
        
    }
    
    @IBOutlet weak var lineThicknessSlider: UISlider!
    
    @IBAction func lineThicknessSlider(sender: UISlider) {
        
        var sliderSetting = sender.value
        publicSliderSetting = Double(sliderSetting)
    }
    
    
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    
    @IBAction func strokeTrueFillFalse(sender: UISegmentedControl) {
        
      
        
        switch segmentOutlet.selectedSegmentIndex {
            
        case 0:
            
            publicStrokeTrueFillFalse = true
            println("Stroke mode")
            
        case 1:
            
            publicStrokeTrueFillFalse = false
            println("Fill mode")
            
        default:
            
            break
            
        }
    }
    
    @IBOutlet weak var shapeSelectOutlet: UISegmentedControl!
    
    @IBAction func shapeSelectAction(sender: UISegmentedControl) {
        
        switch shapeSelectOutlet.selectedSegmentIndex {
            
        case 0:
            
            scratchPad.shapeType = ShapeType.Line
            println("Line mode")
            println("You selected line")
    
            
        case 1:
            
            scratchPad.shapeType = ShapeType.Ellipse
            println("Ellipse mode")
            println("you selected ellipse.")

            
        case 2:
            
            scratchPad.shapeType = ShapeType.Rectangle
            println("Rectangle mode")
            println("you selected rectangle")

            
        case 3:
            
            scratchPad.shapeType = ShapeType.Triangle
            
            
        }
        
        
        
        
    }
    

}

