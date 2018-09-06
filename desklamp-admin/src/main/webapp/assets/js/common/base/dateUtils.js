/**
 * 格式化日期
 * @param javaDate
 * @param showHHMMss 是否显示时分秒
 * @returns {*}
 */
function getNewDate(javaDate,showHHMMss) {
    if (javaDate == null || javaDate == "") {
        return "0000-00-00 00:00:00";
    }
    var date = new Date(javaDate);
    // var date = new Date(value * 1000);
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    var h = date.getHours();
    var minute = date.getMinutes();
    var second = date.getSeconds();

    var d1 = y + '-' + (m < 10 ? '0' + m : m) + '-' + (d < 10 ? '0' + d : d);
    var d2 = (h < 10 ? '0' + h : h) + ':'
        + (minute < 10 ? '0' + minute : minute) + ':'
        + (second < 10 ? '0' + second : second);
    if(showHHMMss ==1){
        return d1 + " " + d2;
    }else{
        return d1;
    }
}



/**
 * 获取当前时间
 * @returns {string}
 */
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
        + " " + date.getHours() + seperator2 + date.getMinutes()
        + seperator2 + date.getSeconds();
    return currentdate;
}

/**
 * 获取当前时间（由于冒号不能作为文件名中的字符，所以改成了下划线）
 * @returns {string}
 */
function getNowDateForExport() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = "_";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
        + "_" + date.getHours() + seperator2 + date.getMinutes()
        + seperator2 + date.getSeconds();
    return currentdate;
}
