var TimeLimitedCache = function() {
    // Map from key -> { value: number, timeoutId: Timeout }
    this.cache = new Map();
};

/** 
 * @param {number} key
 * @param {number} value
 * @param {number} duration time until expiration in ms
 * @return {boolean} true if an un-expired key already existed (and was overwritten), false otherwise
 */
TimeLimitedCache.prototype.set = function(key, value, duration) {
    const entry = this.cache.get(key);
    const existed = entry !== undefined;

    // If already present and un-expired, clear its pending deletion
    if (existed) {
        clearTimeout(entry.timeoutId);
    }

    // Schedule removal after `duration` milliseconds
    const timeoutId = setTimeout(() => {
        this.cache.delete(key);
    }, duration);

    // Store/overwrite the entry
    this.cache.set(key, { value, timeoutId });

    return existed;
};

/** 
 * @param {number} key
 * @return {number} the value if un-expired, or -1 if missing/expired
 */
TimeLimitedCache.prototype.get = function(key) {
    const entry = this.cache.get(key);
    return entry ? entry.value : -1;
};

/** 
 * @return {number} count of non-expired keys
 */
TimeLimitedCache.prototype.count = function() {
    return this.cache.size;
};
