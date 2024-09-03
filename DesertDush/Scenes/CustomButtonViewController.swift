import UIKit

class CustomButtonViewController: UIViewController {

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        // Установка фонового изображения для всего представления
        if let image = UIImage(named: "Splash") {
            backgroundImageView.image = image
        }

        view.addSubview(backgroundImageView)

        // Настройка ограничений для фонового изображения
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // Создание кнопок
        let lvlButton = createLvlButton()
        let shopButton = createShopButton()
        let historyButton = createHistoryButton()
        let profileButton = createProfileButton()
        let settingsButton = createSettingsButton()

        view.addSubview(lvlButton)
        view.addSubview(shopButton)
        view.addSubview(historyButton)
        view.addSubview(profileButton)
        view.addSubview(settingsButton)

        // Настройка авторазмещения
        setupLayout(ovalButton: lvlButton, circleButtons: [shopButton, historyButton, profileButton, settingsButton])
    }

    private func createLvlButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Lvl 1", for: .normal)
        button.setBackgroundImage(UIImage(named: "Property 1=Secondary"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    private func createShopButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "Property 1=Shop"), for: .normal)
        button.setImage(UIImage(named: "bag"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false

        // Add target action for the shop button
        button.addTarget(self, action: #selector(shopButtonTapped), for: .touchUpInside)

        return button
    }

    // Кастомная кнопка возврата
    @objc private func shopButtonTapped() {
        let imageButtonViewController = ImageButtonViewController()
        let button = UIButton(type: .custom)
        let image = UIImage(named: "Button Back")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        imageButtonViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        imageButtonViewController.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(imageButtonViewController, animated: true)
    }

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    private func createHistoryButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "Property 1=Shop"), for: .normal)
        button.setImage(UIImage(named: "book"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        // Add target action for the history button
        button.addTarget(self, action: #selector(historyButtonTapped), for: .touchUpInside)
        return button
    }

    @objc private func historyButtonTapped() {
        let historyViewController = HistoryView()
        navigationController?.pushViewController(historyViewController, animated: true)
    }

    private func createProfileButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "Property 1=Shop"), for: .normal)
        button.setImage(UIImage(named: "frame"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    private func createSettingsButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "Property 1=Shop"), for: .normal)
        button.setImage(UIImage(named: "setting-2"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    private func setupLayout(ovalButton: UIButton, circleButtons: [UIButton]) {
        // Настройка овальной кнопки
        NSLayoutConstraint.activate([
            ovalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ovalButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            ovalButton.widthAnchor.constraint(equalToConstant: 240),
            ovalButton.heightAnchor.constraint(equalToConstant: 60)
        ])

        // Создание горизонтального стека для круглых кнопок
        let stackView = UIStackView(arrangedSubviews: circleButtons)
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        // Настройка авторазмещения для стека
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: ovalButton.topAnchor, constant: -20),
            stackView.widthAnchor.constraint(equalToConstant: 300),
            stackView.heightAnchor.constraint(equalToConstant: 60)
        ])

        // Настройка авторазмещения для круглых кнопок в стеке
        for button in circleButtons {
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 60),
                button.heightAnchor.constraint(equalToConstant: 60)
            ])
        }
    }
}
