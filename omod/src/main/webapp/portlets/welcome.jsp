<%@ include file="/WEB-INF/view/module/legacyui/template/include.jsp" %>
<openmrs:globalProperty var="applicationName" key="application.name" defaultValue="OpenMRS"/>
<c:choose>
	<c:when test="${model.authenticatedUser != null}">
		<c:choose>
			<c:when test="${model.showName != 'false'}">
				<openmrs:message code="welcomeUser" htmlEscape="false" arguments="${model.authenticatedUser.personName.givenName},${applicationName}" />
			</c:when>
			<c:otherwise>
				<openmrs:message htmlEscape="false" code="welcome" arguments="${applicationName}" />
			</c:otherwise>
		</c:choose>
		<c:if test="${model.customText != ''}">
			${model.customText}
		</c:if>
	</c:when>
	<c:otherwise>
		<openmrs:message htmlEscape="false" code="welcome" arguments="${applicationName}" /> <br/><br/>
		<div style="padding-left: 25%; padding-right: 25%;">
			<div style="border: 1px; background-color: #FFA500;">
				<span style="font-size: 13px; color: white;  font-weight: bold; line-height: 20px;">
					<openmrs:message code="legacyui.sesp.confidentiality.alert.message"/>
				</span>
			</div>
		</div>
		<c:if test="${model.showLogin == 'true'}">
			<openmrs:portlet url="login" parameters="redirect=${model.redirect}" />
		</c:if>
	</c:otherwise>
</c:choose>