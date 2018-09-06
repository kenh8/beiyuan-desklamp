/**
 * 验证是否为数字
 * @param value
 * @returns {boolean}
 */
function isNumber(value) {
    var patrn = /^(-)?\d+(\.\d+)?$/;
    if (patrn.exec(value) == null || value == "") {
        return false
    } else {
        return true
    }
}