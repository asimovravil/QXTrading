//
//  EditProfileViewController.swift
//  QXTrading
//
//  Created by Ravil on 04.12.2023.
//

import UIKit
import Photos

class EditProfileViewController: UIViewController {

    private let accountProfileButton: UIButton = {
        let button = UIButton()
        button.setImage(R.image.accountCamera(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let accountProfileTextField: UITextField = {
        let textField = UITextField()
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.50),
            NSAttributedString.Key.font: R.font.ibmPlexSansMedium(size: 24)!
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "Your Name", attributes: attributes)
        textField.font = R.font.ibmPlexSansMedium(size: 24)
        textField.textAlignment = .center
        textField.borderStyle = .none
        textField.textColor = .white
        textField.keyboardType = .default
        textField.autocorrectionType = .no
        textField.backgroundColor = R.color.colorTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(R.image.delbutton(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(accountProfileButton)
        view.addSubview(accountProfileTextField)
        view.addSubview(deleteButton)
        view.backgroundColor = R.color.background()
        constraintsSetup()
        navigationBarSetup()
        setupUserProfile()
        
        accountProfileButton.addTarget(self, action: #selector(changeProfileImage), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(deleteAccount), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        accountProfileTextField.layer.cornerRadius = 20

        accountProfileButton.layer.cornerRadius = accountProfileButton.frame.width / 2
        accountProfileButton.clipsToBounds = true
    }
    
    @objc private func deleteAccount() {
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "userProfileImage")
        
        accountProfileTextField.text = "" 
        accountProfileButton.setImage(R.image.accountCamera(), for: .normal)
        print("Account deleted")
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            accountProfileButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            accountProfileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            accountProfileButton.heightAnchor.constraint(equalToConstant: 140),
            accountProfileButton.widthAnchor.constraint(equalToConstant: 140),
            
            accountProfileTextField.topAnchor.constraint(equalTo: accountProfileButton.bottomAnchor, constant: 32),
            accountProfileTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            accountProfileTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            accountProfileTextField.heightAnchor.constraint(equalToConstant: 63),
            
            deleteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -139),
            deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func navigationBarSetup() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let settingsButton = UIBarButtonItem(image: R.image.settingsBar(), style: .plain, target: self, action: #selector(settingsButtonTapped))
        settingsButton.tintColor = .white
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItem = settingsButton

        let titleLabel = UILabel()
        titleLabel.text = "Edit Profile"
        titleLabel.textColor = .white
        titleLabel.font = R.font.ibmPlexSans(size: 16)
        navigationItem.titleView = titleLabel

        navigationController?.navigationBar.shadowImage = UIImage()

        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = R.color.background()

        let borderBottom = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 1))
        borderBottom.backgroundColor = R.color.colorShadowBottomNavBar()
        borderBottom.translatesAutoresizingMaskIntoConstraints = false

        navigationController?.navigationBar.layoutIfNeeded()
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.addSubview(borderBottom)

            NSLayoutConstraint.activate([
                borderBottom.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor),
                borderBottom.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor),
                borderBottom.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor),
                borderBottom.heightAnchor.constraint(equalToConstant: 1)
            ])

            navigationBar.standardAppearance = navBarAppearance
            navigationBar.compactAppearance = navBarAppearance
            navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
    
    @objc private func settingsButtonTapped() {
        let settingsVC = UINavigationController(rootViewController: SettingsViewController())
        self.present(settingsVC, animated: true, completion: nil)
    }
    
    private func setupUserProfile() {
        // Set the user profile image
        if let imageData = UserDefaults.standard.data(forKey: "userProfileImage"),
           let image = UIImage(data: imageData) {
            accountProfileButton.setImage(image, for: .normal)
        }

        // Set the username
        if let username = UserDefaults.standard.string(forKey: "username") {
            accountProfileTextField.text = username
        }
    }
}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc private func changeProfileImage() {
        let status = PHPhotoLibrary.authorizationStatus()
        if status == .notDetermined {
            PHPhotoLibrary.requestAuthorization { status in
                if status == .authorized {
                    self.presentImagePicker()
                }
            }
        } else if status == .authorized {
            self.presentImagePicker()
        }
    }
    
    func presentImagePicker() {
        DispatchQueue.main.async {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    // В методе, где вы устанавливаете изображение на кнопку:
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            let resizedImage = resizeImage(image: selectedImage, targetSize: accountProfileButton.bounds.size)
            
            // Сохранение изображения
            saveImageToLocalStorage(resizedImage)
            
            // Установка изображения на кнопку
            accountProfileButton.setImage(resizedImage, for: .normal)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func saveImageToLocalStorage(_ image: UIImage) {
        if let imageData = image.pngData() {
            UserDefaults.standard.set(imageData, forKey: "userProfileImage")
        }
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Определяем "масштабный коэффициент" как минимум из двух отношений
        _ = min(widthRatio, heightRatio)
        
        let scaledImageSize = CGSize(width: 140, height: 140)
        
        let renderer = UIGraphicsImageRenderer(size: scaledImageSize)
        let scaledImage = renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: scaledImageSize))
        }
        
        return scaledImage
    }
}

extension EditProfileViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == accountProfileTextField, let username = textField.text {
            UserDefaults.standard.set(username, forKey: "username")
            print("Saved username: \(username)")
        }
        textField.resignFirstResponder()
        return true
    }
    
    private func keyboardTapped() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
