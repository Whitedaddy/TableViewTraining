//
//  ChildTableCell.swift
//  Alef Development exam
//
//  Created by MacBook on 09.03.2022.
//

import UIKit
import SnapKit

class ChildTableCell: UITableViewCell {
    
    let subNameLabel = UILabel()
    let nameLabel = UILabel()
    let subAgelabel = UILabel()
    let ageLabel = UILabel()
    let deleteOneButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        makeConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("Fatal error")
    }
    func addViews() {
        subNameLabel.text = "Имя"
        subNameLabel.textColor = UIColor.gray
        subNameLabel.font = UIFont.italicSystemFont(ofSize: 15)
        subAgelabel.text = "Возраст"
        subAgelabel.textColor = UIColor.gray
        subAgelabel.font = UIFont.italicSystemFont(ofSize: 15)
        deleteOneButton.setTitle("Удалить", for: .normal)
        deleteOneButton.setTitleColor(.systemBlue, for: .normal)
        contentView.addSubview(subNameLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(subAgelabel)
        contentView.addSubview(ageLabel)
        contentView.addSubview(deleteOneButton)
    }
    func makeConstraints() {
        subNameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(5)
            make.left.equalTo(contentView)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(subNameLabel).inset(25)
            make.left.equalTo(contentView)
        }
        subAgelabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel).inset(60)
            make.left.equalTo(contentView)
        }
        ageLabel.snp.makeConstraints { make in
            make.top.equalTo(subAgelabel).inset(25)
            make.left.equalTo(contentView)
        }
        deleteOneButton.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(contentView).inset(50)
        }
    }
}


