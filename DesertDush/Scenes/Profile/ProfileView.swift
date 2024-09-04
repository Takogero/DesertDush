import UIKit
import Photos

class ProfileView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let backgroundImageView = createBackgroundImageView()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image = UIImage(systemName: "person.fill")
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let changeProfilePictureButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change Profile Picture", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name"
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.textColor = .black
        textField.background = UIImage(named: "Frame 1597880733")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImageView)
        view.addSubview(profileImageView)
        view.addSubview(changeProfilePictureButton)
        view.addSubview(nameTextField)
        
        // Настройка ограничений для фонового изображения
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Настройка ограничений для profileImageView
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // Настройка ограничений для changeProfilePictureButton
        NSLayoutConstraint.activate([
            changeProfilePictureButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeProfilePictureButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20)
        ])
        
        // Настройка ограничений для nameTextField
        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.topAnchor.constraint(equalTo: changeProfilePictureButton.bottomAnchor, constant: 20),
            nameTextField.widthAnchor.constraint(equalToConstant: 294),
            nameTextField.heightAnchor.constraint(equalToConstant: 53)
        ])
        
        // Добавление обработчика нажатия на changeProfilePictureButton
        changeProfilePictureButton.addTarget(self, action: #selector(changeProfilePictureButtonTapped), for: .touchUpInside)
    }
    
    // Обработчик нажатия на changeProfilePictureButton
    @objc private func changeProfilePictureButtonTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            profileImageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
