//
//  RNTTableViewManager.swift
//  reading
//
//  Created by Devin on 2021/1/15.
//

import Foundation

@objc(RNTTableViewManager)
class RNTTableViewManager: RCTViewManager {
  
  override class func requiresMainQueueSetup() -> Bool {
      return true
  }

  override func view() -> UIView! {
    return RNTTableView()
  }
  
  func color(_ reactTag: NSNumber, color: UIColor) {
    self.execute(reactTag: reactTag) { (tableView) in
      tableView.backgroundColor = color
    }
  }
  
  private func execute(reactTag: NSNumber,action:  @escaping ((RNTTableView) -> Void)) {
    bridge.uiManager.addUIBlock { (uiManager, viewRegistry) in
      if let view = viewRegistry![reactTag] as? RNTTableView {
        action(view)
      }
    }
  }
}
