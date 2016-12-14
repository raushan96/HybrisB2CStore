/*
 * [y] hybris Platform
 *
 * Copyright (c) 2000-2016 SAP SE or an SAP affiliate company.
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of SAP
 * ("Confidential Information"). You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the
 * license agreement you entered into with SAP.
 */
package com.store.rau.fulfilmentprocess.jalo;

import de.hybris.platform.jalo.JaloSession;
import de.hybris.platform.jalo.extension.ExtensionManager;
import com.store.rau.fulfilmentprocess.constants.RaustoreFulfilmentProcessConstants;

@SuppressWarnings("PMD")
public class RaustoreFulfilmentProcessManager extends GeneratedRaustoreFulfilmentProcessManager
{
	public static final RaustoreFulfilmentProcessManager getInstance()
	{
		ExtensionManager em = JaloSession.getCurrentSession().getExtensionManager();
		return (RaustoreFulfilmentProcessManager) em.getExtension(RaustoreFulfilmentProcessConstants.EXTENSIONNAME);
	}
	
}
