active proctype PaymentService() {
    bool authorized = false;

    if
    :: pay?EXECUTE ->
        report_result(pay, authorized);
        await_shutdown(pay, authorized)
    :: pay?TERMINATE
    fi;

    pay!ACK;
}
