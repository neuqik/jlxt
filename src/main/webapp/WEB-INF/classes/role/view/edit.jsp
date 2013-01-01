<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="utf-8"%>
<div class="page">
	<div class="pageContent">
        <form method="post" action="${BaseURL}${editPage.action}" class="pageForm required-validate" onsubmit="return validateCallback(this, ${openType}AjaxDone)">
        	<div class="pageFormContent" layoutH="58">
        		<input type="hidden" name="roleId" value="${editPage.pojo.roleId}" />
        		<input type="hidden" name="_method" value="put" />
        		<div class="unit">
                    <label for="role.name">角色名称</label>
                    <input class="required" name="role.name" type="text" minlength="2" maxlength="32" value="${editPage.pojo.name}" />
                </div>
                <div class="unit">
                    <label for="role.description">角色描述</label>
                    <input name="role.description" type="text"  maxlength="50" value="${editPage.pojo.description}" />
                </div>
            </div>
            <div class="formBar">
                <ul>
                    <li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
                    <li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
                </ul>
        	</div>
       </form>
	</div>
</div>