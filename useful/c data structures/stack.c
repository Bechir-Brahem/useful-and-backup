#include<stdio.h>
#include<stdlib.h>
typedef struct stack{
	int val;
	struct stack* next;
}stack;
void push_stack(stack** head,int val){
	stack* tmp=(stack*)malloc(sizeof(stack));
	tmp->val=val;
	tmp->next=*head;
	*head=tmp;
	return;
}

void print_stack(stack* head)
{
	while(head!=NULL){
	printf("%d\n",head->val);
	head=head->next;
	}
	return;
}

void pop_stack(stack** head){
	if(*head != NULL){
		stack* tmp=*head;
		*head=(*head)->next;
		free(tmp);
	}
	return;
}

void free_stack(stack* head){
	while(head!=NULL){
		stack* tmp=head;
		head=(head)->next;
		free(tmp);
	}
	return;
}
	


int main(){
	stack* head=NULL;
	push_stack(&head,0);
	push_stack(&head,1);
	push_stack(&head,2);
	push_stack(&head,3);
	push_stack(&head,4);
	push_stack(&head,5);

	pop_stack(&head);
	pop_stack(&head);
	pop_stack(&head);

	print_stack(head);

	free_stack(head);	

	return 0;
	
}
