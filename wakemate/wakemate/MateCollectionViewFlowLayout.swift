//
//  MateCollectionViewFlowLayout.swift
//  wakemate
//
//  Created by BoMin on 2022/08/26.
//

import UIKit

class MateCollectionViewFlowLayout: UICollectionViewFlowLayout {
    var ratioHeighttoWidth = 1.0
    var numOfColumns = 1
    var cellSpacing = 0.0 {
        didSet {
            self.minimumLineSpacing = self.cellSpacing
            self.minimumInteritemSpacing = self.cellSpacing
        }
    }
    
    override init() {
        super.init()
        self.scrollDirection = .horizontal
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
