#include <stdio.h>
#include <stdlib.h>

/*
 * THREADED BINARY TREE CONCEPT:
 * ==============================
 * In a normal binary tree, many pointers are NULL (wasted space).
 * Threaded trees utilize these NULL pointers to store "threads" - 
 * shortcuts to predecessor/successor nodes for efficient traversal.
 * 
 * THREE TYPES:
 * 
 * 1. RIGHT-THREADED: Right NULL pointers → inorder successor
 * 2. LEFT-THREADED: Left NULL pointers → inorder predecessor
 * 3. FULLY-THREADED (IN-THREADED): Both left and right threads
 * 
 * ADVANTAGES:
 * - Traversal without recursion or stack
 * - Faster access to predecessor/successor
 * - Better space utilization
 */

// ============================================================================
// 1. RIGHT-THREADED BINARY TREE
// ============================================================================

/*
 * RIGHT-THREADED TREE:
 * If right pointer is NULL, it points to inorder successor instead
 * 
 * Example tree:        20
 *                    /    \
 *                  10      30
 *                 /  \    /  \
 *                5   15  25  35
 * 
 * Inorder: 5, 10, 15, 20, 25, 30, 35
 * 
 * Right threads:
 * 5 → 10 (successor)
 * 15 → 20 (successor)
 * 25 → 30 (successor)
 * 35 → NULL (rightmost node)
 */

typedef struct rt_node
{
    int info;                    // Data value
    struct rt_node *left;        // Pointer to left child
    struct rt_node *right;       // Pointer to right child OR inorder successor
    int rthread;                 // 1 if right is thread, 0 if right is child
} RT_NODE;

// Create a new right-threaded node
RT_NODE* createRTNode(int data)
{
    RT_NODE *newNode = (RT_NODE*)malloc(sizeof(RT_NODE));
    newNode->info = data;
    newNode->left = NULL;
    newNode->right = NULL;  // Initially NULL (will be threaded)
    newNode->rthread = 1;    // Initially a thread (points to successor)
    return newNode;
}

// Insert into right-threaded BST
RT_NODE* insertRTNode(RT_NODE *root, int data)
{
    // If tree is empty, create root
    if(root == NULL)
    {
        return createRTNode(data);
    }
    
    RT_NODE *parent = NULL;
    RT_NODE *current = root;
    
    // Find the insertion position
    while(current != NULL)
    {
        parent = current;
        
        if(data < current->info)
        {
            // Go left if left child exists
            if(current->left != NULL)
                current = current->left;
            else
                break;  // Insert as left child
        }
        else if(data > current->info)
        {
            // If rthread is 0, right is a child; otherwise it's a thread
            if(current->rthread == 0)
                current = current->right;
            else
                break;  // Insert as right child
        }
        else
        {
            printf("Duplicate value %d not inserted\n", data);
            return root;
        }
    }
    
    // Create new node
    RT_NODE *newNode = createRTNode(data);
    
    // Insert as left child
    if(data < parent->info)
    {
        newNode->right = parent;  // Thread to inorder successor (parent)
        newNode->rthread = 1;
        parent->left = newNode;
    }
    // Insert as right child
    else
    {
        newNode->right = parent->right;  // Inherit parent's thread
        newNode->rthread = parent->rthread;
        parent->right = newNode;
        parent->rthread = 0;  // Parent's right is now a child, not thread
    }
    
    return root;
}

// Inorder traversal of right-threaded tree (NO RECURSION!)
void inorderRT(RT_NODE *root)
{
    if(root == NULL)
        return;
    
    RT_NODE *current = root;
    
    // Find leftmost node (first in inorder)
    while(current->left != NULL)
        current = current->left;
    
    // Traverse using threads
    while(current != NULL)
    {
        printf("%d ", current->info);
        
        // If rthread is 1, right pointer is thread to successor
        if(current->rthread == 1)
            current = current->right;
        else
        {
            // If right child exists, find leftmost in right subtree
            current = current->right;
            while(current != NULL && current->left != NULL)
                current = current->left;
        }
    }
}

// ============================================================================
// 2. LEFT-THREADED BINARY TREE
// ============================================================================

/*
 * LEFT-THREADED TREE:
 * If left pointer is NULL, it points to inorder predecessor instead
 * 
 * Left threads:
 * 10 → 5 (predecessor)
 * 20 → 15 (predecessor)
 * 30 → 25 (predecessor)
 * 5 → NULL (leftmost node)
 */

typedef struct lt_node
{
    int info;                    // Data value
    struct lt_node *left;        // Pointer to left child OR inorder predecessor
    struct lt_node *right;       // Pointer to right child
    int lthread;                 // 1 if left is thread, 0 if left is child
} LT_NODE;

// Create a new left-threaded node
LT_NODE* createLTNode(int data)
{
    LT_NODE *newNode = (LT_NODE*)malloc(sizeof(LT_NODE));
    newNode->info = data;
    newNode->left = NULL;   // Initially NULL (will be threaded)
    newNode->right = NULL;
    newNode->lthread = 1;   // Initially a thread (points to predecessor)
    return newNode;
}

// Insert into left-threaded BST
LT_NODE* insertLTNode(LT_NODE *root, int data)
{
    if(root == NULL)
    {
        return createLTNode(data);
    }
    
    LT_NODE *parent = NULL;
    LT_NODE *current = root;
    
    // Find insertion position
    while(current != NULL)
    {
        parent = current;
        
        if(data < current->info)
        {
            // If lthread is 0, left is a child; otherwise it's a thread
            if(current->lthread == 0)
                current = current->left;
            else
                break;  // Insert as left child
        }
        else if(data > current->info)
        {
            // Go right if right child exists
            if(current->right != NULL)
                current = current->right;
            else
                break;  // Insert as right child
        }
        else
        {
            printf("Duplicate value %d not inserted\n", data);
            return root;
        }
    }
    
    // Create new node
    LT_NODE *newNode = createLTNode(data);
    
    // Insert as left child
    if(data < parent->info)
    {
        newNode->left = parent->left;  // Inherit parent's thread
        newNode->lthread = parent->lthread;
        parent->left = newNode;
        parent->lthread = 0;  // Parent's left is now a child, not thread
    }
    // Insert as right child
    else
    {
        newNode->left = parent;  // Thread to inorder predecessor (parent)
        newNode->lthread = 1;
        parent->right = newNode;
    }
    
    return root;
}

// Reverse inorder traversal of left-threaded tree (NO RECURSION!)
void reverseInorderLT(LT_NODE *root)
{
    if(root == NULL)
        return;
    
    LT_NODE *current = root;
    
    // Find rightmost node (first in reverse inorder)
    while(current->right != NULL)
        current = current->right;
    
    // Traverse using threads
    while(current != NULL)
    {
        printf("%d ", current->info);
        
        // If lthread is 1, left pointer is thread to predecessor
        if(current->lthread == 1)
            current = current->left;
        else
        {
            // If left child exists, find rightmost in left subtree
            current = current->left;
            while(current != NULL && current->right != NULL)
                current = current->right;
        }
    }
}

// ============================================================================
// 3. FULLY-THREADED (IN-THREADED) BINARY TREE
// ============================================================================

/*
 * FULLY-THREADED TREE:
 * Both left and right NULL pointers are threaded
 * - Left NULL → inorder predecessor
 * - Right NULL → inorder successor
 * 
 * This combines benefits of both left and right threading:
 * - Can traverse forward (inorder) efficiently
 * - Can traverse backward (reverse inorder) efficiently
 * - No recursion or stack needed for traversal
 */

typedef struct ft_node
{
    int info;                    // Data value
    struct ft_node *left;        // Pointer to left child OR predecessor
    struct ft_node *right;       // Pointer to right child OR successor
    int lthread;                 // 1 if left is thread, 0 if child
    int rthread;                 // 1 if right is thread, 0 if child
} FT_NODE;

// Create a new fully-threaded node
FT_NODE* createFTNode(int data)
{
    FT_NODE *newNode = (FT_NODE*)malloc(sizeof(FT_NODE));
    newNode->info = data;
    newNode->left = NULL;
    newNode->right = NULL;
    newNode->lthread = 1;   // Initially both are threads
    newNode->rthread = 1;
    return newNode;
}

// Insert into fully-threaded BST
FT_NODE* insertFTNode(FT_NODE *root, int data)
{
    if(root == NULL)
    {
        return createFTNode(data);
    }
    
    FT_NODE *parent = NULL;
    FT_NODE *current = root;
    
    // Find insertion position
    while(current != NULL)
    {
        parent = current;
        
        if(data < current->info)
        {
            if(current->lthread == 0)  // Has left child
                current = current->left;
            else
                break;  // Insert as left child
        }
        else if(data > current->info)
        {
            if(current->rthread == 0)  // Has right child
                current = current->right;
            else
                break;  // Insert as right child
        }
        else
        {
            printf("Duplicate value %d not inserted\n", data);
            return root;
        }
    }
    
    // Create new node
    FT_NODE *newNode = createFTNode(data);
    
    // Insert as left child
    if(data < parent->info)
    {
        newNode->left = parent->left;   // Inherit parent's predecessor thread
        newNode->lthread = parent->lthread;
        newNode->right = parent;        // Thread to successor (parent)
        newNode->rthread = 1;
        
        parent->left = newNode;
        parent->lthread = 0;  // Parent's left is now a child
    }
    // Insert as right child
    else
    {
        newNode->right = parent->right;  // Inherit parent's successor thread
        newNode->rthread = parent->rthread;
        newNode->left = parent;          // Thread to predecessor (parent)
        newNode->lthread = 1;
        
        parent->right = newNode;
        parent->rthread = 0;  // Parent's right is now a child
    }
    
    return root;
}

// Inorder traversal of fully-threaded tree (NO RECURSION!)
void inorderFT(FT_NODE *root)
{
    if(root == NULL)
        return;
    
    FT_NODE *current = root;
    
    // Find leftmost node
    while(current->lthread == 0)
        current = current->left;
    
    // Traverse using right threads
    while(current != NULL)
    {
        printf("%d ", current->info);
        
        // If rthread is 1, follow the thread
        if(current->rthread == 1)
            current = current->right;
        else
        {
            // Move to right child and find leftmost
            current = current->right;
            while(current != NULL && current->lthread == 0)
                current = current->left;
        }
    }
}

// Reverse inorder traversal of fully-threaded tree (NO RECURSION!)
void reverseInorderFT(FT_NODE *root)
{
    if(root == NULL)
        return;
    
    FT_NODE *current = root;
    
    // Find rightmost node
    while(current->rthread == 0)
        current = current->right;
    
    // Traverse using left threads
    while(current != NULL)
    {
        printf("%d ", current->info);
        
        // If lthread is 1, follow the thread
        if(current->lthread == 1)
            current = current->left;
        else
        {
            // Move to left child and find rightmost
            current = current->left;
            while(current != NULL && current->rthread == 0)
                current = current->right;
        }
    }
}

// ============================================================================
// MAIN FUNCTION - DEMONSTRATION
// ============================================================================

int main()
{
    printf("========================================\n");
    printf("THREADED BINARY TREES DEMONSTRATION\n");
    printf("========================================\n\n");
    
    // ========== RIGHT-THREADED TREE ==========
    printf("1. RIGHT-THREADED BINARY TREE\n");
    printf("   (Right NULL pointers → inorder successor)\n");
    printf("   ----------------------------------------\n");
    
    RT_NODE *rt_root = NULL;
    
    printf("   Inserting: 20, 10, 30, 5, 15, 25, 35\n");
    rt_root = insertRTNode(rt_root, 20);
    rt_root = insertRTNode(rt_root, 10);
    rt_root = insertRTNode(rt_root, 30);
    rt_root = insertRTNode(rt_root, 5);
    rt_root = insertRTNode(rt_root, 15);
    rt_root = insertRTNode(rt_root, 25);
    rt_root = insertRTNode(rt_root, 35);
    
    printf("\n   Inorder Traversal (no recursion!): ");
    inorderRT(rt_root);
    printf("\n");
    
    printf("\n   Threads: 5→10, 15→20, 25→30, 35→NULL\n");
    
    // ========== LEFT-THREADED TREE ==========
    printf("\n========================================\n");
    printf("2. LEFT-THREADED BINARY TREE\n");
    printf("   (Left NULL pointers → inorder predecessor)\n");
    printf("   -------------------------------------------\n");
    
    LT_NODE *lt_root = NULL;
    
    printf("   Inserting: 20, 10, 30, 5, 15, 25, 35\n");
    lt_root = insertLTNode(lt_root, 20);
    lt_root = insertLTNode(lt_root, 10);
    lt_root = insertLTNode(lt_root, 30);
    lt_root = insertLTNode(lt_root, 5);
    lt_root = insertLTNode(lt_root, 15);
    lt_root = insertLTNode(lt_root, 25);
    lt_root = insertLTNode(lt_root, 35);
    
    printf("\n   Reverse Inorder Traversal (no recursion!): ");
    reverseInorderLT(lt_root);
    printf("\n");
    
    printf("\n   Threads: 10→5, 20→15, 30→25, 5→NULL\n");
    
    // ========== FULLY-THREADED TREE ==========
    printf("\n========================================\n");
    printf("3. FULLY-THREADED (IN-THREADED) TREE\n");
    printf("   (Both left and right pointers threaded)\n");
    printf("   ---------------------------------------\n");
    
    FT_NODE *ft_root = NULL;
    
    printf("   Inserting: 20, 10, 30, 5, 15, 25, 35\n");
    ft_root = insertFTNode(ft_root, 20);
    ft_root = insertFTNode(ft_root, 10);
    ft_root = insertFTNode(ft_root, 30);
    ft_root = insertFTNode(ft_root, 5);
    ft_root = insertFTNode(ft_root, 15);
    ft_root = insertFTNode(ft_root, 25);
    ft_root = insertFTNode(ft_root, 35);
    
    printf("\n   Inorder Traversal (forward): ");
    inorderFT(ft_root);
    printf("\n");
    
    printf("   Reverse Inorder Traversal (backward): ");
    reverseInorderFT(ft_root);
    printf("\n");
    
    printf("\n   Left Threads:  10→5, 20→15, 30→25, 5→NULL\n");
    printf("   Right Threads: 5→10, 15→20, 25→30, 35→NULL\n");
    
    // ========== COMPARISON ==========
    printf("\n========================================\n");
    printf("COMPARISON & KEY POINTS\n");
    printf("========================================\n");
    printf("Right-Threaded:  Forward traversal efficient\n");
    printf("Left-Threaded:   Backward traversal efficient\n");
    printf("Fully-Threaded:  Both directions efficient\n\n");
    printf("Advantages:\n");
    printf("  • No recursion needed for traversal\n");
    printf("  • No stack overhead\n");
    printf("  • Faster successor/predecessor access\n");
    printf("  • Better space utilization (no NULL waste)\n\n");
    printf("Disadvantages:\n");
    printf("  • More complex insertion/deletion logic\n");
    printf("  • Need extra bit(s) to distinguish thread vs child\n");
    printf("========================================\n");
    
    return 0;
}

/*
 * COMPLEXITY ANALYSIS:
 * ====================
 * Insertion:  O(h) where h is height (same as regular BST)
 * Traversal:  O(n) but NO stack/recursion overhead
 * Space:      O(1) for traversal (vs O(h) for recursive)
 * 
 * PRACTICAL APPLICATIONS:
 * =======================
 * 1. Database indexing (fast forward/backward navigation)
 * 2. Expression tree evaluation
 * 3. Memory-constrained systems (no recursion stack)
 * 4. Real-time systems (predictable traversal time)
 */