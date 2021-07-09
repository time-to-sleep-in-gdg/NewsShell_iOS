//
//  SubClasses.swift
//  NewsShell
//
//  Created by 김수완 on 2021/07/10.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import UIKit


protocol PinterestLayoutDelegate: AnyObject {
  // 1. Method to ask the delegate for the height of the image
  func collectionView(_ collectionView:UICollectionView, _ indexPath:IndexPath) -> CGFloat
}

class PinterestLayout: UICollectionViewLayout {
  //1. Pinterest Layout Delegate
  weak var delegate: PinterestLayoutDelegate!
  
  //2. Configurable properties
  fileprivate var numberOfColumns = 2
  fileprivate var cellPadding: CGFloat = 6
  
  //3. Array to keep a cache of attributes.
  fileprivate var cache = [UICollectionViewLayoutAttributes]()
  
  //4. Content height and size
  fileprivate var contentHeight: CGFloat = 0
  
  fileprivate var contentWidth: CGFloat {
    guard let collectionView = collectionView else {
      return 0
    }
    let insets = collectionView.contentInset
    return collectionView.bounds.width - (insets.left + insets.right)
  }
  
  override var collectionViewContentSize: CGSize {
    return CGSize(width: contentWidth, height: contentHeight)
  }
  
  override func prepare() {
    // 1. Only calculate once
    guard cache.isEmpty == true, let collectionView = collectionView else {
      return
    }
    // 2. Pre-Calculates the X Offset for every column and adds an array to increment the currently max Y Offset for each column
    let columnWidth = contentWidth / CGFloat(numberOfColumns)
    var xOffset = [CGFloat]()
    for column in 0 ..< numberOfColumns {
      xOffset.append(CGFloat(column) * columnWidth)
    }
    print(xOffset)
    var column = 0
    
    
    let indexPath = IndexPath(item: 0, section: 0)
    let cellHeight = delegate.collectionView(collectionView, indexPath)
    let height = cellPadding * 2 + cellHeight
    let frame = CGRect(x: xOffset[column], y: 0.0, width: contentWidth, height: height)
    let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
    let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
    attributes.frame = insetFrame
    cache.append(attributes)
    contentHeight = max(contentHeight, frame.maxY)
    column = 0
    
    var yOffset = [CGFloat](repeating: 172, count: numberOfColumns)
    for item in 1 ..< collectionView.numberOfItems(inSection: 0) {
      
      let indexPath = IndexPath(item: item, section: 0)
      
      // 4. Asks the delegate for the height of the picture and the annotation and calculates the cell frame.
      let cellHeight = delegate.collectionView(collectionView, indexPath)
      let height = cellPadding * 2 + cellHeight
      let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
      let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
      
      // 5. Creates an UICollectionViewLayoutItem with the frame and add it to the cache
      let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
      attributes.frame = insetFrame
      cache.append(attributes)
      
      // 6. Updates the collection view content height
      contentHeight = max(contentHeight, frame.maxY)
      yOffset[column] = yOffset[column] + height
      
      column = column < (numberOfColumns - 1) ? (column + 1) : 0
    }
  }
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    
    var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
    
    // Loop through the cache and look for items in the rect
    for attributes in cache {
      if attributes.frame.intersects(rect) {
        visibleLayoutAttributes.append(attributes)
      }
    }
    return visibleLayoutAttributes
  }
  
  override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    return cache[indexPath.item]
  }
  
}
