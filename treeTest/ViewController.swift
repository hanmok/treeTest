//
//  ViewController.swift
//  treeTest
//
//  Created by Mac mini on 2021/10/30.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private let createButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleCreateAction), for: .touchUpInside)
        btn.setTitle("create", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    private let fetchButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleFetchAction), for: .touchUpInside)
        btn.setTitle("fetch", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    private let removeButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleRemoveAction), for: .touchUpInside)
        btn.setTitle("remove", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    private let makeRelationButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleCreateRelationAction), for: .touchUpInside)
        btn.setTitle("CreateRelation", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    private let testButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(testAction), for: .touchUpInside)
        btn.setTitle("test", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    @objc func testAction() {
        print("test")
    }
    
//    private let createButton: UIButton = {
//        let btn = UIButton()
//        btn.addTarget(self, action: #selector(handleCreateAction), for: .touchUpInside)
//        return btn
//    }()
    
    @objc func handleCreateAction() {
        create()
    }
    
    @objc func handleFetchAction() {
        fetch()
    }
    
    @objc func handleRemoveAction() {
        remove()
    }
    
    @objc func handleCreateRelationAction() {
        createRelation()
    }
    
    func createRelation() {
        
            let newNode1 = TreeNode(context: self.context)
            newNode1.leftChild = "I'm left"
            newNode1.rightChild = "I'm right"
            
           
        
        let newNode2 = TreeNode(context: self.context)
        newNode2.leftChild = "I'm left of newNode2"
        newNode2.rightChild = "I'm right of newNode2"
        
        let newNode3 = TreeNode(context: self.context)
        newNode3.leftChild = "I'm left of newNode3"
        newNode3.rightChild = "I'm right of newNode3"
        
        let newNode4 = TreeNode(context: self.context)
        newNode4.leftChild = "I'm left of newNode4"
        newNode4.rightChild = "I'm right of newNode4"
        
        do {
            try self.context.save()
            
        } catch {
            print("failed create")
        }
        
        newNode1.addToChildren(newNode2)
        newNode2.parent = newNode1
        newNode1.addToChildren(newNode3)
        newNode1.addToChildren(newNode4)
        
        print("newNode1.children.count: \(newNode1.children?.count)")
           // how come it has three nodes ? zzzz i got it..
        fetch()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let uistack = UIStackView(arrangedSubviews: [createButton, fetchButton, removeButton, makeRelationButton, testButton])
        uistack.axis = .vertical
        uistack.distribution = .fillEqually
        uistack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(uistack)
        
        uistack.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        uistack.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        uistack.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        uistack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive  = true
    }

    var nodes: [TreeNode]?
    
    func create() {
        let newNode = TreeNode(context: self.context)
        newNode.leftChild = "I'm left"
        newNode.rightChild = "I'm right"
        
        do {
            try self.context.save()
            
        } catch {
            print("failed create")
        }
        fetch()
    }

    // remove all
    func remove() {
        fetch()
        while let nodeToRemove2 = self.nodes?[0] {
            self.context.delete(nodeToRemove2)
            do {
                try self.context.save()
                fetch()
            } catch {
                print("failed to remove")
            }
        }
        
//        guard let nodeToRemove = self.nodes?[0] else { return }
////        self.context.delete
//        self.context.delete(nodeToRemove)
//
//        do {
//            try self.context.save()
//
//        } catch {
//            print("failed to remove")
//        }
//        fetch()
        
        
//        self.context.delete(<#T##object: NSManagedObject##NSManagedObject#>)
    }
    
    func fetch() {
        do {
            let request = TreeNode.fetchRequest() as NSFetchRequest<TreeNode>
            
            self.nodes = try context.fetch(request)
            print("items: \(self.nodes)")
            print("count: \(self.nodes?.count)")
            
        } catch {
            print("failed to fetch")
        }
    }
    
    
}

