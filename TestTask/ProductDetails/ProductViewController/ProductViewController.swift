//
//  ProductViewController.swift
//  TestTask
//
//  Created by Артем Манасян on 14.01.2023.
//

import UIKit

class ProductViewController: UIViewController {
    
    weak var mainVC: ViewController?
    let myTable = UITableView()
    let productViewModel = ProductViewModel()
    var productCellsTypes = [ProductViewModel.ProductCellType]()
    var cartButton = UIBarItem()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myTable)
        myTable.pin.all()
        myTable.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        myTable.dataSource = self
        myTable.delegate = self
        myTable.register(PicturesTableCell.self, forCellReuseIdentifier: "picturesCell")
        myTable.register(DescriptionCell.self, forCellReuseIdentifier: "descriptionCell")
        productViewModel.vc = self
        
        productViewModel.viewDidLoad()
    }
    
    func configProductCell(_ cellTypes: [ProductViewModel.ProductCellType]) {
        productCellsTypes = cellTypes
        myTable.reloadData()
    }

    func makeCell(indexPath: IndexPath) -> UITableViewCell {
        switch productCellsTypes[indexPath.row] {
        case .picturesProductModel(let model):
            let cell = myTable.dequeueReusableCell(withIdentifier: "picturesCell", for: indexPath) as! PicturesTableCell;
                cell.setModel(model: model)
                return cell
        case .discriptionProductModel(let model):
            let cell = myTable.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath) as! DescriptionCell;
            cell.setModel(model: model)
            return cell
        }
    }
}

extension ProductViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productCellsTypes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return makeCell(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        .init(productCellsTypes[indexPath.row].height(for: tableView.frame.width))
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cartVC = MyCartViewController()
        navigationController?.pushViewController(cartVC, animated: true)
    }
}

