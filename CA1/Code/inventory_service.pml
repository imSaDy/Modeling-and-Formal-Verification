active proctype InventoryService() {
    bool reserved = false;

    inv?EXECUTE;
    report_result(inv, reserved);
    await_shutdown(inv, reserved);
    inv!ACK;
}
