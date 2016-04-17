<%@page import="com.liferay.portal.service.CountryServiceUtil"%>
<%@page import="com.liferay.portal.model.Country"%>
<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@include file="/jsp/init.jsp" %>

<%

	String redirect = ParamUtil.getString(request, "redirect");
	
	long countryId = ParamUtil.getLong(request, "countryId");
	
	Country country = null;
	
	if (countryId > 0) {
		country = CountryServiceUtil.getCountry(countryId);
	}

%>
<liferay-ui:header
	backURL='<%= redirect %>'
	title='<%= (country != null) ? country.getName(locale) : "new-country" %>'
/>

<aui:model-context bean="<%= country %>" model="<%= Country.class %>" />

<portlet:actionURL name='<%= (country != null) ? "updateCountry" : "addCountry" %>' var="updateCountryURL" />

<liferay-ui:error key="country-errors" message="type-errors" />

<aui:form action="${updateCountryURL}" method="POST" name="fm">
	<aui:fieldset>
		<aui:input type="hidden" name="redirect" value="<%= redirect %>" />

		<aui:input type="hidden" name="countryId"/>

		<aui:input name="name" >
			<aui:validator name="required"/>
		</aui:input>
		<aui:input name="a2" >
			<aui:validator name="required"/>
		</aui:input>
		<aui:input name="a3" >
			<aui:validator name="required"/>
		</aui:input>
		<aui:input name="number" >
			<aui:validator name="required"/>
		</aui:input>
		<aui:input name="idd" >
			<aui:validator name="required"/>
		</aui:input>
		<aui:input name="zipRequired" >
			<aui:validator name="required"/>
		</aui:input>
		<aui:input name="active" >
			<aui:validator name="required"/>
		</aui:input>
	</aui:fieldset>
	
	<aui:button-row>
		<aui:button type="submit" />

		<aui:button type="cancel"  onClick="<%= redirect %>" />
	</aui:button-row>
</aui:form>