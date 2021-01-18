//
//  RNTPageView.swift
//  reading
//
//  Created by Devin on 2021/1/18.
//

import Foundation

@objcMembers
class RNTPageView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(pageView)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    pageView.frame = bounds
  }
  
  public var autoScrollTimeInterval: CGFloat = 2 {
    didSet {
      pageView.autoScrollTimeInterval = autoScrollTimeInterval
    }
  }
  
  public var imageURLStringsGroup: [String] = [] {
    didSet {
      pageView.imageURLStringsGroup = imageURLStringsGroup
    }
  }
  
  public var onClick: RCTBubblingEventBlock?
  
  private lazy var pageView: SDCycleScrollView = {
    let pageView = SDCycleScrollView()
    pageView.autoScroll = true
    pageView.autoScrollTimeInterval = 2
    pageView.showPageControl = true
    pageView.delegate = self
    return pageView
  }()
}

extension RNTPageView: SDCycleScrollViewDelegate {
  func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
    if let click = onClick {
      click(
        ["index": index]
      )
    }
  }
}
