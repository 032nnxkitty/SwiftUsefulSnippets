//
//  SelfSizedTableView.swift
//  Swift Snippets
//
//  github.com/032nnxkitty
//

final class ViewController: UIViewController {
    // MARK: - UI Elements
    private var scrollView: UIScrollView!
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.crop.circle.fill")
        imageView.tintColor = .systemGray4
        return imageView
    }()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setAvatarImageToNavigationBar()
    }
    
    // MARK: - Private Methods
    private func configureAppearance() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Avatar"
        
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 2000)
        view.addSubview(scrollView)
    }
    
    private func setAvatarImageToNavigationBar() {
        guard let UINavigationBarLargeTitleView = NSClassFromString("_UINavigationBarLargeTitleView") else { return }
        navigationController?.navigationBar.subviews.forEach { barSubview in
            if barSubview.isKind(of: UINavigationBarLargeTitleView.self) {
                barSubview.addSubview(imageView)
                NSLayoutConstraint.activate([
                    imageView.heightAnchor.constraint(equalToConstant: 36),
                    imageView.widthAnchor.constraint(equalToConstant: 36),
                    imageView.trailingAnchor.constraint(equalTo: barSubview.trailingAnchor, constant: -16),
                    imageView.bottomAnchor.constraint(equalTo: barSubview.bottomAnchor, constant: -12)
                ])
            }
        }
    }
}

