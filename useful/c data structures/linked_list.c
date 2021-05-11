#include<stdio.h>
typedef struct Node{
	int val;
	struct Node* next;
}Node;

void print_list(Node* item)
{
	while(item!=NULL){
		printf("%d\n",item->val);
		item=item->next;
	}
	return;
}

void append_list(Node** head, int val){
	Node* tmp=(Node*)malloc(sizeof(Node));
	tmp->val=val;
	tmp->next=NULL;

	if(*head==NULL){
		*head=tmp;
		return;
	}	
	
	Node* item= *head;
	while(item->next!=NULL){
		item=item->next;
	}
	item->next=tmp;
	return;
}
	
void free_list(Node* head){
	while(head!=NULL){
		Node* tmp=head;
		head=head->next;
		free(tmp);
	}
	return;
}


void delete_list(Node** head,int val){
//deletes all nodes with the given val
	while(*head!=NULL && (*head)->val==val){
		Node* tmp=*head;
		*head=(*head)->next;
		free(tmp);
	}
	Node* last=*head;
	Node* tmp=NULL;
	Node* item=last->next;
	while(item!=NULL){
		if(item->val==val){
			tmp=item;
			item=item->next;
			last->next=item;
			free(tmp);
		}
		else{
			last=item;
			item=item->next;
		}
	}


	return;
}



int main(){
	Node* head=NULL;

	append_list(&head,0);
	append_list(&head,0);
	append_list(&head,2);
	append_list(&head,0);
	append_list(&head,9);
	append_list(&head,5);
	append_list(&head,0);
	append_list(&head,0);
	
	delete_list(&head,0);

	print_list(head);
	
	free_list(head);
	
	return 0;
}
 
