//
//  TreeNode+CoreDataProperties.swift
//  treeTest
//
//  Created by Mac mini on 2021/10/30.
//
//

import Foundation
import CoreData


extension TreeNode {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TreeNode> {
        return NSFetchRequest<TreeNode>(entityName: "TreeNode")
    }

    @NSManaged public var leftChild: String?
    @NSManaged public var rightChild: String?
    @NSManaged public var children: NSSet?
    @NSManaged public var parent: TreeNode?

}

// MARK: Generated accessors for children
extension TreeNode {

    @objc(addChildrenObject:)
    @NSManaged public func addToChildren(_ value: TreeNode)

    @objc(removeChildrenObject:)
    @NSManaged public func removeFromChildren(_ value: TreeNode)

    @objc(addChildren:)
    @NSManaged public func addToChildren(_ values: NSSet)

    @objc(removeChildren:)
    @NSManaged public func removeFromChildren(_ values: NSSet)

}

extension TreeNode : Identifiable {

}
