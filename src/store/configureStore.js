/**
 * reading.
 * Create by Devin on 2021/1/4.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

if (process.env.NODE_ENV === "production") {
    module.exports = require("./configureStore.prod");
} else {
    module.exports = require("./configureStore.dev");
}
