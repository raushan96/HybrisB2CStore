<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="order" tagdir="/WEB-INF/tags/addons/orderselfserviceaddon/responsive/order" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>


<ycommerce:testId code="cancelOrder_section">
    <order:accountCancelOrder order="${orderData}"/>
</ycommerce:testId>


