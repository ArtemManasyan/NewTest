//
//  MyCartViewController.swift
//  TestTask
//
//  Created by Артем Манасян on 28.01.2023.
//

import UIKit
import PinLayout

class MyCartViewController: UIViewController {
    weak var productVC: ProductViewController?
    let cartViewModel = CartViewModel()

  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        cartViewModel.cartVC = self
        view.addSubview(cartViewModel.loadData())
        cartViewModel.loadData().pin.top(200).width(view.bounds.width)
        
        
    }
    
    


}
