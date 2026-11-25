active proctype TransactionCoordinator() {
    inv!EXECUTE;
    if
    :: inv?SUCCESS ->
        pay!EXECUTE;
        if
        :: pay?SUCCESS ->
            ship!EXECUTE;
            if
            :: ship?SUCCESS ->
                outcome = SUCCESS
            :: ship?FAILURE ->
                outcome = FAILURE;
                compensate(pay);
                compensate(inv)
            fi
        :: pay?FAILURE ->
            outcome = FAILURE;
            compensate(inv)
        fi
    :: inv?FAILURE ->
        outcome = FAILURE
    fi;

    inv!TERMINATE;
    pay!TERMINATE;
    ship!TERMINATE;

    inv?ACK;
    pay?ACK;
    ship?ACK;
}
