//
//  SubClasses.swift
//  NewsShell
//
//  Created by 김수완 on 2021/07/10.
//  Copyright © 2021 com.timeToSleep. All rights reserved.
//

import UIKit


protocol PinterestLayoutDelegate: AnyObject {
    func collectionView(
        _ collectionView: UICollectionView,
        _ indexPath: IndexPath) -> CGFloat
}

class PinterestLayout: UICollectionViewLayout {
    weak var delegate: PinterestLayoutDelegate?
    
    private let numberOfColumns = 2
    private let cellPadding: CGFloat = 10
    
    private var cache: [UICollectionViewLayoutAttributes] = []
    
    private var contentHeight: CGFloat = 0
    
    private var contentWidth: CGFloat {
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
        // 1
        guard
            cache.isEmpty,
            let collectionView = collectionView
        else {
            return
        }
        // 2
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset: [CGFloat] = []
        for column in 0..<numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        var column = 0
        var yOffset: [CGFloat] = .init(repeating: 0, count: numberOfColumns)
        
        // 3
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            
            // 4
            let photoHeight = delegate?.collectionView(
                collectionView,
                indexPath) ?? 180
            let height = cellPadding * 2 + photoHeight
            let frame = CGRect(x: xOffset[column],
                               y: yOffset[column],
                               width: columnWidth,
                               height: height)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            // 5
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            // 6
            contentHeight = max(contentHeight, frame.maxY)
            yOffset[column] = yOffset[column] + height
            
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect)
    -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
        
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath)
    -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}
