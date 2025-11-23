#include <stdio.h>
#include <stdlib.h>

#define MAX 100  // Maximum size of the array

// Structure to represent each node in the array-based BST
typedef struct tree_array
{
    int info;   // Stores the data value
    int used;   // Flag: 1 if position is occupied, 0 if empty
} NODE;

/* 
 * ARRAY-BASED BST CONCEPT:
 * ------------------------
 * Instead of using pointers, we use array indexing to represent tree structure.
 * 
 * For a node at index i:
 * - Left child is at index:  2*i + 1
 * - Right child is at index: 2*i + 2
 * - Parent is at index:      (i-1)/2
 * 
 * Root is always at index 0.
 * 
 * Example tree:        50
 *                    /    \
 *                  30      70
 *                 /  \    /  \
 *               20   40  60  80
 * 
 * Array representation:
 * Index: 0   1   2   3   4   5   6
 * Value: 50  30  70  20  40  60  80
 */

// Function to initialize the BST array - mark all positions as unused
void initialize(NODE tree[], int size)
{
    for(int i = 0; i < size; i++)
    {
        tree[i].used = 0;  // 0 means position is empty/unused
        tree[i].info = 0;  // Initialize data to 0
    }
}

// Function to insert a value into the BST
void insert(NODE tree[], int value)
{
    
    // If tree is empty (root doesn't exist), insert at root
    if(tree[0].used == 0)
    {
        tree[0].info = value;
        tree[0].used = 1;
        printf("Inserted %d at root (index 0)\n", value);
        return;
    }
    int index = 0;  // Start from root position
    
    // Traverse the tree to find the correct position
    while(1)
    {
        // Check if we've exceeded array bounds
        if(index >= MAX)
        {
            printf("Error: Tree is full! Cannot insert %d\n", value);
            return;
        }
        
        // BST property: smaller values go to left subtree
        if(value < tree[index].info)
        {
            int left_child = 2 * index + 1;  // Calculate left child index
            
            // If left child position is empty, insert here
            if(tree[left_child].used == 0)
            {
                tree[left_child].info = value;
                tree[left_child].used = 1;
                printf("Inserted %d at index %d (left of %d)\n", 
                       value, left_child, tree[index].info);
                return;
            }
            // Otherwise, continue traversing down left subtree
            index = left_child;
        }
        // BST property: larger values go to right subtree
        else if(value > tree[index].info)
        {
            int right_child = 2 * index + 2;  // Calculate right child index
            
            // If right child position is empty, insert here
            if(tree[right_child].used == 0)
            {
                tree[right_child].info = value;
                tree[right_child].used = 1;
                printf("Inserted %d at index %d (right of %d)\n", 
                       value, right_child, tree[index].info);
                return;
            }
            // Otherwise, continue traversing down right subtree
            index = right_child;
        }
        else  // Duplicate value found
        {
            printf("Value %d already exists in tree. Duplicates not allowed.\n", value);
            return;
        }
    }
}

// Function to search for a value in the BST
int search(NODE tree[], int value)
{
    int index = 0;  // Start from root
    
    // Traverse until we find the value or reach an empty position
    while(index < MAX || tree[index].used == 1)
    {
        if(value == tree[index].info)
        {
            printf("Found %d at index %d\n", value, index);
            return index;  // Return the index where value was found
        }
        else if(value < tree[index].info)
        {
            index = 2 * index + 1;  // Go to left child
        }
        else
        {
            index = 2 * index + 2;  // Go to right child
        }
    }
    
    printf("Value %d not found in tree\n", value);
    return -1;  // Return -1 if not found
}

// Inorder traversal: Left -> Root -> Right (gives sorted output for BST)
void inorder(NODE tree[], int index)
{
    // Base case: if index is out of bounds or position is empty, return
    if(index >= MAX || tree[index].used == 0)
        return;
    
    inorder(tree, 2 * index + 1);      // Visit left subtree
    printf("%d ", tree[index].info);    // Visit root
    inorder(tree, 2 * index + 2);      // Visit right subtree
}

// Preorder traversal: Root -> Left -> Right
void preorder(NODE tree[], int index)
{
    if(index >= MAX || tree[index].used == 0)
        return;
    
    printf("%d ", tree[index].info);    // Visit root
    preorder(tree, 2 * index + 1);      // Visit left subtree
    preorder(tree, 2 * index + 2);      // Visit right subtree
}

// Postorder traversal: Left -> Right -> Root
void postorder(NODE tree[], int index)
{
    if(index >= MAX || tree[index].used == 0)
        return;
    
    postorder(tree, 2 * index + 1);     // Visit left subtree
    postorder(tree, 2 * index + 2);     // Visit right subtree
    printf("%d ", tree[index].info);    // Visit root
}

// Function to display the tree structure level by level
void display_tree(NODE tree[])
{
    printf("\nTree Structure (Index: Value):\n");
    for(int i = 0; i < MAX; i++)
    {
        if(tree[i].used == 1)
        {
            printf("Index %d: %d\n", i, tree[i].info);
        }
    }
}

// Main function to demonstrate BST operations
int main()
{
    NODE tree[MAX];  // Declare array to hold BST
    
    // Initialize all positions as empty
    initialize(tree, MAX);
    
    printf("=== Binary Search Tree using Array Implementation ===\n\n");
    
    // Insert values into BST
    printf("--- Inserting values ---\n");
    insert(tree, 50);
    insert(tree, 30);
    insert(tree, 70);
    insert(tree, 20);
    insert(tree, 40);
    insert(tree, 60);
    insert(tree, 80);
    insert(tree, 10);
    insert(tree, 25);
    
    // Display the tree structure
    display_tree(tree);
    
    // Test search operation
    printf("\n--- Searching for values ---\n");
    search(tree, 40);
    search(tree, 100);
    
    // Demonstrate different traversals
    printf("\n--- Tree Traversals ---\n");
    printf("Inorder (sorted):   ");
    inorder(tree, 0);
    
    printf("\nPreorder:           ");
    preorder(tree, 0);
    
    printf("\nPostorder:          ");
    postorder(tree, 0);
    printf("\n");
    
    return 0;
}

/*
 * ADVANTAGES of Array Implementation:
 * 1. Simple indexing - no pointer manipulation needed
 * 2. Easy to implement parent-child relationships using formulas
 * 3. Cache-friendly for complete/nearly complete trees
 * 
 * DISADVANTAGES:
 * 1. Wastes space if tree is skewed (not balanced)
 * 2. Fixed size - must know maximum size in advance
 * 3. For a skewed tree with n nodes, might need array of size 2^n
 * 4. No easy way to delete nodes (would leave holes in array)
 * 
 * Example of space waste in skewed tree:
 * If we insert: 10, 20, 30, 40 (right-skewed)
 * Indices used: 0, 2, 6, 14 (most positions wasted!)
 */