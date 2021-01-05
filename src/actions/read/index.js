/**
 * reading.
 * Create by Devin on 2021/1/5.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import types from "../types";
import request from "../../api";

export function requestArticleList(typeId, page) {
    return (dispatch) => {
        dispatch({type: types.REQUEST_ARTICLE_LIST})
        request(`http://route.showapi.com/582-2?typeId=${typeId}&page=${page}`, 'get')
            .then(response => {
                const errorMessage = response.showapi_res_error;
                if (errorMessage && errorMessage !== '') {
                    dispatch({
                        type: types.REQUEST_ARTICLE_LIST_FAILED,
                        error: errorMessage,
                    })
                } else {
                    dispatch({
                        type: types.REQUEST_ARTICLE_LIST_SUCCESS,
                        projectModels: response.showapi_res_body.pagebean.contentlist,
                        typeId,
                    })
                }
            }).catch(error => {
            dispatch({
                type: types.REQUEST_ARTICLE_LIST_FAILED,
                error: error.message,
            })
        })
    }
}
