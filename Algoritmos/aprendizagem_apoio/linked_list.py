# https://www.youtube.com/watch?v=jIM87UqOq3g

class Node:
    def __init__(self, value):
        self.value = value
        self.next = None


class LinkedList:
    def __init__(self) -> None:
        self.head = None #Primeira iteração (10)

    def append(self, value):
        new_node = Node(value)

        # se a lista está vazia
        if not self.head:
            self.head = new_node
            return

        # percorre até o fim
        current = self.head
        while current.next:
            current = current.next
        current.next = new_node


    def display(self):
        current = self.head
        while current:
            print(current.value, end=" -> ")
            current = current.next
        print("None")



ll = LinkedList()
ll.append(10)
ll.append(20)
ll.append(30)
ll.append(40)
ll.append(50)
ll.append(60)

ll.display()
