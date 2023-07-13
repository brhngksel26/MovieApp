//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Burhan Göksel on 10.05.2023.
//

import Foundation


protocol HomeViewModelInterface{
    var view: HomeSreenInterface? { get set }
    func viewDidLoad()
    func getMovies()
}


final class HomeViewModel {
    weak var view: HomeSreenInterface?
    private let service = MovieService()
    var movies: [MovieResult] = []
    private var page: Int = 1
}

extension HomeViewModel: HomeViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
        getMovies()
    }
    
    
    func getMovies() {
        service.downloadMovies(page: page) { [weak self] returnedMovies in
            guard let self = self else { return }
            guard let returnedMovies = returnedMovies else { return }

            self.movies.append(contentsOf: returnedMovies)
            self.page += 1
            self.view?.reloadCollectionView()
        }
    }
    
    func getDetail(id: Int){
        service.downloadDetail(id: id){ [weak self] returnDetail in
            guard let self = self else { return }
            guard let returnDetail = returnDetail else { return }
            
            self.view?.navigateToDeatilScreen(movie: returnDetail)
        }
    }
}
