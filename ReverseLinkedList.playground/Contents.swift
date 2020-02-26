/// Вернуть обратный связанный список
// Сложность O(n)

class ListNode {
	var value: Int
	var next: ListNode?
	
	init(value: Int, next: ListNode?) {
		self.value = value
		self.next = next
	}
}

// 1. С помощью if-else условий

func reverseList(node: ListNode) -> ListNode {
	
	var newNode = node
	var counter = 0
	var lastNode: ListNode!
	var reverseNode: ListNode!
	
	while newNode.next != nil {
		
		if counter == 0 {
			lastNode = ListNode(value: newNode.value, next: nil)
			counter += 1
		} else if counter == 1 {
			reverseNode = ListNode(value: newNode.value, next: lastNode)
			counter += 1
		} else {
			reverseNode = ListNode(value: newNode.value, next: reverseNode)
		}
		if let next = newNode.next {
			newNode = next
		}
		if newNode.next == nil {
			reverseNode = ListNode(value: newNode.value, next: reverseNode)
		}
	}
	
	return reverseNode
}

// 2. С помощью присвоения "подготовленных" значений текущей ноды обратной

func reverseList2(node: ListNode) -> ListNode {
	
	var currentNode: ListNode? = node
	var reverseNode: ListNode!
	var nextNode: ListNode?
	
	while currentNode != nil {
		nextNode = currentNode?.next
		currentNode?.next = reverseNode
		reverseNode = currentNode
		currentNode = nextNode
	}
	return reverseNode
}

func createNode(from array: [Int]) -> ListNode? {
	
	var node: ListNode?
	
	for (index, element) in array.reversed().enumerated() {
		if index == 0 {
			node = ListNode(value: element, next: nil)
		} else {
			node = ListNode(value: element, next: node)
		}
	}
	
	return node
}

var array = [1, 6, 3, 8, 4, 5, 1, 2, 7, 7, 7, 3]

let node = createNode(from: array) ?? ListNode(value: -1, next: nil)

dump(reverseList(node: node))
dump(reverseList2(node: node))
