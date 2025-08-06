#include<stdio.h>
#include<stdlib.h>

#define NODES_TO_ALLOCATE(x) x
#define NODE_BEGIN_INDEX 1

struct NODE{
    int data;
    struct NODE * link;
};
typedef struct NODE node;


node * allocate(int n){
    node * item = (node *)malloc(n * sizeof(node));
    if(!item){
        printf("Malloc Failed!\n");
        exit(NODES_TO_ALLOCATE(1));
    }
    return item;
}

void display_list(node ** head){
    if(!*head){
        printf("The List is empty and uninitialised.\n");
        return;
    }
    node * curr = *head;
    int x = 0;
    while(curr){
        printf("The data of Node: %d is %d.\n", ++x, curr->data);
        curr = curr->link;
    }
    printf("The length of the list is: %d.\n", x);
}

void insert_from_front(node ** head, int item){
    if(!*head){
        *head = allocate(NODES_TO_ALLOCATE(1));
        (*head)->data = item;
        (*head)->link = NULL;
        return;
    }
    node * temp = NULL;
    temp = allocate(NODES_TO_ALLOCATE(1));
    temp->data= item;
    temp->link = *head;
    *head = temp;
    return;
}
void insert_at_back(node ** head, int item){
    if(!*head){
        *head = allocate(NODES_TO_ALLOCATE(1));
        (*head)->data = item;
        (*head)->link = NULL;
        return;
    }
    node * curr = *head;
    while(curr->link){
        curr = curr->link;
    }
    node * temp = allocate(NODES_TO_ALLOCATE(1));
    temp->data = item;
    temp->link = NULL;
    curr->link = temp;
    return;
}
void insert_at_pos(node ** head, int item, int pos){
    if(pos < NODE_BEGIN_INDEX){
        printf("Invalid Index number. Postion too small to insert.\n");
        exit(1);
    }else if(pos == NODE_BEGIN_INDEX || !*head){
        if(!*head){
            *head = allocate(NODES_TO_ALLOCATE(1));
            (*head)->data = item;
            (*head)->link = NULL;
            return;
        }
        node * temp = NULL;
        temp = allocate(NODES_TO_ALLOCATE(1));
        temp->data= item;
        temp->link = *head;
        *head = temp;
        return;
    }else{
        int count = NODE_BEGIN_INDEX;
        node * curr;
        node * prev;
        curr = *head;
        while(curr->link && count < pos){
            prev = curr;
            curr = curr->link;
            count++;
        }
        if((pos - count) != 0){
            printf("The Entered Index is not present in the list.\n");
            exit(1);
        }
        node * temp = allocate(NODES_TO_ALLOCATE(1));
        temp->data = item;
        temp->link = curr;
        prev->link = temp;
        return;
    }
}

void delete_list(node ** head){
    node * curr = *head;
    node * prev;
    while(curr){
        prev = curr;
        curr = curr->link;
        free(prev);
    }
    *head = NULL;
}

void delete_from_front(node ** head){
    if(!*head){
        printf("The List Is Empty. Nothing to delte from the front.\n");
        return;
    }
    node * next = (*head)->link;
    free(*head);
    *head = next;
    return;
}
void delete_from_back(node ** head){
    if(!*head){
        printf("List is empty, nothing to delte from back.\n");
        return;
    }else if(!(*head)->link){
        free(*head);
        *head = NULL;
    }
    node * curr = *head;
    node * prev;
    while(curr->link){
        prev = curr;
        curr = curr->link;
    }
    free(curr);
    curr = NULL;
    prev->link = NULL;
    return;
}

void delete_from_pos(node ** head, int pos){
    if(pos < NODE_BEGIN_INDEX){
        printf("Invalid Index number. Postion too small to delete.\n");
        exit(1);
    }else if(pos == NODE_BEGIN_INDEX || !*head){
        if(!*head){
            printf("List is empty, Nothing delete from the list.\n");
            return;
        }
        node * next = (*head)->link;
        free(*head);
        *head = next;
        return;
    }
    int count = NODE_BEGIN_INDEX;
    node * curr = *head;
    node * prev;
    while(curr->link && count < pos){
        prev = curr;
        curr = curr->link;
        count++;
    }
    
    if((pos - count) != 0){
        printf("The Entered Index is not present in the list to delete.\n");
        exit(1);
    }
    prev->link = curr->link;
    free(curr);
    curr = NULL;
    return;
}

void find_in_list(node ** head, int needle){
    int found = 0;
    int * found_index = NULL;
    int len = 0;
    if(!*head){
        printf("No List to perform search operation in.\n");
    }
    node * curr = *head;
    int count = 1;
    while(curr->link){
        if(needle == curr->data){
            found = 1;
            len++;
            int * temp = (int *)realloc(found_index, len);
            if(!temp){
                printf("Realloc Error: Not enough memory\n");
                exit(1);
            }
            found_index = temp;
            found_index[len-1] = count;
        }
        curr = curr->link;
        count++;
    }
    if(found){
        printf("The Value: %d is found in Index: \n", needle);
        for(int i = 0; i < len; i++){
            printf("Index: `%d`\n", found_index[i]);
        }
    }else{
        printf("Value: `%d` Not Found.\n", needle);
    }
}


int main(void){
    node * first = NULL;
    insert_from_front(&first, 20);
    insert_at_back(&first, 30);
    insert_from_front(&first, 40);
    insert_at_pos(&first, 50, 2);
    insert_at_pos(&first, 20, 4);
    printf("After Adding:\n");
    display_list(&first);
    find_in_list(&first, 20);
    printf("\n---------------------------------------------------------------------------\n\n");
    printf("After Deleting:\n");
    delete_from_pos(&first, 5);
    display_list(&first);
    return 0;
}

