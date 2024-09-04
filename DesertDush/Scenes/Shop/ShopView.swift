import UIKit

class ShopView: UIViewController {
    
    let backgroundImageView = createBackgroundImageView()
    let scrollView = createScrollView()
    let contentView = createContentView()
    
    private let imageButton1: UIButton = {
        return createShopButton(imageName: "BG", width: 163, height: 253)
    }()
    
    private let imageButton2: UIButton = {
        return createShopButton(imageName: "BG (1)", width: 163, height: 253)
    }()
    
    private let imageButton3: UIButton = {
        return createShopButton(imageName: "BG (2)", width: 163, height: 253)
    }()
    
    private let imageButton4: UIButton = {
        return createShopButton(imageName: "BG (3)", width: 163, height: 253)
    }()
    
    private let imageButton5: UIButton = {
        return createShopButton(imageName: "BG (4)", width: 163, height: 253)
    }()
    
    private let imageButton6: UIButton = {
        return createShopButton(imageName: "BG (5)", width: 163, height: 253)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        // Установка фонового изображения для всего представления
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
