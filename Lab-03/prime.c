#include <stdio.h>

int main() {

    int c = 0;
    int flag;
    for(int i=2; i<11; i++){
        flag = 1;
        for(int j=2; j<(i/2); j++){
            if((i%j) == 0){
                flag = 0;
            }
        }
        if(flag){
            c++;
        }
    }

    printf("%d",c);

    return 0;
}

j main

main:  # i = x18 # j = x19 # counter = x20 # flag = x21 # 1 = x25 # 11 = x22
    addi x18,x18,0x2 # int i=2;
    addi x25,x0,0x1  # int 1 = 1;
    addi x22,x22,50 # int 11 = 11
    addi x21,x21,0x1 # int flag = 1
    Counter:
    beq x21,x25,CounterAdd # c++
    OuterLoop:
    addi x18,x18,0x1 # i++
    addi x21,x0,0x1 # flag = 1;
    addi x19,x0,0x2 # j = 2
    div x31,x18,x19
    blt x18,x22,Outer # for(int i=2; i<11);
    j End # if outer loop condition false the end

# if Outer loop condition true

InnerLoop:
    addi x19,x19,0x1
    Outer:
    blt x19,x18,Condition # for(int j=2; j<i);
    j Counter

Condition:
    rem x24,x18,x19
    beq x24,x0,PrimeFalse
    j InnerLoop
        
PrimeFalse:
    addi x21,x0,0x0
    j OuterLoop
    
CounterAdd:
    addi x20,x20,0x1
    j OuterLoop
End: