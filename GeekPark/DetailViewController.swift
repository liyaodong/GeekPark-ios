//
//  SwipeViewController.swift
//  GeekPark
//
//  Created by 朱坤 on 3/25/16.
//  Copyright © 2016 GeekPark. All rights reserved.
//

import UIKit

//给所有的子页面添加右划返回功能
class DetailViewController: UIViewController {
  //应该使用swipeGesture
  var guesture: UIPanGestureRecognizer?

  override func viewDidLoad() {
    super.viewDidLoad()
    guesture = UIPanGestureRecognizer(target: self, action: #selector(DetailViewController.handleSwipe(_:)))
    view.addGestureRecognizer(guesture!)
  }

  func handleSwipe(recog: UIPanGestureRecognizer){
    let isright = recog.velocityInView(view).x > 0
    if isright {
      self.navigationController?.popViewControllerAnimated(true)
    }
  }
}

