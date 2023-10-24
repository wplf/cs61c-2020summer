#include <stddef.h>
#include <stdio.h>
#include "ll_cycle.h"

int ll_has_cycle(node *head) {
    /* your code here */
    node *slow = head;
    node *fast = head;

    while (fast != NULL && fast->next != NULL) {
        slow = slow->next;
        fast = fast->next->next;

        // 如果快慢指针相遇，表示链表中存在环
        if (slow == fast) {
            return 1;
        }
    }

    return 0;
}