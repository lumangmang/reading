//
//  RNTPageViewManager.swift
//  reading
//
//  Created by Devin on 2021/1/18.
//

import Foundation

@objc(RNTPageViewManager)
class RNTPageViewManager: RCTViewManager {
  
  override func view() -> UIView! {
    return RNTPageView()
  }
  
  override class func requiresMainQueueSetup() -> Bool {
    return true
  }
  
}

