//
//  UIView+Ext.swift
//  MovieApp
//
//  Created by Burhan Göksel on 10.05.2023.
//

import UIKit

extension UIView{
    func pinToEdgesOf(view: UIView){
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
