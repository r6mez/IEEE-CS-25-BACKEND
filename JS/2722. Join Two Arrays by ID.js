/**
 * @param {Array} arr1
 * @param {Array} arr2
 * @return {Array}
 */
var join = function (arr1, arr2) {
    const result = {};
    for (let i = 0; i < arr1.length; i++) {
        result[arr1[i].id] = arr1[i];
    }
    for (let i = 0; i < arr2.length; i++) {
        if (arr2[i].id in result) {
            var val = arr2[i];
            for (const [key, value] of Object.entries(val)) {
                result[arr2[i].id][key] = value;
            }
        } else {
            result[arr2[i].id] = arr2[i];
        }
    }

    return Object.values(result);
};