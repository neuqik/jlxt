package org.eweb4j.solidbase.code.web;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import org.eweb4j.solidbase.code.model.CodeException;
import org.eweb4j.util.JsonConverter;

@Path("${CodeConstant.MODEL_NAME}")
public class GetParentCodeAction extends CodeBaseAction {

	private String inputValue = "";

	@Path("/{codeTypeId}/parents.json")
	@GET
	@POST
	public String doGet() {
		try {
			return JsonConverter.convert(service.getParents(codeTypeId, inputValue));
		} catch (CodeException e) {
			return dwz.getFailedJson(e.getMessage()).toString();
		}
	}

	public void setInputValue(String inputValue) {
		this.inputValue = inputValue;
	}

}
