//
//  ViewController.swift
//  CapturingReferenceTypes
//
//  Created by Scott Gardner on 3/27/16.
//  Copyright © 2016 Scott Gardner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var random: CGFloat {
    return CGFloat(drand48())
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    srand48(time(nil))
  }
  
  @IBAction func handleRefreshButtonTapped(_: AnyObject) {
    
    let backgroundColor = UIColor(red: random, green: random, blue: random, alpha: 1.0)
    
    UIView.animateWithDuration(0.3) {
      self.view.backgroundColor = backgroundColor
    }
    
  }
  
}
