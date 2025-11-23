#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

/*
 * EXPRESSION TREE CONCEPT:
 * ------------------------
 * An expression tree is a binary tree where:
 * - LEAF nodes contain operands (numbers/variables)
 * - INTERNAL nodes contain operators (+, -, *, /, etc.)
 * 
 * Example: Postfix expression "ab+c*"  represents (a+b)*c
 * 
 * Tree structure:
 *           *
 *          / \
 *         +   c
 *        / \
 *       a   b
 * 
 * POSTFIX TO TREE ALGORITHM:
 * 1. Scan postfix expression left to right
 * 2. If operand: create node and push to stack
 * 3. If operator: create node, pop two operands as children, push back
 * 4. Final stack top is the root of expression tree
 */

// Structure for a tree node
typedef struct Node
{
    char data;              // Stores operator or operand
    struct Node *left;      // Pointer to left child
    struct Node *right;     // Pointer to right child
} NODE;

// Structure for stack to hold tree nodes during construction
typedef struct StackNode
{
    NODE *treeNode;         // Pointer to a tree node
    struct StackNode *next; // Pointer to next stack element
} STACK_NODE;

// Function to create a new tree node
NODE* createNode(char data)
{
    NODE *newNode = (NODE*)malloc(sizeof(NODE));
    if(newNode == NULL)
    {
        printf("Memory allocation failed!\n");
        exit(1);
    }
    newNode->data = data;
    newNode->left = NULL;
    newNode->right = NULL;
    return newNode;
}

// Function to check if a character is an operator
int isOperator(char ch)
{
    // Returns 1 if ch is an operator, 0 otherwise
    return (ch == '+' || ch == '-' || ch == '*' || ch == '/' || 
            ch == '^' || ch == '%');
}

// Push a tree node onto the stack
void push(STACK_NODE **top, NODE *treeNode)
{
    // Create a new stack node
    STACK_NODE *newStackNode = (STACK_NODE*)malloc(sizeof(STACK_NODE));
    if(newStackNode == NULL)
    {
        printf("Stack overflow!\n");
        exit(1);
    }
    
    newStackNode->treeNode = treeNode;  // Store the tree node
    newStackNode->next = *top;          // Link to previous top
    *top = newStackNode;                // Update top pointer
}

// Pop a tree node from the stack
NODE* pop(STACK_NODE **top)
{
    // Check if stack is empty
    if(*top == NULL)
    {
        printf("Stack underflow!\n");
        return NULL;
    }
    
    STACK_NODE *temp = *top;            // Store current top
    NODE *treeNode = temp->treeNode;    // Get the tree node
    *top = (*top)->next;                // Move top to next node
    free(temp);                         // Free the stack node
    
    return treeNode;                    // Return the tree node
}

// Function to check if stack is empty
int isEmpty(STACK_NODE *top)
{
    return (top == NULL);
}

/*
 * CONSTRUCT EXPRESSION TREE FROM POSTFIX
 * Algorithm:
 * 1. Initialize empty stack
 * 2. Scan postfix expression from left to right:
 *    a) If operand: Create node and push to stack
 *    b) If operator: 
 *       - Pop two nodes (right child, then left child)
 *       - Create operator node with these as children
 *       - Push new node to stack
 * 3. Final stack element is root of tree
 */
NODE* constructTree(char postfix[])
{
    STACK_NODE *stack = NULL;  // Initialize empty stack
    int i;
    
    printf("\n--- Building Expression Tree ---\n");
    
    // Process each character in postfix expression
    for(i = 0; postfix[i] != '\0'; i++)
    {
        char ch = postfix[i];
        
        // Skip spaces
        if(ch == ' ')
            continue;
        
        // If operand (letter or digit), create leaf node
        if(isalnum(ch))
        {
            NODE *node = createNode(ch);
            push(&stack, node);
            printf("Operand '%c': Created leaf node and pushed to stack\n", ch);
        }
        // If operator, create internal node
        else if(isOperator(ch))
        {
            // Pop two operands (order matters!)
            NODE *rightChild = pop(&stack);  // Second operand (right)
            NODE *leftChild = pop(&stack);   // First operand (left)
            
            // Create operator node
            NODE *operatorNode = createNode(ch);
            operatorNode->left = leftChild;
            operatorNode->right = rightChild;
            
            // Push operator node back to stack
            push(&stack, operatorNode);
            
            printf("Operator '%c': Created node with left='%c' and right='%c'\n",
                   ch, leftChild->data, rightChild->data);
        }
    }
    
    // The final element in stack is the root of expression tree
    NODE *root = pop(&stack);
    
    // Stack should be empty now
    if(!isEmpty(stack))
    {
        printf("Error: Invalid postfix expression!\n");
        return NULL;
    }
    
    return root;
}

/*
 * TREE TRAVERSALS:
 * ----------------
 * Inorder (Left-Root-Right):   Gives infix expression (may need parentheses)
 * Preorder (Root-Left-Right):  Gives prefix expression
 * Postorder (Left-Right-Root): Gives postfix expression
 */

// Inorder traversal - produces INFIX expression
void inorder(NODE *root)
{
    if(root == NULL)
        return;
    
    // If current node is operator, add parentheses for clarity
    if(isOperator(root->data))
        printf("(");
    
    inorder(root->left);           // Visit left subtree
    printf("%c", root->data);      // Visit root
    inorder(root->right);          // Visit right subtree
    
    if(isOperator(root->data))
        printf(")");
}

// Preorder traversal - produces PREFIX expression
void preorder(NODE *root)
{
    if(root == NULL)
        return;
    
    printf("%c ", root->data);     // Visit root
    preorder(root->left);          // Visit left subtree
    preorder(root->right);         // Visit right subtree
}

// Postorder traversal - produces POSTFIX expression
void postorder(NODE *root)
{
    if(root == NULL)
        return;
    
    postorder(root->left);         // Visit left subtree
    postorder(root->right);        // Visit right subtree
    printf("%c ", root->data);     // Visit root
}

/*
 * EVALUATE EXPRESSION TREE
 * Recursively evaluate the tree by:
 * 1. If leaf node (operand): return its numeric value
 * 2. If internal node (operator): 
 *    - Recursively evaluate left and right subtrees
 *    - Apply operator to the results
 */
int evaluate(NODE *root)
{
    // Base case: if leaf node, return its value
    // (Assuming single digit operands for simplicity)
    if(root->left == NULL && root->right == NULL)
    {
        // Convert character digit to integer
        return (root->data - '0');
    }
    
    // Recursively evaluate left and right subtrees
    int leftValue = evaluate(root->left);
    int rightValue = evaluate(root->right);
    
    // Apply the operator
    switch(root->data)
    {
        case '+': return leftValue + rightValue;
        case '-': return leftValue - rightValue;
        case '*': return leftValue * rightValue;
        case '/': 
            if(rightValue == 0)
            {
                printf("Error: Division by zero!\n");
                exit(1);
            }
            return leftValue / rightValue;
        case '^': 
        {
            // Calculate power
            int result = 1;
            for(int i = 0; i < rightValue; i++)
                result *= leftValue;
            return result;
        }
        case '%': return leftValue % rightValue;
        default:
            printf("Unknown operator: %c\n", root->data);
            return 0;
    }
}

// Function to display tree structure (for visualization)
void displayTree(NODE *root, int space)
{
    if(root == NULL)
        return;
    
    // Increase distance between levels
    space += 5;
    
    // Print right subtree first (top of display)
    displayTree(root->right, space);
    
    // Print current node with indentation
    printf("\n");
    for(int i = 5; i < space; i++)
        printf(" ");
    printf("%c\n", root->data);
    
    // Print left subtree (bottom of display)
    displayTree(root->left, space);
}

// Main function to demonstrate expression tree operations
int main()
{
    char postfix[100];
    
    printf("=== POSTFIX EXPRESSION TREE IMPLEMENTATION ===\n\n");
    
    // Example 1: Simple expression
    printf("Example 1: ab+c*\n");
    printf("This represents: (a + b) * c\n");
    strcpy(postfix, "ab+c*");
    
    NODE *root1 = constructTree(postfix);
    
    printf("\nTree Structure:\n");
    displayTree(root1, 0);
    
    printf("\nTraversals:\n");
    printf("Inorder (Infix):    ");
    inorder(root1);
    printf("\nPreorder (Prefix):  ");
    preorder(root1);
    printf("\nPostorder (Postfix): ");
    postorder(root1);
    printf("\n");
    
    // Example 2: Numeric expression for evaluation
    printf("\n\n======================================\n");
    printf("Example 2: 53+82-*\n");
    printf("This represents: (5 + 3) * (8 - 2)\n");
    strcpy(postfix, "53+82-*");
    
    NODE *root2 = constructTree(postfix);
    
    printf("\nTree Structure:\n");
    displayTree(root2, 0);
    
    printf("\nTraversals:\n");
    printf("Inorder (Infix):    ");
    inorder(root2);
    printf("\nPreorder (Prefix):  ");
    preorder(root2);
    printf("\nPostorder (Postfix): ");
    postorder(root2);
    
    printf("\n\nEvaluation Result: %d\n", evaluate(root2));
    printf("Verification: (5+3) * (8-2) = 8 * 6 = 48\n");
    
    // Example 3: Complex expression
    printf("\n\n======================================\n");
    printf("Example 3: 62/3-42*+\n");
    printf("This represents: (6/2 - 3) + (4 * 2)\n");
    strcpy(postfix, "62/3-42*+");
    
    NODE *root3 = constructTree(postfix);
    
    printf("\nTree Structure:\n");
    displayTree(root3, 0);
    
    printf("\nTraversals:\n");
    printf("Inorder (Infix):    ");
    inorder(root3);
    printf("\nPreorder (Prefix):  ");
    preorder(root3);
    printf("\nPostorder (Postfix): ");
    postorder(root3);
    
    printf("\n\nEvaluation Result: %d\n", evaluate(root3));
    printf("Verification: (6/2 - 3) + (4*2) = (3-3) + 8 = 0 + 8 = 8\n");
    
    return 0;
}

/*
 * KEY POINTS:
 * -----------
 * 1. Postfix expressions don't need parentheses - operator precedence is implicit
 * 2. Stack is crucial for building the tree from postfix notation
 * 3. Operators become internal nodes, operands become leaf nodes
 * 4. Tree traversals give different notations:
 *    - Inorder → Infix (needs parentheses)
 *    - Preorder → Prefix
 *    - Postorder → Postfix
 * 5. Evaluation is done via recursive postorder traversal
 * 
 * TIME COMPLEXITY: O(n) where n is number of characters in expression
 * SPACE COMPLEXITY: O(n) for the stack and tree nodes
 */