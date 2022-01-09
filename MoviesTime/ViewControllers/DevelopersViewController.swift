//
//  DevelopmentsViewController.swift
//  MoviesTime
//
//  Created by Aliaksandr Rauko on 6.01.22.
//

import UIKit

class DevelopersViewController: UIViewController {

    @IBOutlet weak var namesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setText()
    }
    
}

extension DevelopersViewController {
    func setText() {
        namesLabel.text = "Евгения, привет🙂!\nПоздравляем тебя с прошедшим праздниками!!\n\n\nНад приложением трудились:\n\nСавко Виктор Викторович,\n\nРавко Александр Александрович"
    }
}
