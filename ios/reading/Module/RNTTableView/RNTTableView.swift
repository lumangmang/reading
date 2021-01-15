//
//  RNTTableView.swift
//  reading
//
//  Created by Devin on 2021/1/15.
//

import UIKit

@objcMembers
public class RNTTableView: UIView {
  public var color: UIColor = .white {
    didSet {
      self.backgroundColor = color;
    }
  }
  
  public var onClick: RCTBubblingEventBlock?
  public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    onClick?(nil)
  }
}
