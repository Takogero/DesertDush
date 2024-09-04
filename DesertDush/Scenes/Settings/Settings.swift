import UIKit

class SettingsView: UIViewController {
    
    let backgroundImageView = createBackgroundImageView()
    let contentView = createContentView()
    
    private let imageButton1: UIButton = {
        return createShopButton(imageName: "Button", width: 260, height: 74)
    }()
    
    private let imageButton2: UIButton = {
        return createShopButton(imageName: "Button (2)", width: 260, height: 74)
    }()
    
    private let imageButton3: UIButton = {
        return createShopButton(imageName: "Button (3)", width: 260, height: 74)
    }()
    
    private let imageButton4: UIButton = {
        return createShopButton(imageName: "Button (4)", width: 260, height: 74)
    }()
    
    private let imageButton5: UIButton = {
        return createShopButton(imageName: "Button (5)", width: 260, height: 74)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundImageView)
        view.addSubview(contentView)
        
        contentView.addSubview(imageButton1)
        contentView.addSubview(imageButton2)
        contentView.addSubview(imageButton3)
        contentView.addSubview(imageButton4)
        contentView.addSubview(imageButton5)
        
        // Set up constraints for the background image view
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Set up constraints for the content view
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contentView.widthAnchor.constraint(equalToConstant: 260),
            contentView.heightAnchor.constraint(equalToConstant: 400) // Adjust the height as needed
        ])
        
        // Set up constraints for the image buttons
        NSLayoutConstraint.activate([
            imageButton1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imageButton1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            imageButton2.topAnchor.constraint(equalTo: imageButton1.bottomAnchor, constant: 20),
            imageButton2.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            imageButton3.topAnchor.constraint(equalTo: imageButton2.bottomAnchor, constant: 20),
            imageButton3.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            imageButton4.topAnchor.constraint(equalTo: imageButton3.bottomAnchor, constant: 20),
            imageButton4.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            imageButton5.topAnchor.constraint(equalTo: imageButton4.bottomAnchor, constant: 20),
            imageButton5.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
}
