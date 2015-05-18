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
    UIColor.purpleColor(),
]

var publicSliderSetting = 5.0

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var viewBottomConstraint: NSLayoutConstraint!
    
 
    @IBOutlet weak var fillColorCollectionView: UICollectionView!
    
    @IBOutlet weak var scratchPad: ScratchView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillColorCollectionView.dataSource = self
        fillColorCollectionView.delegate = self
        
        viewBottomConstraint.constant = -300
        
        
        view.addSubview(scratchPad)
        
//        scratchPad.frame = view.frame
//        scratchPad.backgroundColor = UIColor.whiteColor()

    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! ColorCell
        
        if let color = cell.backgroundColor {
            
            scratchPad.currentColor = color
            
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            return fillColors.count
    
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("colorCell", forIndexPath: indexPath) as! ColorCell
        
        cell.backgroundColor = fillColors[indexPath.item]
        
        return cell
        
        
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
            scratchPad.updateCurrentScratchWithLastPoint(location)
//            scratchPad.addPointToCurrentScratch(location)
            
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
    

}

