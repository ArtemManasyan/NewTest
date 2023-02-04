//
//  ProductCellModel.swift
//  TestTask
//
//  Created by Артем Манасян on 15.01.2023.
//

import UIKit
import Cosmos

class DescriptionCell: UITableViewCell {
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    let ratingLabel = UILabel()
    let sdLabel = UILabel()
    let ssdLabel = UILabel()
    let cpuLabel = UILabel()
    let cameraLabel = UILabel()
    var model: DescriptionCellModel!
    static var requiredHeight: CGFloat = 470
    let cpuPict = UIImageView()
    let cameraPict = UIImageView()
    let sdPict = UIImageView()
    let ssdPict = UIImageView()
    let shopLabel = UILabel()
    let detailsLabel = UILabel()
    let featuresLabel = UILabel()
    let selectColorLabel = UILabel()
    var cosmosView: CosmosView?
    var colorCircle1 = UIView()
    var colorCircle2 = UIView()
    var capacity1 = CapacityView()
    var capacity2 = CapacityView()
    
    let bottomButtonView = BottomView()
    
    func setModel(model: DescriptionCellModel) {
        
        self.model = model
        addSubview(bottomButtonView)
        
        addSubview(colorCircle1)
        addSubview(colorCircle2)
        addSubview(selectColorLabel)
        addSubview(cameraPict)
        addSubview(sdPict)
        addSubview(ssdPict)
        addSubview(cpuPict)
        addSubview(nameLabel)
        addSubview(ratingLabel)
        addSubview(sdLabel)
        addSubview(ssdLabel)
        addSubview(cpuLabel)
        addSubview(cameraLabel)
        addSubview(shopLabel)
        addSubview(detailsLabel)
        addSubview(featuresLabel)
        addSubview(capacity1)
        addSubview(capacity2)
        cosmosView = {
            let view = CosmosView()
            view.settings.fillMode = .half
            view.settings.filledImage = UIImage(named: "star")
            view.settings.updateOnTouch = false
            view.rating = Double(model.rating) ?? 0
            view.settings.starSize = 18
            view.settings.starMargin = 9
            return view
        }()
        addSubview(cosmosView!)
        bottomButtonView.price.text = model.price
        bottomButtonView.frame = CGRect(x: 0, y: 0, width: frame.width - 60, height: 50)
        bottomButtonView.backgroundColor = UIColor(hex: "#FF6E4E")
        bottomButtonView.layer.cornerRadius = 15
        capacity1.capacityLabel.text = model.capacity.first! + "gb"
        capacity1.backgroundColor = UIColor(hex: "#FF6E4E")
        capacity2.capacityLabel.text = model.capacity.last! + "gb"
        capacity2.capacityLabel.textColor = .gray
        selectColorLabel.text = "Select color and capacity"
        selectColorLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
        shopLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        shopLabel.text = "shop"
        let attText = NSMutableAttributedString(string: "Shop")
        let textRange = NSRange(location: 0, length: shopLabel.text!.count)
        attText.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: textRange)
        shopLabel.attributedText = attText
        detailsLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 20)
        detailsLabel.textColor = #colorLiteral(red: 0.4233504534, green: 0.4273476899, blue: 0.4356029034, alpha: 1)
        detailsLabel.text = "Details"
        featuresLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 20)
        featuresLabel.textColor = #colorLiteral(red: 0.4233504534, green: 0.4273476899, blue: 0.4356029034, alpha: 1)
        featuresLabel.text = "Features"
        nameLabel.text = model.name
        nameLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 23)
        priceLabel.text = String(model.price)
        ratingLabel.text = String(model.rating)
        sdLabel.text = model.sd
        ssdLabel.text = model.ssd
        cpuLabel.text = model.cpu
        cameraLabel.text = model.camera
        cpuLabel.font = UIFont(name: "HelveticaNeue-Light", size: 11)
        cameraLabel.font = UIFont(name: "HelveticaNeue-Light", size: 11)
        sdLabel.font = UIFont(name: "HelveticaNeue-Light", size: 11)
        ssdLabel.font = UIFont(name: "HelveticaNeue-Light", size: 11)
        cpuPict.image = UIImage(named: "cpu")
        cameraPict.image = UIImage(named: "camera")
        sdPict.image = UIImage(named: "sd")
        ssdPict.image = UIImage(named: "ssd")
        backgroundColor = .white
        layer.cornerRadius = 20
        colorCircle1.backgroundColor = UIColor(hex: model.colors.first!)
        colorCircle2.backgroundColor = UIColor(hex: model.colors.last!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        nameLabel.pin.width(244).height(30).top(20).left(28)
        cpuLabel.pin.left(30).below(of: nameLabel).marginTop(150).width(60).height(13)
        cameraLabel.pin.after(of: cpuLabel, aligned: .center).margin(36).width(65).height(13)
        ssdLabel.pin.after(of: cameraLabel, aligned: .center).margin(36).width(30).height(13)
        sdLabel.pin.after(of: ssdLabel, aligned: .center).margin(36).width(40).height(13)
        cpuPict.pin.above(of: cpuLabel, aligned: .center).marginBottom(5).height(28).width(28)
        cameraPict.pin.above(of: cameraLabel,aligned: .center).marginBottom(5).height(24).width(28)
        sdPict.pin.above(of: sdLabel,aligned:  .center).marginBottom(5).height(22).width(22)
        ssdPict.pin.above(of: ssdLabel, aligned: .center).marginBottom(5).height(21).width(28)
        shopLabel.pin.below(of: nameLabel).marginTop(57).left(45).height(25).width(53)
        detailsLabel.pin.below(of: nameLabel).after(of: shopLabel).height(25).width(67).marginTop(57).marginLeft(65)
        featuresLabel.pin.below(of: nameLabel).marginTop(57).height(25).width(84).right(20)
        cosmosView?.pin.below(of: nameLabel, aligned: .left).marginTop(15).height(18)
        selectColorLabel.pin.below(of: cpuLabel,aligned: .left).marginTop(29).height(21).width(200)
        colorCircle1.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        colorCircle1.layer.cornerRadius = colorCircle1.frame.height / 2
        colorCircle1.pin.left(35).below(of: selectColorLabel).marginTop(15)
        colorCircle2.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        colorCircle2.layer.cornerRadius = colorCircle1.frame.height / 2
        colorCircle2.pin.after(of: colorCircle1).marginLeft(18).below(of: selectColorLabel).marginTop(15)
        capacity1.pin.after(of: colorCircle2, aligned: .center).marginLeft(50).height(30).width(70)
        capacity2.pin.after(of: capacity1,aligned: .center).marginLeft(15).height(30).width(70)
        bottomButtonView.pin.below(of: colorCircle2).hCenter().marginTop(15)
    }
}

struct DescriptionCellModel {
    let name: String
    let price: String
    let rating: String
    let sd: String
    let ssd: String
    let cpu: String
    let camera: String
    let capacity: [String]
    let colors: [String]
    
    init (model: ProductDetailsModel) {
        name = model.title
        price = {"$\(model.price)" }()
        rating = {"\(model.rating)"}()
        sd = model.sd
        ssd = model.ssd
        cpu = model.cpu
        camera = model.camera
        capacity = model.capacity
        colors = model.color
    }
}

class BottomView: UIView {
    let addButton = UIButton()
    let price = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(addButton)
        addSubview(price)
        addButton.setTitle("Add to Cart", for: .normal)
        price.textColor = .white
        addButton.pin.left(25).vCenter().height(25).width(130)
        price.pin.after(of: addButton).vCenter().height(25).width(130).marginLeft(40)
    }
}

class CapacityView: UIView {
    let capacityLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        capacityLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 13)
        layer.cornerRadius = 8
        capacityLabel.textColor = .white
        addSubview(capacityLabel)
        capacityLabel.pin.left(12).vCenter().height(17).width(46)
    }
}


extension UIColor {
    public convenience init(hex: String) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 1

        let hexColor = hex.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        var valid = false

        if scanner.scanHexInt64(&hexNumber) {
            if hexColor.count == 8 {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255
                valid = true
            }
            else if hexColor.count == 6 {
                r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                b = CGFloat(hexNumber & 0x0000ff) / 255
                valid = true
            }
        }

        #if DEBUG
            assert(valid, "UIColor initialized with invalid hex string")
        #endif

        self.init(red: r, green: g, blue: b, alpha: a)
    }
}

//extension UIColor {
//    public convenience init?(hex: String) {
//        let r, g, b, a: CGFloat
//
//        if hex.hasPrefix("#") {
//            let start = hex.index(hex.startIndex, offsetBy: 1)
//            let hexColor = String(hex[start...])
//
//            if hexColor.count == 8 {
//                let scanner = Scanner(string: hexColor)
//                var hexNumber: UInt64 = 0
//
//                if scanner.scanHexInt64(&hexNumber) {
//                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
//                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
//                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
//                    a = CGFloat(hexNumber & 0x000000ff) / 255
//
//                    self.init(red: r, green: g, blue: b, alpha: a)
//                    return
//                }
//            }
//        }
//        return nil
//    }
//}
//
