#include<stdio.h>
#include<stdlib.h>

typedef struct queue{
	int val;
	struct queue* next;
}queue;

void enqueue(queue** head,int val){
	queue* tmp=(queue*)malloc(sizeof(queue));
	tmp->val=val;
	tmp->next=NULL;
	if(*head==NULL){
		*head=tmp;
		return;
	}
	queue* item=*head;
	while(item->next!=NULL){
		item=item->next;
	}
	item->next=tmp;
	return;
}

void print_queue(queue* head){
	printf("_____\n");
	while(head!=NULL){
		printf("%d\n",head->val);
		head=head->next;
	}
	printf("_____\n");
	return;
}

void free_queue(queue* head){
	while(head!=NULL){
		queue* tmp=head;
		head=head->next;
		free(tmp);
	}
}

void dequeue(queue** head){
	if(*head==NULL){
		return;
	}
	if( (*head)->next==NULL ){
		free(*head);
		*head=NULL;
		return;
	}
	queue* last=*head;
	queue* item= (*head)->next;
	while(item->next!=NULL){
		last=item;
		item=item->next;
	}
	free(item);
	last->next=NULL;
	return;
}
	
	
int main(){
	printf("program star...\n");

	queue* head=NULL;
	
	enqueue(&head,0);
	enqueue(&head,1);
	enqueue(&head,2);
	enqueue(&head,3);
	enqueue(&head,4);
	enqueue(&head,5);
	enqueue(&head,6);
	
	dequeue(&head);
	dequeue(&head);
	dequeue(&head);

	print_queue(head);
	
	free_queue(head);
	printf("\nprogram end.\n");
	return 0;
}
