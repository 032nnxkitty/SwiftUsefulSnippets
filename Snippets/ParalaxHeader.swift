//
//  SelfSizedTableView.swift
//  Swift Snippets
//
//  github.com/032nnxkitty
//

final class ViewController: UIViewController {
    // MARK: - UI Elements
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "image")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let imageViewHeight: CGFloat = 270
    private lazy var imageViewHeightAnchor = imageView.heightAnchor.constraint(equalToConstant: imageViewHeight)
    private lazy var imageViewTopAnchor = imageView.topAnchor.constraint(equalTo: scrollView.topAnchor)
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 2000)
        scrollView.indicatorStyle = .black
        scrollView.delegate = self
        
        return scrollView
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScrollView()
        configureImageView()
    }
}

// MARK: - Private Methods
private extension ViewController {
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.frame = view.bounds
    }
    
    func configureImageView() {
        scrollView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageViewTopAnchor,
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageViewHeightAnchor
        ])
    }
}

// MARK: - UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        if yOffset < 0 {
            imageViewTopAnchor.constant = yOffset
            imageViewHeightAnchor.constant = imageViewHeight - yOffset
            scrollView.verticalScrollIndicatorInsets.top = imageViewHeight - yOffset - view.safeAreaInsets.top
        }
    }
}

