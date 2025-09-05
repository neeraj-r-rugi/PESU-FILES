#include <stdio.h>
#include <stdlib.h>

struct Node {
    int val;
    struct Node * next;
    struct Node * prev;
};

int* toArray(struct Node* node, int* returnSize) {
    struct Node* head = node;
    while (head->prev != NULL) {
        head = head->prev;
    }
    struct Node* curr = head;
    int size = 0;
    while (curr != NULL) {
        size++;
        curr = curr->next;
    }
    int* arr = malloc(size * sizeof(int));
    curr = head;
    for (int i = 0; i < size; i++) {
        arr[i] = curr->val;
        curr = curr->next;
    }
    
    *returnSize = size;
    return arr;
}


//helper and main functions 
struct Node* createNode(int val) {
    struct Node* node = (struct Node*)malloc(sizeof(struct Node));
    node->val = val;
    node->next = NULL;
    node->prev = NULL;
    return node;
}

struct Node* findNodeWithValue(struct Node* head, int targetVal) {
      struct Node * curr;
    curr = head;
    do{
        if(targetVal == curr->val){
            return curr;
        }
        curr = curr->next;
    }while(curr != head);
    return NULL;
}

int main() {
    int n, targetVal;
    scanf("%d", &n);
    
    int* values = (int*)malloc(n * sizeof(int));
    for (int i = 0; i < n; i++) {
        scanf("%d", &values[i]);
    }
    
    scanf("%d", &targetVal);
    
    struct Node* head = createNode(values[0]);
    struct Node* current = head;
    
    for (int i = 1; i < n; i++) {
        struct Node* newNode = createNode(values[i]);
        current->next = newNode;
        newNode->prev = current;
        current = newNode;
    }
    
    struct Node* targetNode = findNodeWithValue(head, targetVal);
    
    if (targetNode == NULL) {
        free(values);
        return 0; // print nothing if not found
    }
    
    int returnSize;
    int* result = toArray(targetNode, &returnSize);
    
    for (int i = 0; i < returnSize; i++) {
        printf("%d", result[i]);
        if (i < returnSize - 1) printf(" ");
    }
    printf("\n");
    
    free(values);
    free(result);
    
    current = head;
    while (current != NULL) {
        struct Node* temp = current;
        current = current->next;
        free(temp);
    }
    
    return 0;
}