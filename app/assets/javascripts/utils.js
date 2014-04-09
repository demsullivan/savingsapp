function number_to_currency(number, currency) {
    if (currency === undefined) currency = "$";
    if (typeof number == "string") number = new Number(number);
    return currency + number.toFixed(2).toString();
}