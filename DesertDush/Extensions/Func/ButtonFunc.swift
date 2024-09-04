import UIKit

func createShopButton(imageName: String, width: CGFloat, height: CGFloat) -> UIButton {
    let button = UIButton(type: .system)
    button.setBackgroundImage(UIImage(named: imageName), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.widthAnchor.constraint(equalToConstant: width).isActive = true
    button.heightAnchor.constraint(equalToConstant: height).isActive = true
    return button
}
