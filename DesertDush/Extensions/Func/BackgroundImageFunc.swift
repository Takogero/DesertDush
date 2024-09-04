import UIKit

// Функция для создания и настройки UIImageView с фиксированным изображением
func createBackgroundImageView() -> UIImageView {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false

    if let image = UIImage(named: "image 14") {
        imageView.image = image
    }

    return imageView
}
