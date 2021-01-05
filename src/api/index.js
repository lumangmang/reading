/**
 * reading.
 * Create by Devin on 2021/1/5.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import urls from "./urls";

const request = (url, method, body) => {
    let isOk;
    return new Promise((resolve, reject) => {
        fetch(urls(url), {
            method,
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body,
        }).then(response => {
            if (response.ok) {
                isOk = true;
            } else {
                isOk = false;
            }
            return response.json();
        }).then(json => {
            if (isOk) {
                resolve(json);
            } else {
                reject(json);
            }
        }).catch(error => {
            reject(error);
        })
    })
}

export default request;
