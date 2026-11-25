active proctype ShippingService() {
    bool prepared = false;

    if
    :: ship?EXECUTE ->
        report_result(ship, prepared);
        await_shutdown(ship, prepared)
    :: ship?TERMINATE
    fi;

    ship!ACK;
}
