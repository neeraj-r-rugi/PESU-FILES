#include <stdio.h>
#include <stdlib.h>


typedef struct linked_list//Structure name
{
    int data;
    struct linked_list * next_node;
}linked_list;//Typedef

void print_list(linked_list * first_node){
    if(first_node == NULL){
        printf("The list is empty\n");
        return;
    }
    linked_list * temp = first_node;
    do{
        printf("The Node: %p with value: %d\n", temp, temp->data);
        temp = temp->next_node;
    }while (temp != NULL);
    return;
    
}

void delete_from_backend(linked_list ** first_node){
    //Check if linked list is empty(No Node at all)
    if(*first_node == NULL){
        printf("Nothing to delete\n");
        return;//Nothing else to do
    }

    //check if linked list has only element(that is there is only node/structure)
    if((*first_node)->next_node == NULL){
        //condn can also be written as (*(*first_node)).next_node == NULL
        free(*first_node);
        *first_node = NULL;//prevent dangling pointer
        return;//Nothing Else to dos
    }

    //For 2 or more nodes:
    linked_list * temp = *first_node;
    while(temp->next_node->next_node != NULL){
        //Loops until the second last node: (n-2)th node -> (n-1)th node -> nth node(last node)
        temp = temp->next_node;//Goes to the next node
    }

    free(temp->next_node);
    temp->next_node = NULL;//Prevent Dangling pointer
    return;

}


void insert_from_front(linked_list ** first_node, int value){
    linked_list * new_node =(linked_list *)malloc(sizeof(linked_list));
    new_node->data = value;
    new_node->next_node = *first_node;
    *first_node = new_node;

}

int main(){
    linked_list * list = NULL;
    delete_from_backend(&list);

    insert_from_front(&list, 10);
    insert_from_front(&list, 20);
    insert_from_front(&list, 30);

    print_list(list);

    delete_from_backend(&list);
    delete_from_backend(&list);
    delete_from_backend(&list);
}
