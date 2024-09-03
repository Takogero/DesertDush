import UIKit

class ImageButtonViewController: UIViewController {

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let imageButton1: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "BG"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 163).isActive = true
        button.heightAnchor.constraint(equalToConstant: 253).isActive = true
        return button
    }()

    private let imageButton2: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "BG (1)"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 163).isActive = true
        button.heightAnchor.constraint(equalToConstant: 253).isActive = true
        return button
    }()

    private let imageButton3: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "BG (2)"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 163).isActive = true
        button.heightAnchor.constraint(equalToConstant: 253).isActive = true
        return button
    }()

    private let imageButton4: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "BG (3)"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 163).isActive = true
        button.heightAnchor.constraint(equalToConstant: 253).isActive = true
        return button
    }()

    private let imageButton5: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "BG (4)"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 163).isActive = true
        button.heightAnchor.constraint(equalToConstant: 253).isActive = true
        return button
    }()

    private let imageButton6: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "BG (5)"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 163).isActive = true
        button.heightAnchor.constraint(equalToConstant: 253).isActive = true
        return button
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

        // Добавление scrollView и contentView
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        // Настройка ограничений для scrollView
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        // Настройка ограничений для contentView
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        // Создаем первый горизонтальный стек для первых двух кнопок
        let topStackView = UIStackView(arrangedSubviews: [imageButton1, imageButton2])
        topStackView.axis = .horizontal
        topStackView.spacing = 9
        topStackView.distribution = .fillEqually
        topStackView.translatesAutoresizingMaskIntoConstraints = false

        // Создаем второй горизонтальный стек для следующих двух кнопок
        let middleStackView = UIStackView(arrangedSubviews: [imageButton3, imageButton4])
        middleStackView.axis = .horizontal
        middleStackView.spacing = 9
        middleStackView.distribution = .fillEqually
        middleStackView.translatesAutoresizingMaskIntoConstraints = false

        // Создаем третий горизонтальный стек для последних двух кнопок
        let bottomStackView = UIStackView(arrangedSubviews: [imageButton5, imageButton6])
        bottomStackView.axis = .horizontal
        bottomStackView.spacing = 9
        bottomStackView.distribution = .fillEqually
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false

        // Создаем вертикальный стек для размещения трех горизонтальных стеков
        let verticalStackView = UIStackView(arrangedSubviews: [topStackView, middleStackView, bottomStackView])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 9
        verticalStackView.distribution = .fillEqually
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(verticalStackView)

        // Настройте ограничения для вертикального стека
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -9)
        ])
    }
}
