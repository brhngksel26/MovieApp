//
//  UICollectionView+Ext.swift
//  MovieApp
//
//  Created by Burhan Göksel on 10.07.2023.
//

import UIKit


extension UICollectionView{
    func reloadOnMainThread(){
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
