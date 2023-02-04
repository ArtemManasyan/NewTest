//
//  CartModelView.swift
//  TestTask
//
//  Created by Артем Манасян on 30.01.2023.
//

import UIKit

class MyCartView: UIView {
    
    let basketTable: UITableView = {
        let table = UITableView()
        table.register(BasketCell.self, forCellReuseIdentifier: "basketCell")
        table.backgroundColor = UIColor(hex: "#010035")
        return table
    }()
    var models: [BasketModel]?
    var totalModel: TotalModel?
    let totalView = TotalView()
    
    func setModel(models: [BasketModel], totalModel: TotalModel) {
        self.models = models
        self.totalModel = totalModel
        addSubview(basketTable)
        addSubview(totalView)
        totalView.delivery.text = totalModel.delivery
        totalView.totalPrice.text = String(totalModel.total)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        basketTable.pin.height(474).width(bounds.width)
        totalView.pin.below(of: basketTable).marginTop(2).height(91).width(frame.width)
    }
}

extension MyCartView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basketCell", for: indexPath) as! BasketCell
        let model = models![indexPath.row]
        cell.setup()
        cell.price.text = String(model.price)
        cell.title.text = model.title
        cell.picture.kf.setImage(with: URL(string: model.image))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

struct BasketModel {
    
    let price: Int
    let title: String
    let image: String
    
    init(model: Basket) {
        price = model.price
        title = model.title
        image = model.images
    }
}

struct TotalModel {
    let total: Int
    let delivery: String
    
    init(model: CartModelParsing) {
        total = model.total
        delivery = model.delivery
    }
}

class TotalView: UIView {
    let totalFieldLabel = UILabel()
    let totalPrice = UILabel()
    let deliveryFieldLabel = UILabel()
    let delivery = UILabel()
    
    func setup() {
        backgroundColor = UIColor(hex: "#010035")
        addSubview(totalPrice)
        addSubview(delivery)
        addSubview(deliveryFieldLabel)
        addSubview(totalFieldLabel)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        totalFieldLabel.pin.left(55).top(15).height(19).width(36)
        deliveryFieldLabel.pin.below(of: totalFieldLabel, aligned: .left).marginTop(12).height(19).width(57)
        totalPrice.pin.after(of: totalFieldLabel, aligned: .center).marginLeft(215).height(19).width(73)
        delivery.pin.below(of: totalPrice,aligned: .start).marginTop(12).height(19).width(32)
    }
}

class BasketCell: UITableViewCell {
    
    let picture = UIImageView()
    let title = UILabel()
    let price = UILabel()
    
    func setup() {
        addSubview(picture)
        addSubview(title)
        addSubview(price)
        picture.frame = CGRect(x: 0, y: 0, width: 111, height: 89)
        picture.layer.cornerRadius = 5
        title.numberOfLines = 0
        title.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        price.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        picture.pin.left(20).top(80)
        title.pin.after(of: picture,aligned: .top).marginLeft(5).width(153).height(50)
        price.pin.after(of: picture, aligned: .bottom).marginLeft(5).width(100).height(25)
    }
    

}
    

