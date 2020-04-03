package com.yangml.utils;

/**
 * @author yxc
 * @version 1.0
 **/
public class JsonResult<T> {

    private String msg;
    private T result;
    private String errorCode;
    private String total;
    private String url;

    {
        msg = "OK";
        errorCode = "0";
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getResult() {
        return result;
    }

    public void setResult(T result) {
        this.result = result;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public JsonResult(String msg, T result, String errorCode) {
        super();
        this.msg = msg;
        this.result = result;
        this.errorCode = errorCode;
    }

    public JsonResult() {
        super();
    }
}

