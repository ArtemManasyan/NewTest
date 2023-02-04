//
//  ViewController.swift
//  TestTask
//
//  Created by Артем Манасян on 04.12.2022.
//

import UIKit
import PinLayout

class ViewController: UIViewController {
    
    
    let myCollection = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    let viewModel = ViewModel()
    var cellsTypes = [ViewModel.CellType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myCollection)
        myCollection.pin.all(0)
        myCollection.dataSource = self
        myCollection.delegate = self
        myCollection.register(HeaderCell.self, forCellWithReuseIdentifier: "headerCell")
        myCollection.register(CategoriesCell.self, forCellWithReuseIdentifier: "selectCategoryCell")
        myCollection.register(HotSalesCell.self, forCellWithReuseIdentifier:"hotSalesCell")
        myCollection.register(BestSellerCell.self, forCellWithReuseIdentifier: "bestSellerCell")
        myCollection.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        viewModel.vc = self
        viewModel.viewDidLoad()
    }
    
    func configCell(_ cellTypes: [ViewModel.CellType]) {
        cellsTypes = cellTypes
        myCollection.reloadData()
    }
    
    func makeCell(indexPath: IndexPath) -> UICollectionViewCell {
        switch cellsTypes[indexPath.row] {
        case .header(let model):
            let cell = myCollection.dequeueReusableCell(withReuseIdentifier: "headerCell", for: indexPath) as! HeaderCell;
            cell.setModel(model: model)
            return cell
        case .categories(let model):
            let cell = myCollection.dequeueReusableCell(withReuseIdentifier: "selectCategoryCell", for: indexPath) as! CategoriesCell;
            cell.setModel(model: model)
            return cell
        case .hotSales(let model):
            let cell = myCollection.dequeueReusableCell(withReuseIdentifier: "hotSalesCell", for: indexPath) as! HotSalesCell;
            cell.setModel(models: model)
            return cell
        case .bestSales(let model):
            let cell = myCollection.dequeueReusableCell(withReuseIdentifier: "bestSellerCell", for: indexPath) as! BestSellerCell;
            cell.setModel(models: model)
            return cell
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellsTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return makeCell(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(
            width: collectionView.frame.width,
            height: cellsTypes[indexPath.row].height(for: collectionView.frame.width))
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productVC = ProductViewController()
        navigationController?.pushViewController(productVC, animated: true)
    }
}
