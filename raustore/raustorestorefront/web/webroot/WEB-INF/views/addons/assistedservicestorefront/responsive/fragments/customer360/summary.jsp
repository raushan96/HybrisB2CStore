<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:url value="/my-account/order" var="orderUrl" />
<c:url value="/cart" var="cartUrl" />

<div class="row asm-customer360-tab asm-customer360-overview-tab-summary">
    <h3><spring:theme code="text.customer360.summary.heading" /></h3>
    <div class="col-sm-3">
        <div class="form-group">
            <label class="control-label"><spring:theme code="text.customer360.summary.signedUp" /></label>
            <p class="form-readonly-text form-readonly-text-lg"><fmt:formatDate value="${fragmentData.signedUp}" pattern="dd-MM-yyyy" /></p>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="form-group">
            <label class="control-label"><spring:theme code="text.customer360.summary.customer.since"/></label>
            <p class="form-readonly-text form-readonly-text-lg">${fragmentData.customerSince}&nbsp;<spring:theme code="text.customer360.summary.days.ago"/></p>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="form-group">
            <label class="control-label"><spring:theme code="text.customer360.summary.cartId" /></label>
            <p class="form-readonly-text form-readonly-text-lg"><a href="${cartUrl}">${fragmentData.cartId}</a></p>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="form-group">
            <label class="control-label"><spring:theme code="text.customer360.summary.recent.order" /></label>
            <p class="form-readonly-text form-readonly-text-lg">
            <c:choose>
                <c:when test="${(not empty fragmentData.recentOrder)}">
                    <a href="${orderUrl}/${fragmentData.recentOrder}">${fragmentData.recentOrder}</a>
                </c:when>
                <c:otherwise>
                    <spring:theme code="text.asm.customerList.phone.empty" />
                </c:otherwise>
            </c:choose>
            </p>
        </div>
    </div>
</div>
