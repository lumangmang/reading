/**
 * reading.
 * Create by Devin on 2021/1/5.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

const url = (url) => {
    if (url.indexOf('?') === -1) {
        return `${url}?showapi_appid=85481&showapi_sign=8c715c0272e241bbbb54280a522334b2`;
    }
    return `${url}&showapi_appid=85481&showapi_sign=8c715c0272e241bbbb54280a522334b2`;
};

export default url;
