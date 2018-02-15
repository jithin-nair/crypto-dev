package com.tychecash.tychexplore.model.response;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.builder.ToStringBuilder;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.tychecash.tychexplore.model.response.ErrorResponse;

import com.tychecash.tychexplore.util.JacksonConversionUtil;

@JsonInclude(Include.NON_NULL)
public class BaseResponse {

	@JsonProperty("status_cd")
	private int statusCode;

	@JsonProperty("data")
	private String base64EncodedData;

	@JsonIgnore
	private Object responseBody;

	@JsonProperty("shek")
	private String sharedEncryptedKey;

	@JsonProperty("hmac")
	private String hmac;

	@JsonProperty("error")
	private ErrorResponse error;

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	public int getStatusCode() {
		return this.statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public Object getResponseBody() {
		return this.responseBody;
	}

	public void setResponseBody(Object responseBody) {
		this.responseBody = responseBody;
		if (this.responseBody != null) {
			this.base64EncodedData = Base64.encodeBase64String(JacksonConversionUtil.writeValueAsBytes(responseBody));
		}
	}

	public String getSharedEncryptedKey() {
		return this.sharedEncryptedKey;
	}

	public void setSharedEncryptedKey(String sharedEncryptedKey) {
		this.sharedEncryptedKey = sharedEncryptedKey;
	}

	public String getHmac() {
		return this.hmac;
	}

	public void setHmac(String hmac) {
		this.hmac = hmac;
	}

	public ErrorResponse getError() {
		return this.error;
	}

	public void setError(ErrorResponse error) {
		this.error = error;
	}

	public String getBase64EncodedData() {
		return this.base64EncodedData;
	}

}
