[33mcommit 43018f9fc6916e1ddbdc6d7a49f614e260229268[m[33m ([m[1;36mHEAD -> [m[1;32mmaster[m[33m)[m
Author: Eric Wang <asd617140123@gmail.com>
Date:   Fri Aug 31 13:41:29 2018 +0800

    'addtwosum.c'

[1mdiff --git a/twosum.c b/twosum.c[m
[1mnew file mode 100644[m
[1mindex 0000000..605fd88[m
[1m--- /dev/null[m
[1m+++ b/twosum.c[m
[36m@@ -0,0 +1,67 @@[m
[32m+[m[32m#include<stdio.h>[m
[32m+[m[32m#include<stdlib.h>[m
[32m+[m[32m#define HASH_SIZE 1000[m
[32m+[m[32mstruct node{[m
[32m+[m	[32mint value;[m
[32m+[m	[32mint key;[m
[32m+[m	[32mstruct node* next;[m
[32m+[m[32m};[m
[32m+[m[32mstruct node* data[HASH_SIZE];[m
[32m+[m
[32m+[m[32mint contains(int key){[m
[32m+[m	[32mint hash = abs(key)%HASH_SIZE;[m
[32m+[m	[32mstruct node* p = data[hash];[m
[32m+[m	[32mwhile(p!=NULL){[m
[32m+[m		[32mif(p->key==key)return 1;[m
[32m+[m		[32mp=p->next;[m
[32m+[m	[32m}[m
[32m+[m	[32mreturn 0;[m
[32m+[m[32m}[m
[32m+[m[32mvoid put(int key,int value){[m
[32m+[m	[32mint hash = abs(key)%HASH_SIZE;[m
[32m+[m	[32mstruct node* p = data[hash];[m
[32m+[m	[32mstruct node* s = (struct node*)malloc(sizeof(struct node));[m
[32m+[m	[32ms->key=key;[m
[32m+[m	[32ms->value=value;[m
[32m+[m	[32ms->next=NULL;[m
[32m+[m	[32mif(p==NULL){[m
[32m+[m		[32mdata[hash] = s;[m
[32m+[m		[32mreturn;[m
[32m+[m	[32m}[m
[32m+[m	[32mwhile(p->next!=NULL){[m
[32m+[m		[32mp=p->next;[m
[32m+[m	[32m}[m
[32m+[m	[32mp->next=s;[m
[32m+[m[32m}[m
[32m+[m[32mint get(int key){[m
[32m+[m	[32mint hash = abs(key)%HASH_SIZE;[m
[32m+[m	[32mstruct node* p = data[hash];[m
[32m+[m	[32mwhile(p!=NULL){[m
[32m+[m		[32mif(p->key==key)return (p->value -1);[m
[32m+[m		[32mp=p->next;[m
[32m+[m	[32m}[m
[32m+[m	[32mreturn 0;[m
[32m+[m[32m}[m
[32m+[m[32mint abs(int value){[m
[32m+[m	[32mreturn value>0?value:-value;[m
[32m+[m[32m}[m
[32m+[m[32mint* twoSum(int* nums, int numsSize, int target) {[m
[32m+[m	[32m int* res = (int*)malloc(sizeof(int)*2);[m
[32m+[m	[32m int value;[m
[32m+[m	[32m for(value=0;value<HASH_SIZE;value++){[m
[32m+[m	[32m     data[value]=NULL;[m
[32m+[m	[32m }[m
[32m+[m[32m     for(int i=0;i<numsSize;i++){[m
[32m+[m[32m         //key 拿到[m
[32m+[m		[32m if(contains(target-nums[i])){[m
[32m+[m		[32m //從key 把 value 取出[m[41m	 [m
[32m+[m[32m             value = get(target-nums[i]);[m
[32m+[m			[32m res[0]=value;[m
[32m+[m			[32m res[1]=i;[m
[32m+[m			[32m return res;[m
[32m+[m		[32m }[m
[32m+[m[32m         //把差值放進hash table[m
[32m+[m		[32m put(nums[i],i+1);[m
[32m+[m[32m     }[m
[32m+[m[32m    return res;[m
[32m+[m[32m}[m
\ No newline at end of file[m
