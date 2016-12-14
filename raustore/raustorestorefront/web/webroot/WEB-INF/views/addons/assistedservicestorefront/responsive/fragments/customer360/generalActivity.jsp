<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:url value="my-account/saved-carts" var="savedCartUrl" />
<c:url value="cart" var="cartUrl" />
<c:url value="my-account/order" var="orderUrl" />
<c:url value="my-account/support-ticket" var="ticketUrl" />

<div role="tabpanel" class="tab-pane" id="activitySection">
    <div class="row pageable-fragment asm-customer360-tab">
        <div class="col-sm-12 asm-customer360-activity-tab">
            <h3><spring:theme code="text.customer360.activity.general" /></h3>
            <div class="pager"></div>
        </div>
        <div class="col-sm-12">
            <table id="asm-customer360-activity-table" class="table techne-table">
                <thead>
                    <tr class="responsive-table-head hidden-xs">
                        <th class="pointer"><spring:theme code="text.customer360.activity.general.type" /></th>
                        <th class="pointer"><spring:theme code="text.customer360.activity.general.id" /></th>
                        <th class="pointer"><spring:theme code="text.customer360.activity.general.description" /></th>
                        <th class="pointer"><spring:theme code="text.customer360.activity.general.status" /></th>
                        <th class="pointer"><spring:theme code="text.customer360.activity.general.created" /></th>
                        <th class="headerSortUp pointer"><spring:theme code="text.customer360.activity.general.updated" /></th>
                    </tr>
                </thead>
            <tbody>
                <c:forEach items="${fragmentData}" var="activityData">
                    <tr>
                        <td data-th="<spring:theme code="text.customer360.activity.general.type"/>"><spring:theme code="${activityData.type}" /></td>
                        <c:choose>
                            <c:when test="${fn:contains(activityData.type, 'order')}">
                               <spring:url value="${orderUrl}/${activityData.id}" var="link" htmlEscape="false"/>
                            </c:when>
                            <c:when test="${fn:contains(activityData.type, 'savedcart')}">
                                <spring:url value="${savedCartUrl}/${activityData.id}" var="link" htmlEscape="false"/>
                            </c:when>
                            <c:when test="${fn:contains(activityData.type, 'ticket')}">
                                <spring:url value="${ticketUrl}/${activityData.id}" var="link" htmlEscape="false"/>
                            </c:when>
                            <c:otherwise>
                                <spring:url value="${cartUrl}" var="link" htmlEscape="false"/>
                            </c:otherwise>
                        </c:choose>
                        <td data-th="<spring:theme code="text.customer360.activity.general.id"/>"><a href="${encodedContextPath}/${link}" class="responsive-table-link text-nowrap"><c:out value="${activityData.id}" /></a></td>
                        <td data-th="<spring:theme code="text.customer360.activity.general.description"/>" class="break-word"><spring:theme code="${activityData.description}" arguments="${activityData.descriptionArgs}"/></td>
                        <td data-th="<spring:theme code="text.customer360.activity.general.status" />" >
                            <c:choose>
                                <c:when test="${(not empty activityData.status)}">
                                    <spring:theme code="${activityData.status}" />
                                </c:when>
                                <c:otherwise>
                                    <spring:theme code="text.customer360.activity.general.status.undefined" />
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td data-th="<spring:theme code="text.customer360.activity.general.created" />" data-text="${activityData.created.time}" ><fmt:formatDate value="${activityData.created}" pattern="dd-MM-yy hh:mm a" /></td>
                        <td data-th="<spring:theme code="text.customer360.activity.general.updated" />" data-text="${activityData.updated.time}" ><fmt:formatDate value="${activityData.updated}" pattern="dd-MM-yy hh:mm a" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script>
        $("#asm-customer360-activity-table")
            .tablesorter({headers: { 0: { sorter: "text"}, 1: {sorter: "text"},  2: { sorter: "text"}, 3: {sorter: "text"}, 4: {sorter: "text"}, 5: {sorter: "text"} }, widthFixed: true})
            .tablesorterPager({container: $(".asm-customer360-activity-tab .pager")});
    </script>
    </div>
</div>
