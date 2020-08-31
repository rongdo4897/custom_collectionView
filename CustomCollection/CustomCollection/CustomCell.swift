//
//  CustomCell.swift
//  CustomCollection
//
//  Created by Hoang Tung Lam on 8/31/20.
//  Copyright © 2020 Hoang Tung Lam. All rights reserved.
//

import UIKit

protocol CustomLayoutDelegate : class {
    func collectionView(_ collectionView: UICollectionView, sizeOfPhotoIndexPath indexPath: IndexPath) -> CGSize
}

class CustomCell: UICollectionViewLayout, UICollectionViewDelegateFlowLayout {
    weak var delegate: CustomLayoutDelegate!
    
    // số phần tử trên dòng
    var numOfCols = 2
    
    // khoảng trắng giưxa các cell
    var cellPadding: CGFloat = 10
    
    var memoryAtrributes = [UICollectionViewLayoutAttributes]()
    var contentHeight: CGFloat = 0
    var contentWidth: CGFloat {
        if let collectionView = collectionView{
            return collectionView.bounds.width
        }
        
        else {
            return 0
        }
        
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    
    override func prepare() {
        if memoryAtrributes.isEmpty, let collectionView = collectionView{
            //get column width
            let columnWidth = contentWidth / CGFloat(numOfCols)
            var xOffset = [CGFloat]()
            for column in 0..<numOfCols {
                xOffset.append(CGFloat(column) * columnWidth)
            }
            
            var column = 0
            var yOffset = [CGFloat](repeating: 0, count: numOfCols)
            for item in 0..<collectionView.numberOfItems(inSection: 0){
                let indexPath = IndexPath(item: item, section: 0)
                let photoSize = delegate.collectionView(collectionView, sizeOfPhotoIndexPath: indexPath)
                let cellWidth = columnWidth
                var cellHeight = photoSize.height * columnWidth / photoSize.width
                cellHeight = cellPadding * 2 + cellHeight
                let frame = CGRect(x: xOffset[column], y: yOffset[column], width: cellWidth, height: cellHeight)
                let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = insetFrame
                memoryAtrributes.append(attributes)
                
                contentHeight = max(contentHeight, frame.maxY)
                yOffset[column] = yOffset[column] + cellHeight
                
                if numOfCols > 1 {
                  var isColumnChanged = false
                  for index in (1..<numOfCols).reversed() {
                    if yOffset[index] >= yOffset[index - 1] {
                      column = index - 1
                      isColumnChanged = true
                    }
                    else {
                      break
                    }
                  }
                  
                  if isColumnChanged {
                    continue
                  }
                }
                column = column < (numOfCols - 1) ? (column + 1) : 0
            }
        }
        
        else{
            return
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAtrributes = [UICollectionViewLayoutAttributes]()
        for attributes in memoryAtrributes {
            if attributes.frame.intersects(rect){
                visibleLayoutAtrributes.append(attributes)
            }
        }
        return visibleLayoutAtrributes
    }
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return memoryAtrributes[indexPath.item]
    }
}
