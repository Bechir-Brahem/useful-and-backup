#include<stdio.h>
#include<stdlib.h>

typedef struct node{
	int val;
	struct node* left;
	struct node* right;
}node;

node* newNode(int val){
	node* tmp=(node*)malloc(sizeof(node));
	tmp->val=val;
	tmp->left=tmp->right=NULL;
	return tmp;
}

void print_tree(node* root){
	if(root==NULL){
		return;
	}
	printf("%d  ",root->val);
	print_tree(root->left);
	print_tree(root->right);
	return;
}

node* search_tree(node* root,int val){
	if(root==NULL || root->val==val){
		return root;
	}
	if(root->val>val){
		return search_tree(root->left,val);
	}
	return search_tree(root->right,val);
}


//from geekforgeeks
void print2DUtil(struct node *root, int space) 
{ 

    int COUNT=10;
    if (root == NULL) 
        return; 
  
    space += COUNT; 
    print2DUtil(root->right, space); 
    printf("\n"); 
    for (int i = COUNT; i < space; i++) 
        printf(" "); 
    printf("%d\n", root->val); 
    print2DUtil(root->left, space); 
}



int insert_tree(node* root,int val){
	if(root==NULL){
		return 0;
	}
	if(root->val<val){
		if(root->right==NULL){
			node* tmp=newNode(val);
			root->right=tmp;
			return 1;
		}
		insert_tree(root->right,val);
	}
	if(root->val>val){
		if(root->left==NULL){
			node* tmp=newNode(val);
			root->left=tmp;
			return 1;
		}
		insert_tree(root->left,val);
	}
	
}

void free_tree(node* root){
	if(root==NULL){
		return;
	}

	free_tree(root->right);
	free_tree(root->left);
	free(root);
}

node* parent_node(node* root,int val){
	//returns parent node if val does not exist
	//returns null if it exists
	//in other words returns where val should be inserted
	if(root==NULL || root->val==val){
		return NULL;
	}
	if(root->left==NULL && root->right==NULL){
		return root;
	}
	if(root->val>val){
		if(root->left==NULL){
			return root;
		}
		return parent_node(root->left,val);
	}
	if(root->val<val){
		if(root->right==NULL){
			return root;
		}
		return parent_node(root->right,val);
	}
}
	

void merge_tree(node* root,node* other){
	if(other==NULL){
		return;
	}
	insert_tree(root,other->val);

	merge_tree(root,other->right);
	merge_tree(root,other->left);
	free(other);
}

	

int main(){
	printf("start.....\n");


	node* root=newNode(20);
	insert_tree(root,10);
	insert_tree(root,-2);
	insert_tree(root,7);
	insert_tree(root,0);
	insert_tree(root,40);
	insert_tree(root,50);
	
	node* other=newNode(15);
	insert_tree(other,13);
	insert_tree(other,30);
	insert_tree(other,60);
	insert_tree(other,5);
	insert_tree(other,3);
	print2DUtil(root,3);
	printf("\n__________________\n");
	print2DUtil(other,3);


	merge_tree(root,other);
	
	printf("\n__________________\n");
	print2DUtil(root,3);



	printf("\n....end\n");

	free_tree(root);
	return 0;

}
	



