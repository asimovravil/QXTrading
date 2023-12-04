//
//  OnboardingViewController.swift
//  QXTrading
//
//  Created by Ravil on 30.11.2023.
//

import UIKit
import Photos

class OnboardingViewController: UIViewController {
    
    var onboCurrentPage = 0
    
    private let onboImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let onboLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        label.font = R.font.ibmPlexSansSemiBold(size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let onboSubLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        label.alpha = 0.80
        label.font = R.font.ibmPlexSans(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let onboPageControll: UIPageControl = {
        let pageControll = UIPageControl()
        pageControll.numberOfPages = onbo.count
        pageControll.currentPageIndicatorTintColor = .green
        pageControll.translatesAutoresizingMaskIntoConstraints = false
        return pageControll
    }()
    
    private let onboButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let accountButton: UIButton = {
        let button = UIButton()
        button.setImage(R.image.accountCamera(), for: .normal)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let accountTextField: UITextField = {
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
        textField.isHidden = true
        textField.backgroundColor = R.color.colorTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = R.color.background()
        view.addSubview(onboImage)
        view.addSubview(onboLabel)
        view.addSubview(onboSubLabel)
        view.addSubview(onboPageControll)
        view.addSubview(onboButton)
        view.addSubview(accountButton)
        view.addSubview(accountTextField)
        
        onboButton.addTarget(self, action: #selector(onboButtonNext), for: .touchUpInside)
        accountButton.addTarget(self, action: #selector(changeProfileImage), for: .touchUpInside)
        accountTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        constraintsSetup()
        updateOnbo(onboCurrentPage)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        accountTextField.layer.cornerRadius = 20
        
        accountButton.layer.cornerRadius = accountButton.bounds.size.width / 2
        accountButton.clipsToBounds = true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if onboCurrentPage == onbo.count - 1 {
            onboButton.isEnabled = textField.text?.count ?? 0 >= 3
        }
    }
    
    func updateOnbo(_ onboList: Int) {
        let onboItem = onbo[onboList]
        onboLabel.text = onboItem.textTitle
        onboSubLabel.text = onboItem.textSubTitle
        onboImage.image = UIImage(named: onboItem.imageName)
        
        switch onboList {
        case onbo.count - 1:
            onboButton.setImage(R.image.createAccount(), for: .normal)
            accountButton.isHidden = false
            accountTextField.isHidden = false
        case onbo.count - 2:
            onboButton.setImage(R.image.letsGetStarted(), for: .normal)
        default:
            onboButton.setImage(R.image.startLearning(), for: .normal)
        }
        
        if onboList == onbo.count - 1 {
            onboButton.isEnabled = accountTextField.text?.count ?? 0 >= 3
        }
    }
    
    
    @objc func onboButtonNext() {
        if onboCurrentPage < onbo.count - 1 {
            onboCurrentPage += 1
        } else {
            print("good")
        }
        
        updateOnbo(onboCurrentPage)
        onboPageControll.currentPage = onboCurrentPage
    }
    
    private func constraintsSetup() {
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                onboImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
                onboButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -55),
                accountTextField.bottomAnchor.constraint(equalTo: onboLabel.topAnchor, constant: -175),
            ])
        } else {
            NSLayoutConstraint.activate([
                onboImage.topAnchor.constraint(equalTo: view.topAnchor),
                onboButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                accountTextField.bottomAnchor.constraint(equalTo: onboLabel.topAnchor, constant: -115),
            ])
        }
        
        NSLayoutConstraint.activate([
            onboImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onboImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            onboLabel.bottomAnchor.constraint(equalTo: onboSubLabel.topAnchor, constant: -12),
            onboLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            onboLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            onboSubLabel.bottomAnchor.constraint(equalTo: onboPageControll.topAnchor, constant: -32),
            onboSubLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            onboSubLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            onboPageControll.bottomAnchor.constraint(equalTo: onboButton.topAnchor, constant: -30),
            onboPageControll.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            onboButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            accountButton.bottomAnchor.constraint(equalTo: accountTextField.topAnchor, constant: -32),
            accountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            accountTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            accountTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            accountTextField.heightAnchor.constraint(equalToConstant: 63),
        ])
    }
}

extension OnboardingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
            let resizedImage = resizeImage(image: selectedImage, targetSize: accountButton.bounds.size)
            
            // Сохранение изображения
            saveImageToLocalStorage(resizedImage)
            
            // Установка изображения на кнопку
            accountButton.setImage(resizedImage, for: .normal)
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

extension OnboardingViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == accountTextField, let username = textField.text {
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

