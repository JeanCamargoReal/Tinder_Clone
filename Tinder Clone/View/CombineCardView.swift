//
//  CombineCardView.swift
//  Tinder Clone
//
//  Created by Jean Camargo on 20/04/21.
//

import UIKit

class CombineCardView: UIView {
    
    let fotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pessoa-1")
        // para imagem nao ficar esticada
        imageView.contentMode = .scaleAspectFill
        // cortar a imagem caso ultrappase o card
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 8
        clipsToBounds = true
            
        addSubview(fotoImageView)
        
        fotoImageView.preencherSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
