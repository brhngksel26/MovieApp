//
//  UIHelper.swift
//  MovieApp
//
//  Created by Burhan Göksel on 29.06.2023.
//

import UIKit

enum UIHelper{
    static func createHomeFlowLayout() -> UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        let itemWidth = CGFloat.dWidth
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5)
        layout.minimumLineSpacing = 40
        
        return layout
    }
}
