<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="asm" tagdir="/WEB-INF/tags/addons/assistedservicestorefront/asm"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>

<%-- JS configuration --%>
<script type="text/javascript">
    /*<![CDATA[*/
    var ASM_MESSAGES = {};
    ASM_MESSAGES.customerIdNotFound = '<spring:theme code="asm.emulate.customer.not.found" />';
    /*]]>*/
</script>
<div id="_asm">
    <script>
    	var body = document.getElementsByTagName("body")[0];
    	body.insertBefore(document.getElementById('_asm'), body.childNodes[0]);
    </script>
	<div class="ASM_header navigation navigation--top">
        <div class="container-fluid">
            <asm:redirect />
            <button class="ASM_close ASM_close_all closeBtn" aria-hidden="true" data-dismiss="alert" type="button">&times;</button>

            <c:if test="${not empty asm_message}">
                <div class="ASM_alert ${asm_alert_class}"><spring:theme code="${asm_message}" arguments="${asm_message_args}"/></div>
            </c:if>

			<cms:component uid="ASMHeaderComponent" />

			<%-- logo text --%>
            <asm:logo />
            <c:choose>
                <c:when test="${empty agent.uid}">
                	<cms:component uid="ASMLoginComponent"/>
			    </c:when>
                <c:otherwise>
                    <div id="_asmLogged" class="ASM_loggedin">
                        
                        <div class="ASM_timer">
                            <span id="sessionTimer" class="ASM_loggedin_text_name"><span class="hidden-xs hidden-sm hidden-md"><spring:theme code="asm.emulate.timer"/> </span><span class='ASM_timer_count' id="timerCount"><script>document.getElementById('timerCount').innerHTML=Math.floor(${agentTimer}/60)+":00";</script></span> <spring:theme code="asm.emulate.timer.min"/></span>
                            <button type="submit" id="resetButton" class="ASM-btn ASM-btn-reset" disabled><spring:theme code="asm.emulate.reset"/></button>
                            <script>var timer=${agentTimer};</script>
                        </div>

                        <div class="ASM_loggedin_text">
                            <span class="ASM_loggedin_agent_store_name">
                                <p>
                                    <span class="hidden-xs hidden-sm hidden-md"><spring:theme code="asm.login.logged"/> </span>
                                    <span class="ASM_loggedin_text_name">${agent.name}</span>
                                </p>
                                <c:if test="${not empty asm_agent_store}">
                                    <p>
                                        <span class="hidden-xs hidden-sm hidden-md"><spring:theme code="asm.emulate.at"/> </span>
                                        <span class="ASM_loggedin_text_name"><spring:theme code="${asm_agent_store}"/></span>
                                    </p>
                                </c:if>
                            </span>
                            <c:url value="/assisted-service/logoutasm" var="logoutActionUrl" />
                            <form action="${logoutActionUrl}" method="post" id="asmLogoutForm" class="asmForm">
                                <fieldset>
                                    <input type="hidden" name="CSRFToken" value="${CSRFToken}">
                                    <button type="submit" class="ASM-btn ASM-btn-logout" disabled><spring:theme code="asm.logout"/></button>
                                </fieldset>
                            </form>
                        </div>

                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <c:if test="${not empty agent.uid}">
        <div class="ASM_session navigation navigation--top">
            <div class="container-fluid" id="_asmCustomer">
                <cms:component uid="ASMCustomerListComponent"/>

                <c:choose>
                    <c:when test="${empty emulatedUser}">
                    	<cms:component uid="ASMEmulateUserComponent"/>    
                    </c:when>

                    <c:otherwise>
						<cms:component uid="ASMBindComponent" />
						
                        <span class="ASM_end_session">
                            <c:url value="/assisted-service/personify-stop" var="sessionEndActionUrl" />
                            <form action="${sessionEndActionUrl}" method="post" id="_asmSessionEndForm" class="asmForm">
                                <fieldset>
                                    <button type="submit" id="stopEmulate" class="ASM-btn ASM-btn-end-session" disabled>
                                        <spring:theme code="asm.emulate.end"/>
                                        <span class="hidden-xs hidden-sm hidden-md"><spring:theme code="asm.emulate.end.ending"/></span>
                                    </button>
                                </fieldset>
                            </form>
                        </span>
						<input type="hidden" id="enable360View" value="${enable360View}">
                        <button class="ASM-btn ASM-btn-customer360 js-customer360">
                            <spring:theme code="text.customer360.buttonLabelCustomer"/>
                            <span class="hidden-sm"><spring:theme code="text.customer360.buttonLabelView"/></span>
                            <span class="ASM-customer360_icon"></span>
                        </button>

                    </c:otherwise>
                </c:choose>
                <c:if test="${not createDisabled}">
                	<asm:createcustomerform/>
                </c:if>
            </div>
        </div>
    </c:if>
    
    <cms:component uid="ASMFooterComponent" />
    
    <div id="asmAutoComplete" class="asmAutoComplete"></div>
    <div id="asmAutoCompleteCartId" class="asmAutoComplete"></div>
</div>