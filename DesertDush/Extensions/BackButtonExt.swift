import UIKit

extension UIViewController {
    // Функция для создания и настройки кастомной кнопки возврата
    func setupCustomBackButton(for viewController: UIViewController) {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "Button Back")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        viewController.navigationItem.hidesBackButton = true
    }

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
