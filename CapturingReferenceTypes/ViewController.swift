//
//  ViewController.swift
//  CapturingReferenceTypes
//
//  Created by Scott Gardner on 3/27/16.
//  Copyright © 2016 Scott Gardner. All rights reserved.
//

import UIKit
import Async
import RxSwift
import RxCocoa

class ViewController: UIViewController {
  
  @IBOutlet weak var refreshButton: UIBarButtonItem!
  
  var random: CGFloat {
    return CGFloat(drand48())
  }
  
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    srand48(time(nil))
    
    refreshButton.rx_tap
      .bindNext { [unowned self] in
        
        let backgroundColor = UIColor(red: self.random, green: self.random, blue: self.random, alpha: 1.0)

        Async.main(after: 5.0) {
          
          UIView.animateWithDuration(0.3) {
            self.view.backgroundColor = backgroundColor
            print("animateWithDuration(_:animations:) was executed")
          }
          
        }
      }
      .addDisposableTo(disposeBag)
  }
  
  deinit {
    print("ViewController will be deallocated")
  }
  
}
