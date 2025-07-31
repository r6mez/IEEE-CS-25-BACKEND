/**
 * @param {Array} arr
 * @param {number} depth
 * @return {Array}
 */
var flat = function (arr, n) {
    const out = [];

    const concat = function (sub, currentDepth) {
        for (let i = 0; i < sub.length; i++) {
            if (Array.isArray(sub[i]) && currentDepth < n) {
                concat(sub[i], currentDepth + 1);
            }
            else { out.push(sub[i]); }
        }
    }
    
    concat(arr, 0);
    return out;
};