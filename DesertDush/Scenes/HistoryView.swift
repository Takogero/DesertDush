import UIKit

class HistoryView: UIViewController {

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
        button.setBackgroundImage(UIImage(named: "History"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 342).isActive = true
        button.heightAnchor.constraint(equalToConstant: 98).isActive = true

        // Add target action for the imageButton1
        button.addTarget(self, action: #selector(imageButton1Tapped), for: .touchUpInside)

        return button
    }()

    private let imageButton2: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "History (1)"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 342).isActive = true
        button.heightAnchor.constraint(equalToConstant: 98).isActive = true
        return button
    }()

    private let imageButton3: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "History (2)"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 342).isActive = true
        button.heightAnchor.constraint(equalToConstant: 98).isActive = true
        return button
    }()

    private let imageButton4: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "History (3)"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 342).isActive = true
        button.heightAnchor.constraint(equalToConstant: 98).isActive = true
        return button
    }()

    private let imageButton5: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "History (4)"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 342).isActive = true
        button.heightAnchor.constraint(equalToConstant: 98).isActive = true
        return button
    }()

    private let imageButton6: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "History (5)"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 342).isActive = true
        button.heightAnchor.constraint(equalToConstant: 98).isActive = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(backgroundImageView)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(imageButton1)
        contentView.addSubview(imageButton2)
        contentView.addSubview(imageButton3)
        contentView.addSubview(imageButton4)
        contentView.addSubview(imageButton5)
        contentView.addSubview(imageButton6)

        backgroundImageView.image = UIImage(named: "Splash")

        // Set up constraints for the background image view
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // Set up constraints for the scroll view
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        // Set up constraints for the content view
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
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

            imageButton6.topAnchor.constraint(equalTo: imageButton5.bottomAnchor, constant: 20),
            imageButton6.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageButton6.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])

        // Set up the custom back button
        let backButton = createBackButton()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }

    // Action method for the imageButton1
    @objc private func imageButton1Tapped() {
        let historyDayViewController = HistoryDayView()
        navigationController?.pushViewController(historyDayViewController, animated: true)
    }

    private func createBackButton() -> UIButton {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "Button Back")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
