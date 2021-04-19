//
//  CombineVC.swift
//  Tinder Clone
//
//  Created by Jean Camargo on 19/04/21.
//

import UIKit

class CombineVC: UIViewController {
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        view.backgroundColor = UIColor.systemGroupedBackground
        
        let redView = UIView()
        redView.backgroundColor = .red
        redView.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
        
        redView.center = view.center
        
        view.addSubview(redView)
    }
}
