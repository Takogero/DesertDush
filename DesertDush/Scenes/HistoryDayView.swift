import UIKit

class HistoryDayView: UIViewController {

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

    private let textView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textColor = .black
        textView.backgroundColor = .clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(backgroundImageView)
        view.addSubview(scrollView)
        scrollView.addSubview(textView)

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

        // Set up constraints for the text view
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            textView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            textView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40)
        ])

        // Set up the custom back button
        let backButton = createBackButton()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)

        // Set up the text for the text view
        textView.text = "Welcome to the first day of our journey into the captivating world of sweets. Today, we embark on a voyage through time, exploring the ancient origins and early evolution of confectionery delights that have enchanted civilizations for centuries. Introduction to Day 1: In the annals of human history, sweetness has held a special place in the hearts and minds of people across cultures and epochs. Our fascination with the delectable allure of sweets traces back to the dawn of civilization itself, where the pursuit of sugary indulgence began as a quest for natural sweetness.The Cradle of Sweetness: Our journey commences in the ancient civilizations of Mesopotamia and Egypt, where the earliest traces of sweet indulgence can be found. In these ancient lands, honey emerged as the first natural sweetener, revered for its divine taste and perceived medicinal properties. The ancient Egyptians, in particular, cherished honey as a precious gift from the gods and used it not only as a sweetener but also in religious ceremonies and embalming rituals.The Spice Routes and the Birth of Confectionery: As trade routes expanded and civilizations interconnected, the exchange of goods and ideas ushered in a new era of confectionery. The spice trade routes of the ancient world became conduits for the dissemination of exotic flavors and culinary techniques. Spices such as cinnamon, cloves, and nutmeg found their way into the kitchens of ancient Rome, Greece, and Persia, where they were combined with honey and nuts to create early forms of confectionery.The Sweet Symphonies of the Mediterranean: In the Mediterranean world, the Greeks and Romans elevated the art of confectionery to new heights, introducing innovations such as candied fruits, pastries, and early versions of nougat and marzipan. These delectable creations adorned banquet tables, graced festive celebrations, and became symbols of wealth and social status.The Sweet Influence of the East: As empires rose and fell, the allure of sweetness continued to spread eastward, carried by the winds of trade and cultural exchange. In the medieval courts of the Middle East and Persia, master confectioners perfected the craft of sugar confectionery, creating intricate designs and exquisite delicacies that delighted the senses and captivated the imagination.Conclusion of Day 1: As we conclude our exploration of the ancient origins of sweetness, we are reminded of the enduring legacy of confectionery—a testament to the human quest for pleasure, creativity, and cultural expression. Join us tomorrow as we delve deeper into the rich tapestry of sweet history, uncovering new treasures and untold stories along the way.Stay tuned for Day 2: The Age of Exploration and the Globalization of Sweetness."
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
