inline report_result(link, completed) {
    if
    :: link!SUCCESS -> completed = true
    :: link!FAILURE -> completed = false
    fi
}

inline await_shutdown(link, completed) {
    if
    :: link?COMPENSATE ->
        completed = false;
        link!COMPENSATED;
        link?TERMINATE
    :: link?TERMINATE
    fi
}

inline compensate(link) {
    link!COMPENSATE;
    link?COMPENSATED
}
