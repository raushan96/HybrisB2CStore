/**
 *
 */
package com.store.rau.facades.customer.impl;

import static de.hybris.platform.servicelayer.util.ServicesUtil.validateParameterNotNullStandardMessage;

import de.hybris.platform.commercefacades.customer.impl.DefaultCustomerFacade;
import de.hybris.platform.commercefacades.user.data.CustomerData;
import de.hybris.platform.commercefacades.user.data.RegisterData;
import de.hybris.platform.commerceservices.customer.DuplicateUidException;
import de.hybris.platform.core.model.user.CustomerModel;
import de.hybris.platform.core.model.user.TitleModel;
import de.hybris.platform.servicelayer.exceptions.UnknownIdentifierException;

import org.apache.commons.lang.StringUtils;
import org.springframework.util.Assert;

import com.store.rau.facades.customer.RaustoreCustomerFacade;


/**
 * @author raushankumar
 *
 */
public class RaustoreCustomerFacadeImpl extends DefaultCustomerFacade implements RaustoreCustomerFacade
{

	/*
	 * (non-Javadoc)
	 *
	 * @see
	 * de.hybris.platform.commercefacades.customer.CustomerFacade#register(de.hybris.platform.commercefacades.user.data.
	 * RegisterData)
	 */
	@Override
	public void register(final RegisterData registerData)
			throws DuplicateUidException, UnknownIdentifierException, IllegalArgumentException
	{

		validateParameterNotNullStandardMessage("registerData", registerData);
		Assert.hasText(registerData.getFirstName(), "The field [FirstName] cannot be empty");
		Assert.hasText(registerData.getLastName(), "The field [LastName] cannot be empty");
		Assert.hasText(registerData.getLogin(), "The field [Login] cannot be empty");

		final CustomerModel newCustomer = getModelService().create(CustomerModel.class);
		newCustomer.setName(getCustomerNameStrategy().getName(registerData.getFirstName(), registerData.getLastName()));

		if (StringUtils.isNotBlank(registerData.getFirstName()) && StringUtils.isNotBlank(registerData.getLastName()))
		{
			newCustomer.setName(getCustomerNameStrategy().getName(registerData.getFirstName(), registerData.getLastName()));
		}
		if (StringUtils.isNotBlank(registerData.getMobileNumber()))
		{
			//Need to set Mobile number here
			newCustomer.setMobileNumber(registerData.getMobileNumber());
		}
		final TitleModel title = getUserService().getTitleForCode(registerData.getTitleCode());
		newCustomer.setTitle(title);
		setUidForRegister(registerData, newCustomer);
		newCustomer.setSessionLanguage(getCommonI18NService().getCurrentLanguage());
		newCustomer.setSessionCurrency(getCommonI18NService().getCurrentCurrency());
		getCustomerAccountService().register(newCustomer, registerData.getPassword());
	}

	@Override
	public void updateProfile(final CustomerData customerData) throws DuplicateUidException
	{
		validateDataBeforeUpdate(customerData);

		final String name = getCustomerNameStrategy().getName(customerData.getFirstName(), customerData.getLastName());
		final CustomerModel customer = getCurrentSessionCustomer();
		customer.setOriginalUid(customerData.getDisplayUid());
		//Update Mobile Number
		customer.setMobileNumber(customerData.getMobileNumber());
		getCustomerAccountService().updateProfile(customer, customerData.getTitleCode(), name, customerData.getUid());
	}

	@Override
	protected void validateDataBeforeUpdate(final CustomerData customerData)
	{
		validateParameterNotNullStandardMessage("customerData", customerData);
		Assert.hasText(customerData.getTitleCode(), "The field [TitleCode] cannot be empty");
		Assert.hasText(customerData.getFirstName(), "The field [FirstName] cannot be empty");
		Assert.hasText(customerData.getLastName(), "The field [LastName] cannot be empty");
		Assert.hasText(customerData.getUid(), "The field [Uid] cannot be empty");
		Assert.hasText(customerData.getMobileNumber(), "The field [mobileNumber] cannot be empty");
	}
}
