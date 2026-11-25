mtype = { EXECUTE, SUCCESS, FAILURE, COMPENSATE, COMPENSATED, TERMINATE, ACK, PENDING };

chan inv = [0] of { mtype };
chan pay = [0] of { mtype };
chan ship = [0] of { mtype };

mtype outcome = PENDING;

#include "utilities.pml"
#include "transaction_coordinator.pml"
#include "inventory_service.pml"
#include "payment_service.pml"
#include "shipping_service.pml"
