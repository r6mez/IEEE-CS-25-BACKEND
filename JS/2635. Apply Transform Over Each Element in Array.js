/**
 * @param {number[]} arr
 * @param {Function} fn
 * @return {number[]}
 */
var map = function(arr, fn) {
    let newArr = arr;
    for(let i = 0; i < arr.length; i++){
        newArr[i] = fn(newArr[i], i);
    }
    return newArr
};