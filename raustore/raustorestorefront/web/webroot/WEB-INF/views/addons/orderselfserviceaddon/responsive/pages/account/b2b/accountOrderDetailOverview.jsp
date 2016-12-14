<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="b2b-order" tagdir="/WEB-INF/tags/addons/orderselfserviceaddon/responsive/order/b2b" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>

<div class="well-lg well well-tertiary">
    <ycommerce:testId code="orderDetail_overview_section">
        <b2b-order:accountOrderDetailsOverview order="${orderData}"/>
    </ycommerce:testId>
</div>
