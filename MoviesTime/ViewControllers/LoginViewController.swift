//
//  LoginViewController.swift
//  MoviesTime
//
//  Created by Aliaksandr Rauko on 5.01.22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userTextField: UITextField!
    
    private var users = User.getUserList()
    private var movie = Movie.getMovie()
    private var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeSettings()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let navigationVC = segue.destination as? UINavigationController else { return}
        guard let tabBarController = navigationVC.topViewController as? UITabBarController else { return}
        
        for viewController in tabBarController.viewControllers ?? [] {
            if let movieListVS = viewController as? MovieListViewController {
              movieListVS.movie = movie
            } else if let randomVS = viewController as? RandomMovieViewController {
                randomVS.movie = movie
            }
        }
    }
    
    @IBAction func logInAction() {
        var authentication = false
        
        for user in users {
            if user.fullName == userTextField.text
                && user.password == passwordTextField.text {
                authentication = true
            }
        }
        if !authentication {
            showAlert(title: "Invalid login or password!",
                      message: "Please, enter correct login and password!",
                      textField: passwordTextField)
        }
    }
    
    @IBAction func forgotAction(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Choose your name from the list😉")
        : showAlert(title: "Oops!", message: "Password is filled in from the list😉",
                  textField: passwordTextField)
    }
    
}

// MARK: - UIPicker Methods
extension LoginViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        users.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        users[row].fullName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userTextField.text = users[row].fullName
        passwordTextField.text = users[row].password
    }
}

// MARK: - private Methods
extension LoginViewController {
    
    private func makeSettings() {
        pickerView.delegate = self
        pickerView.dataSource = self
        userTextField.delegate = self
        passwordTextField.delegate = self
        userTextField.inputView = pickerView
        userTextField.autocorrectionType = .no
        userTextField.smartInsertDeleteType = .no
        passwordTextField.isSecureTextEntry = true

    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Alert Controller Methods
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInAction()
            performSegue(withIdentifier: "showNavigationVC", sender: nil)
        }
        return true
    }
}
