/**
 * reading.
 * Create by Devin on 2021/1/4.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import types from "../../actions/types";

const defaultState = {
    isLoading: false,
    error: '',
    projectModels: [],
}

export default (state = defaultState, action) => {
    switch (action.type) {
        case types.REQUEST_ARTICLE_LIST:
            return {
                ...state,
                isLoading: true,
            }
        case types.REQUEST_ARTICLE_LIST_SUCCESS:
            return {
                ...state,
                isLoading: false,
                projectModels: action.projectModels,
                typeId: action.typeId,
            }
        case types.REQUEST_ARTICLE_LIST_FAILED:
            return {
                ...state,
                isLoading: false,
                error: action.error
            }
        default:
            return state;
    }
}
