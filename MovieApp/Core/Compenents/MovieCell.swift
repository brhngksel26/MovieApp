//
//  MovieCell.swift
//  MovieApp
//
//  Created by Burhan Göksel on 29.06.2023.
//

import UIKit

final class MovieCell: UICollectionViewCell {
    static let reuseID = "MovieCell"
    
    private var posterImageView: PosterImageView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        configureCell()
        configurePosterImage()
        
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has nit been implement")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        posterImageView.image = nil
        posterImageView.cancelDownloading()
    }
    
    func setCell(movie: MovieResult){
        posterImageView.downloadImage(movie: movie)
    }
    
    private func configureCell(){
        backgroundColor = .systemGray
        layer.cornerRadius = 20
        clipsToBounds = true
    }
    
    private func configurePosterImage(){
        posterImageView = PosterImageView(frame: .zero)
        addSubview(posterImageView)
    
        
        posterImageView.backgroundColor = .red
        
        posterImageView.pinToEdgesOf(view: self)
    }
}
