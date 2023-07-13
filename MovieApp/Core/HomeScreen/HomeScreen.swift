//
//  HomeScreen.swift
//  MovieApp
//
//  Created by Burhan Göksel on 8.05.2023.
//

import UIKit

protocol HomeSreenInterface: AnyObject {
    func configureVC()
    func configureCollectionView()
    func reloadCollectionView()
    func navigateToDeatilScreen(movie: MovieResult)
}

final class HomeScreen: UIViewController {
    
    private let viewModel = HomeViewModel()
    private var collectionView: UICollectionView!

    override func viewDidLoad(){
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }

}

extension HomeScreen: HomeSreenInterface{
   
    func configureVC() {
        view.backgroundColor = .systemBackground
        title = "Popular Movies 🔥"
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseID)
        collectionView.pinToEdgesOf(view: view)
    }
    
    func reloadCollectionView() {
        collectionView.reloadOnMainThread()
        
    }
    
    func navigateToDeatilScreen(movie: MovieResult) {
        DispatchQueue.main.async {
            let detailScreen = DetailsScreen(movie: movie)
            self.navigationController?.pushViewController(detailScreen, animated: true)
        }
    }
}

extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell
        cell.setCell(movie: viewModel.movies[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)  {
        viewModel.getDetail(id: viewModel.movies[indexPath.item]._id)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY >= contentHeight - (2 * height){
            viewModel.getMovies()
        }
    }
}
