//
//  FirstCollectionViewCell.swift
//  TestTask
//
//  Created by Артем Манасян on 06.12.2022.
//

import UIKit

class CategoriesCell: UICollectionViewCell, DelegateProtocol {
    
    private var buttons = [CategoryButton]()
    private let search = UITextField()
    private var model: CategoryButtonModel?
    private let searchIcon = UIImageView()
    
    func setModel(model: CategoryButtonModel) {
        self.model = model
        buttons = model.buttonsTypes.map {
            let button = CategoryButton()
            button.configure(type: $0)
            button.delegate = self
            return button
        }
        buttons.forEach (addSubview)
        setHighlightedButton(with: model.selectedType)
        search.clipsToBounds = true
        searchIcon.image = UIImage(named: "search")
        search.addSubview(searchIcon)
        search.placeholder =  "Search"
        search.backgroundColor = #colorLiteral(red: 0.9920495152, green: 0.9922187924, blue: 0.9920387864, alpha: 1)
        addSubview(search)
    }
    
    func didTapButton(with button: CategoryButton.ButtonType) {
        model?.categoryTap(button)
    }
    
    private func setHighlightedButton(with type: CategoryButton.ButtonType) {
        buttons.forEach { button in
            button.setHighLighted(type == button.type)
        }
    }
    
    static func dynamicSize(model: CategoryButtonModel, width: CGFloat) -> CGFloat {
       return 180
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        buttons.pairs.forEach { prev, current  in
            let size = CGSize(width: 90 ,height: 132 )
            let buttonsWidth = CGFloat(buttons.count) * size.width
            let space = (bounds.width - buttonsWidth) / 2
             
            if prev == buttons.first {
                prev.pin.size(size).left(space)
            }
                current.pin.size(size).after(of: prev)
        }
        search.layer.cornerRadius = search.bounds.height / 2
        search.pin.bottom(10).height(38).horizontally(20)
        searchIcon.pin.left()
    }
}

struct CategoryButtonModel {
    let categoryTap: ((CategoryButton.ButtonType) -> Void)
    let buttonsTypes: [CategoryButton.ButtonType]
    let selectedType: CategoryButton.ButtonType
}


protocol DelegateProtocol {
    func didTapButton(with: CategoryButton.ButtonType)
}

class CategoryButton: UIView {
    private var nameLabel = UILabel()
    private let circleView = UIImageView()
    var delegate: DelegateProtocol?
    var type: ButtonType!
    
    enum ButtonType: String, CaseIterable {
        case phones
        case computer
        case health
        case books
        var name : String {
            rawValue.capitalized
        }
        var image: UIImage {
            switch self {
            case .phones:
                return UIImage(named: "phone")!
            case .computer:
                return UIImage(named: "computer")!
            case .health:
                return UIImage(named: "health")!
            case .books:
                return UIImage(named: "books")!
            }
        }
    }
    
    func configure(type: ButtonType) {
        self.type = type
        nameLabel.text = type.name
        nameLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 12)
        nameLabel.textAlignment = .center
        addSubview(nameLabel)
        circleView.image = type.image
        addSubview(circleView)
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.numberOfTapsRequired = 1
        addGestureRecognizer(tap)
    }
    
    func setHighLighted(_ isOn: Bool) {
        circleView.tintColor = isOn ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        circleView.backgroundColor = isOn ? UIColor(hex: "#FF6E4E") : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        nameLabel.textColor = isOn ? UIColor(hex: "#FF6E4E") : #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .ended {
            delegate?.didTapButton(with: type!)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        circleView.contentMode = .center
        circleView.frame = CGRect(x: 0, y: 0, width: 71, height: 71)
        circleView.layer.cornerRadius = frame.height/4
        circleView.clipsToBounds = true
        circleView.pin.top(24).hCenter()
        nameLabel.pin.below(of: circleView).hCenter().height(15).width(70).marginTop(5)
    }
}

fileprivate extension Collection {
    var pairs: AnySequence<(Element, Element)> {
        .init(zip(self, dropFirst()))
    }
}

