//
//  SelfSizedTableView.swift
//  Swift Snippets
//
//  github.com/032nnxkitty
//

import UIKit

fileprivate enum Section {
    case main
}

fileprivate struct CellModel: Hashable {
    var title: String
}

class ViewController: UITableViewController {
    private let identifier = "cell.identifier"
    
    private lazy var diffableDataSource: UITableViewDiffableDataSource<Section, CellModel> = {
        return UITableViewDiffableDataSource<Section, CellModel>(tableView: self.tableView) { tableView, indexPath, model in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = model.title
            cell.contentConfiguration = content
            return cell
        }
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fillArray()
        configureAppearance()
        configureDiffableDataSource()
    }
    
    // MARK: - Table View Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if modelsArray[indexPath.row].isMarked {
            modelsArray[indexPath.row].isMarked.toggle()
        } else {
            var selectedModel = modelsArray.remove(at: indexPath.row)
            selectedModel.isMarked.toggle()
            modelsArray.insert(selectedModel, at: 0)
        }
        configureDiffableDataSource()
    }
}

// MARK: - Private Methods
private extension ViewController {
    func configureAppearance() {
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        diffableDataSource.defaultRowAnimation = .fade
        tableView.dataSource = diffableDataSource
    }
    
    func configureDiffableDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, CellModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(modelsArray, toSection: .main)
        diffableDataSource.apply(snapshot)
    }
}
