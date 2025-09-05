#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

// Part of Driver Code Do Not Edit
struct Node {
    int val;
    struct Node* next;
    struct Node* prev;
};

// Part of Driver Code Do Not Edit
struct Node* createNode(int val) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->val = val;
    newNode->next = newNode->prev = NULL;
    return newNode;
}


struct Node* insert(struct Node* head, int insertVal) {
    if(!head){
        return NULL;
    }
    struct Node * curr = head;
    struct Node * temp = (struct Node *) malloc(sizeof(struct Node));
    temp->val = insertVal;
    do{
        if(curr->val <= insertVal && curr->next->val >= insertVal){
            temp->next = curr->next;
            curr->next->prev = temp;
            temp->prev = curr;
            curr->next = temp;
            curr = temp;
            return head;
        }
        curr = curr->next;
    }while(curr != head);
    if(curr == head){
        temp->next = head;
        curr->prev->next = temp;
        temp->prev = curr->prev;
        curr->prev = temp;
        if(insertVal < head->val){
            head = temp;
        }
    }
    return head;
}

void freeCircularList(struct Node* head) {
    if(!head){
        return;
    }
    struct Node * curr = head;
    struct Node * first = head;
    do{
        head = head->next;
        free(curr);
        curr = head;
    }while(curr != first);
}

// Part of Driver Code Do Not Edit
void printCircularList(struct Node* head) {
    if (!head) {
        printf("List is empty.\n");
        return;
    }

    struct Node* temp = head;
    do {
        printf("%d ", temp->val);
        temp = temp->next;
    } while (temp != head);
    printf("\n");
}

// Part of Driver Code Do Not Edit
struct Node* createCircularList(int arr[], int n) {
    if (n == 0) return NULL;

    
    for (int i = 0; i < n - 1; i++) {
        for (int j = i + 1; j < n; j++) {
            if (arr[i] > arr[j]) {
                int temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
    }

    struct Node* head = createNode(arr[0]);
    struct Node* tail = head;

    for (int i = 1; i < n; i++) {
        struct Node* newNode = createNode(arr[i]);
        newNode->prev = tail;
        tail->next = newNode;
        tail = newNode;
    }

    
    tail->next = head;
    head->prev = tail;

    return head; 
}

// Part of Driver Code Do Not Edit
// Main function
int main() {
    int n, insertVal;

    scanf("%d", &n);
    int arr[n];
    for (int i = 0; i < n; i++) {
        scanf("%d", &arr[i]);
    }

    scanf("%d", &insertVal);

    
    struct Node* head = createCircularList(arr, n);

    
    head = insert(head, insertVal);

    
    printCircularList(head);

   
    freeCircularList(head);

    return 0;
}