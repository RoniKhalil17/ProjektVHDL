void playSplit(int n, Node* head1, Node* head2) {
    Node* current = head1;

                int count = 0;
                while (current != NULL && count < n) { //første DLL
                    current = current->next;
                    count++;
                }

                if (current != NULL) { // Anden DLL
                    head2 = current;

                    if (current->prev != NULL) { // splitter fra liste 2
                        current->prev->next = NULL;
                    }

                    current->prev = NULL; // splitter fra liste 1

                    //mangler at ændre print funktionen, så vi kan printe 7 lister korrekt
                    Node* temp = head1;
                    int line = 0;

                    printf("c1\tc2\tc3\tc4\tc5\tc6\tc7\n\n");
                    for (int row = 0; row < 8; row++) {
                        for (int column = 0; column < 7; column++) {
                            if ((column < 3 && row < 8) || (column >= 3 && row < 7)) {
                                if (temp) {
                                    printf("%s\t", temp->value);
                                    temp = temp->next;
                                } else {
                                    printf("\t");
                                }
                            } else {
                                printf("\t");
                            }
                        }

                        line++;
                        if (line == 1) {
                            printf("[]\tF1");
                        }else if (line == 3) {
                            printf("[]\tF2");
                        }else if (line == 5) {
                            printf("[]\tF3");
                        }else if (line == 7) {
                            printf("[]\tF4");
                        }
                        printf("\n");
                    }
                    if (head1 != NULL) {
                        printf("LAST Command: P\n"
                            "Message:OK.\n"
                            "INPUT >");
                    } else if (head1==NULL) {
                        printf("LAST Command: P\n"
                           "Message: ERROR: No deck provided.\n"
                           "INPUT >");
                    }

                }
}

void P() {
    deckSplit(1);
    deckSplit(6);
    deckSplit(7);
    deckSplit(8);
    deckSplit(9);
    deckSplit(10);
    deckSplit(11);


    Node* temp = head;
    int line = 0;
    printf("c1\tc2\tc3\tc4\tc5\tc6\tc7\n\n");
    for (int row = 0; row < 8; row++) {
        for (int column = 0; column < 7; column++) {
            if ((column < 3 && row < 8) || (column >= 3 && row < 7)) {
                if (temp) {
                    printf("%s\t", temp->value);
                    temp = temp->next;
                } else {
                    printf("\t");
                }
            } else {
                printf("\t");
            }
        }
    }
}
