<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="id" required="true" type="java.lang.String" %>
<%@ attribute name="title" required="false" type="java.lang.String" %>
<%@ attribute name="sectionId" required="true" type="java.lang.String" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:if test="${not empty title}">
<div class="row asm-customer360-tab generic">
	<h3><spring:message code="${title}" text="${title}"/></h3>
</div>
</c:if>
<div class="asm__fragment" id="${id}">
   <div class='loader'>Loading..</div>
</div>

<script>
	 loadCustomer360Fragment('${sectionId}','${id}','${id}','${aif_ajax_timeout}');
</script>
