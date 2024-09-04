import UIKit

class CustomButtonViewController: UIViewController {

    private let backgroundImageView = createBackgroundImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.addSubview(backgroundImageView)

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
//        button.setTitle("Lvl 1", for: .normal)
        button.setBackgroundImage(UIImage(named: "Frame 1"), for: .normal)
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
        button.addTarget(self, action: #selector(shopButtonTapped), for: .touchUpInside)
        return button
    }

    // Кастомная кнопка возврата
    @objc private func shopButtonTapped() {
        let imageButtonViewController = ShopView()
        setupCustomBackButton(for: imageButtonViewController)
        navigationController?.pushViewController(imageButtonViewController, animated: true)
    }

    private func createHistoryButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "Property 1=Shop"), for: .normal)
        button.setImage(UIImage(named: "book"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(historyButtonTapped), for: .touchUpInside)
        return button
    }

    // Кастомная кнопка возврата
    @objc private func historyButtonTapped() {
        let historyViewController = HistoryView()
        setupCustomBackButton(for: historyViewController)
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
        button.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        return button
    }

    @objc private func profileButtonTapped() {
        let profileButtonTapped = ProfileView()
        setupCustomBackButton(for: profileButtonTapped)
        navigationController?.pushViewController(profileButtonTapped, animated: true)
    }

    private func createSettingsButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "Property 1=Shop"), for: .normal)
        button.setImage(UIImage(named: "setting-2"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        return button
    }

    @objc private func settingsButtonTapped() {
        let settingsViewController = SettingsView()
        setupCustomBackButton(for: settingsViewController)
        navigationController?.pushViewController(settingsViewController, animated: true)
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
