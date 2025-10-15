#include <stdio.h>
#include <stdlib.h>

// Define the structure for a node
struct Node {
    int data;
    struct Node* left;
    struct Node* right;
};

// Create a new node
struct Node* createNode(int value) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = value;
    newNode->left = newNode->right = NULL;
    return newNode;
}

// Recursive insert function
struct Node* insert(struct Node* root, int value) {
    if (root == NULL)
        return createNode(value);

    if (value < root->data)
        root->left = insert(root->left, value);
    else if (value > root->data)
        root->right = insert(root->right, value);

    // Duplicate values are ignored
    return root;
}

// Recursive search function
struct Node* search(struct Node* root, int key) {
    if (root == NULL || root->data == key)
        return root; // found or not found

    if (key < root->data)
        return search(root->left, key);
    else
        return search(root->right, key);
}

// Recursive inorder traversal (Left → Root → Right)
void inorder(struct Node* root) {
    if (root == NULL)
        return;
    inorder(root->left);
    printf("%d ", root->data);
    inorder(root->right);
}

// Recursive delete function
struct Node* deleteNode(struct Node* root, int key) {
    if (root == NULL)
        return NULL;

    if (key < root->data)
        root->left = deleteNode(root->left, key);
    else if (key > root->data)
        root->right = deleteNode(root->right, key);
    else {
        // Node found, has one or 0 children
        if (root->left == NULL) {
            struct Node* temp = root->right;
            free(root);
            return temp;
        } else if (root->right == NULL) {
            struct Node* temp = root->left;
            free(root);
            return temp;
        }

        // Node with two children: get inorder successor
        struct Node* temp = root->right;
        while (temp->left != NULL)
            temp = temp->left;

        root->data = temp->data;
        root->right = deleteNode(root->right, temp->data);
    }
    return root;
}

// Main
int main() {
    struct Node* root = NULL;
    root = insert(root, 50);
    root = insert(root, 30);
    root = insert(root, 70);
    root = insert(root, 20);
    root = insert(root, 40);
    root = insert(root, 60);
    root = insert(root, 80);

    printf("Inorder traversal: ");
    inorder(root);
    printf("\n");

    int key = 40;
    if (search(root, key))
        printf("%d found in BST\n", key);
    else
        printf("%d not found in BST\n", key);

    root = deleteNode(root, 20);
    printf("After deleting 20: ");
    inorder(root);
    printf("\n");

    root = deleteNode(root, 30);
    printf("After deleting 30: ");
    inorder(root);
    printf("\n");

    root = deleteNode(root, 50);
    printf("After deleting 50: ");
    inorder(root);
    printf("\n");

    return 0;
}
