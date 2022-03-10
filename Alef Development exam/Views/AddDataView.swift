//
//  PersonalDataView.swift
//  Alef Development exam
//
//  Created by MacBook on 21.02.2022.
//

import UIKit
import SnapKit


class AddDataView: UIView {
    // MARK:  Variables
    var viewcontainer: UIView!
    
    private let entryLabel = UILabel()
    private var firstnameTextF: UITextField!
    private var mainAgeTextF: UITextField!
    private let childLabel = UILabel()
    private var addButton: UIButton!
    private var myTableView = UITableView()
    private var deleteAllchild: UIButton!
     
    private let identifire = "Child"
    
    // MARK:  Initialization
    init() {
        super.init(frame: CGRect.zero)
        setupContainerView()
        makeEntryLabel()
        makeFirstNameTextField()
        makeAgeTextField()
        makeAddButton()
        setupTableView()
        setupDeleteAllButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK:  Функции для создания элементов вью
    //ВьюКонтейнер
    func setupContainerView() {
        viewcontainer = UIView()
        viewcontainer.backgroundColor = .white
        self.addSubview(viewcontainer)
        viewcontainer.snp.makeConstraints { make in
            make.right.equalTo(self).offset(-20)
            make.left.equalTo(self).offset(20)
            make.width.lessThanOrEqualTo(500)
            make.height.equalTo(UIScreen.main.bounds.height)

        }
    }
    
    //Верхний лэйбл
    func makeEntryLabel() {
        entryLabel.text = "Персональные данные"
        entryLabel.font = UIFont.systemFont(ofSize: 20)
        viewcontainer.addSubview(entryLabel)
        entryLabel.snp.makeConstraints { make in
            make.left.equalTo(viewcontainer).inset(10)
            make.top.equalTo(viewcontainer).inset(55)
        }
    }
    
    //Текстовое поле для для имени
    func makeFirstNameTextField() {
        firstnameTextF = UITextField()
        viewcontainer.addSubview(firstnameTextF)
        firstnameTextF.textColor = UIColor.purple
        firstnameTextF.delegate = self
        firstnameTextF.placeholder = "Имя"
        firstnameTextF.borderStyle = .roundedRect
        firstnameTextF.autocorrectionType = .yes
        firstnameTextF.returnKeyType = .continue
        firstnameTextF.snp.makeConstraints { make in
            make.top.equalTo(viewcontainer.snp.bottom)
            make.left.equalTo(viewcontainer).inset(30)
            make.right.equalTo(viewcontainer).inset(30)
            make.top.equalTo(entryLabel).inset(45)
            make.height.equalTo(50)
        }
    }
    
    // Текстовое поле для возраста
    func makeAgeTextField() {
        mainAgeTextF = UITextField()
        viewcontainer.addSubview(mainAgeTextF)
        mainAgeTextF.textColor = UIColor.purple
        mainAgeTextF.delegate = self
        mainAgeTextF.placeholder = "Возраст"
        mainAgeTextF.borderStyle = .roundedRect
        mainAgeTextF.autocorrectionType = .yes
        mainAgeTextF.keyboardType = .numberPad
        mainAgeTextF.returnKeyType = .done
        mainAgeTextF.snp.makeConstraints { make in
            make.top.equalTo(viewcontainer.snp.bottom)
            make.left.equalTo(viewcontainer).inset(30)
            make.right.equalTo(viewcontainer).inset(30)
            make.top.equalTo(firstnameTextF).inset(65)
            make.height.equalTo(50)
        }
        
    }
    
    // Кнопка добавления ребенка
    func makeAddButton () {
        addButton = UIButton(type: .system)
        let plusImage = UIImage(systemName: "plus")
        addButton.setImage(plusImage, for: .normal)
        addButton.setTitle(" Добавить ребенка", for: .normal)
        addButton.setTitleColor(.systemBlue, for: .normal)
        addButton.tintColor = .systemBlue
        addButton.layer.borderColor = UIColor.systemBlue.cgColor
        addButton.layer.borderWidth = 2.0
        addButton.layer.cornerRadius = 25
        addButton.layer.masksToBounds = true
        addButton.addTarget(self, action: #selector(addOneChild(sender: )), for: .touchUpInside)
        viewcontainer.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.top.equalTo(viewcontainer.snp.bottom)
            make.top.equalTo(mainAgeTextF).inset(95)
            make.right.equalTo(viewcontainer).inset(5)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        childLabel.text = "Дети (макс.5)"
        childLabel.font = UIFont.systemFont(ofSize: 20)
        viewcontainer.addSubview(childLabel)
        childLabel.snp.makeConstraints { make in
            make.centerY.equalTo(addButton)
            make.left.equalTo(viewcontainer).inset(5)
        }
    }
    
    // Таблица
    func setupTableView() {
        myTableView.register(ChildTableCell.self, forCellReuseIdentifier: identifire)
        myTableView.delegate = self
        myTableView.dataSource = self
        viewcontainer.addSubview(myTableView)
        myTableView.snp.makeConstraints { make in
            make.top.equalTo(addButton).inset(55)
            make.width.equalTo(viewcontainer)
            make.bottom.equalTo(viewcontainer).inset(120)
        }
    }
    
    //Кнопка для удаления всех
    func setupDeleteAllButton() {
        deleteAllchild = UIButton(type: .system)
        deleteAllchild.setTitle("Очистить все", for: .normal)
        deleteAllchild.setTitleColor(.red, for: .normal)
        deleteAllchild.tintColor = .systemBlue
        deleteAllchild.layer.borderColor = UIColor.red.cgColor
        deleteAllchild.layer.borderWidth = 2.0
        deleteAllchild.layer.cornerRadius = 25
        deleteAllchild.layer.masksToBounds = true
        deleteAllchild.addTarget(self, action: #selector(deleteEveryChild(sender: )), for: .touchUpInside)
        viewcontainer.addSubview(deleteAllchild)
        deleteAllchild.snp.makeConstraints { make in
            make.bottom.equalTo(viewcontainer).inset(40)
            make.centerX.equalTo(viewcontainer)
            make.height.equalTo(55)
            make.width.equalTo(200)
        }
    }
    
    //MARK: Функции для кнопок
    
    //Добавить ребенка
    @objc func addOneChild (sender: UIButton) {
        guard let name = firstnameTextF.text else {return}
        guard let age = mainAgeTextF.text else {return}
        
        if (name != "" && age != "" && age.allSatisfy(("0"..."9").contains)) {
            if (ChildData.sharedChild.child.count < 5 ) {
                ChildData.sharedChild.child.append(SingleChild(name: name, age: age))
                print(ChildData.sharedChild.child)
                DispatchQueue.main.async {
                    self.myTableView.beginUpdates()
                    self.myTableView.insertRows(
                        at: [(NSIndexPath(row:  ChildData.sharedChild.child.count - 1, section: 0) as IndexPath)],
                        with: .automatic)
                    self.myTableView.endUpdates()
                }
                self.firstnameTextF.text = ""
                self.mainAgeTextF.text = ""
                self.viewcontainer.endEditing(true)
            }
            else {
                let alert = UIAlertController(title: "Макс. число детей",message:"Попробуйте удалить",
                                              preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK",style:UIAlertAction.Style.default,handler: { [self] _ in
                    self.firstnameTextF.text = ""
                    self.mainAgeTextF.text = ""
                }))
                self.window?.rootViewController?.present(alert, animated: true, completion: nil)
            }
        }
        
        else {
            let alert = UIAlertController(title: "Неправильный ввод",message:"Попробуйте еще раз",
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK",style:UIAlertAction.Style.default,handler: { [self] _ in
                self.firstnameTextF.text = ""
                self.mainAgeTextF.text = ""
            }))
            self.window?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    //Удалить всех детей
    @objc func deleteEveryChild (sender: UIButton) {
        ChildData.sharedChild.child.removeAll()
        self.myTableView.reloadData()
//        self.myTableView.beginUpdates()
//        let indexPath = [(NSIndexPath(row:  ChildData.sharedChild.child.count-1, section: 0) as IndexPath)]
//        self.myTableView.deleteRows(at: indexPath, with: .automatic)
//        self.myTableView.endUpdates()
    }
}

//MARK: Функции для переключения клавиатуры
extension AddDataView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstnameTextF {
            mainAgeTextF.becomeFirstResponder()
        }
        else {
            mainAgeTextF.resignFirstResponder()
        }
        return true
    }
}

//MARK: Функции для таблицы
extension AddDataView:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return ChildData.sharedChild.child.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath) as! ChildTableCell
        cell.nameLabel.text = "\(ChildData.sharedChild.child[indexPath.row].name)"
        cell.ageLabel.text = "\(ChildData.sharedChild.child[indexPath.row].age)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150.0
    }
}

