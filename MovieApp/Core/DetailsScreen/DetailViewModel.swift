//
//  DetailViewModel.swift
//  MovieApp
//
//  Created by Burhan Göksel on 12.07.2023.
//

import UIKit

protocol DetailViewModelInterFace{
    var view: DetailScreenInterFace? { get set}
    
    func viewDidLoad()
}

final class DetailViewModel {
    weak var view: DetailScreenInterFace?


}

extension DetailViewModel: DetailViewModelInterFace{
    func viewDidLoad() {
        view?.configureVC()
        view?.configurePosterImageView()
        view?.downloadPosterImage()
        view?.configureTitleLabel()
        view?.configureDateLabel()
        view?.configureOverviewLabel()
    }
}
