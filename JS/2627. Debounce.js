/**
 * @param {Function} fn
 * @param {number} t milliseconds
 * @return {Function}
 */
var debounce = function(fn, t) {
    let timeoutId;                // holds the current timer

    return function(...args) {
        // clear any pending execution
        if (timeoutId) clearTimeout(timeoutId);

        // schedule new execution
        timeoutId = setTimeout(() => {
            fn.apply(this, args);
        }, t);
    };
};

/**
 * const log = debounce(console.log, 100);
 * log('Hello'); // cancelled
 * log('Hello'); // cancelled
 * log('Hello'); // Logged at t=100ms
 */