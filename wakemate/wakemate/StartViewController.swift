//
//  StartViewController.swift
//  wakemate
//
//  Created by BoMin on 2022/08/25.
//

import UIKit
import AuthenticationServices

class StartViewController: UIViewController, UITextFieldDelegate {
    
//MARK: Values - to post
    
    struct PostValues {
        static var tokenValue: String = "thisistoken"
        static var nameValue: String = "*_thisisusername_*"
    }
    
    
//MARK: Label
    
//MARK: View
    let wmImageView: UIImageView = {
        let wmImage = UIImageView()
        let wmLogo: UIImage = UIImage(named: "wakemate-logo-start.png")!
        wmImage.image = wmLogo
        
        
        return wmImage
    }()
    
    let signUpView: UIView = {
        let signUp = UIView()
        
        signUp.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        signUp.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        
        return signUp
    }()
    
//MARK: Button
    let submitButton: UIButton = {
        let submit = UIButton()
        
        submit.frame = CGRect(x: 0, y: 0, width: 150, height: 40)
        
        submit.setTitle("Start", for: .normal)
        submit.setTitleColor(UIColor.systemBlue, for: .normal)
        submit.setTitleColor(UIColor.systemGray, for: .highlighted)
        
        submit.layer.borderColor = UIColor.white.cgColor
        submit.layer.borderWidth = 1
        
        submit.layer.cornerRadius = 5
        submit.backgroundColor = .clear
        submit.addTarget(self, action: #selector(handleSubmitButtonPress), for: .touchUpInside)
        
        return submit
    }()
    
//MARK: TextField
    var userNameTextField: UITextField = {
        let userName = UITextField()
        
        userName.frame = CGRect(x: 0, y: 0, width: 250, height: 40)
        
        userName.backgroundColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        userName.layer.masksToBounds = true
        userName.layer.cornerRadius = 5
        
        userName.attributedPlaceholder = NSAttributedString(
            string: "Enter your nickname",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)]
        )
        userName.font = .systemFont(ofSize: 15)
        userName.textColor = .white
        userName.textAlignment = .center
        userName.autocorrectionType = .no
        userName.keyboardType = .default
        userName.returnKeyType = .done
        userName.clearButtonMode = .whileEditing
        
        return userName
    }()
    
//MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        self.userNameTextField.delegate = self
        setUp()
        setUpProviderLoginView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
//MARK: View Settings, AutoLayouts
    func setView() {
        view.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
    }
    
    func setUp() {
        
        self.view.addSubview(wmImageView)
        self.view.addSubview(signUpView)
        self.view.addSubview(userNameTextField)
        self.view.addSubview(submitButton)
        
        
        // auto layouts
        wmImageAutoLayout()
        signUpViewAutoLayout()
        submitButtonAutoLayout()
        userNameTextFieldAutoLayout()
        
    }
    
//MARK: Setting Provider Login View
    func setUpProviderLoginView() {
        let authButton = ASAuthorizationAppleIDButton(authorizationButtonType: .signIn, authorizationButtonStyle: .black)
        authButton.addTarget(self, action: #selector(handleAuthAppleIDButtonPress), for: .touchUpInside)
        self.signUpView.addSubview(authButton)
        
        authButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authButton.widthAnchor.constraint(equalToConstant: 250),
            authButton.heightAnchor.constraint(equalToConstant: 40),
            authButton.centerXAnchor.constraint(equalTo: self.signUpView.centerXAnchor),
            authButton.centerYAnchor.constraint(equalTo: self.signUpView.centerYAnchor),
            
        ])
    }
    
//MARK: EXTENSION: handle functions
    @objc func handleAuthAppleIDButtonPress() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authController = ASAuthorizationController(authorizationRequests: [request])
        authController.delegate = self
        authController.presentationContextProvider = self as? ASAuthorizationControllerPresentationContextProviding
        authController.performRequests()
    }
    
    
    @objc func handleSubmitButtonPress() {
        print("\(PostValues.tokenValue)\n\(PostValues.nameValue)\n")
        
        // post
        guard let url = URL(string: "https://ptsv2.com/t/xz48k-1661410964/post") else {
            fatalError("Invalid URL")
        }

        var request = URLRequest(url: url)

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postingParams: [String: Any] = [
            "token": PostValues.tokenValue,
            "name": PostValues.nameValue
        ]
        
        let data = try? JSONSerialization.data(withJSONObject: postingParams)
        
        request.httpBody = data

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                return
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                return
            }

            guard let data = data, let str = String(data: data, encoding: .utf8) else {
                fatalError("Invalid Data")
            }

        }

        task.resume()
        
        if PostValues.nameValue == "*_thisisusername_*" {
            wrongUserName()
        } else {
            showWmTabBarView()
        }
    }
    
    func wrongUserName() {
        let wrongNameAlert = UIAlertController(title: "Username not available.", message: "Please write it again.", preferredStyle: .alert)
        let wrongNameAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        wrongNameAlert.addAction(wrongNameAction)
        present(wrongNameAlert, animated: true, completion: nil)
    }
    
    func showWmTabBarView() {
        let wmView = TabBarViewController()
        wmView.modalPresentationStyle = .fullScreen
        self.present(wmView, animated: true, completion: nil)
    }


}

//MARK: EXTENSION: AutoLayouts
extension StartViewController {
    func wmImageAutoLayout() {
        wmImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // set contentMode
        wmImageView.contentMode = .scaleAspectFit
        
        // set width & height anchors
        wmImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        wmImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        // set other anchors
        wmImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        wmImageView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -(self.view.frame.size.height*0.1)).isActive = true
        
    }
    func signUpViewAutoLayout() {
        signUpView.translatesAutoresizingMaskIntoConstraints = false
        
        // set width & height anchors
        signUpView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        signUpView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // set other anchors
        signUpView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        signUpView.topAnchor.constraint(equalTo: self.wmImageView.bottomAnchor).isActive = true
        
    }
    func userNameTextFieldAutoLayout() {
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userNameTextField.widthAnchor.constraint(equalToConstant: 250),
            userNameTextField.heightAnchor.constraint(equalToConstant: 40),
            userNameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            userNameTextField.topAnchor.constraint(equalTo: self.signUpView.bottomAnchor),
            
        ])
    }
    func submitButtonAutoLayout() {
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            submitButton.widthAnchor.constraint(equalToConstant: 150),
            submitButton.heightAnchor.constraint(equalToConstant: 40),
            submitButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            submitButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -(self.view.frame.size.height*0.15)),
        ])
    }
    
}

//MARK: Authorization Extension
extension StartViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential =  authorization.credential as? ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user
            PostValues.tokenValue = userIdentifier
            print("USER IDENTIFIER:\n\n\(userIdentifier)\n\n-----\n\n")
            
        }
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("login error -- \(error)")
    }
}

//MARK: TextField Extension
extension StartViewController {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        PostValues.nameValue = userNameTextField.text ?? "thisisName"
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.userNameTextField.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)
        return true
    }
}
