/**
 *
 */
package com.store.rau.facades.populators;

import de.hybris.platform.commercefacades.user.data.CustomerData;
import de.hybris.platform.converters.Populator;
import de.hybris.platform.core.model.user.CustomerModel;
import de.hybris.platform.servicelayer.dto.converter.ConversionException;

import org.apache.commons.lang.StringUtils;
import org.springframework.util.Assert;


/**
 * @author raushankumar
 *
 */
public class RaustoreCustomerPopulator implements Populator<CustomerModel, CustomerData>
{

	/*
	 * (non-Javadoc)
	 *
	 * @see de.hybris.platform.converters.Populator#populate(java.lang.Object, java.lang.Object)
	 */
	@Override
	public void populate(final CustomerModel source, final CustomerData target) throws ConversionException
	{

		Assert.notNull(source, "Parameter source cannot be null.");
		Assert.notNull(target, "Parameter target cannot be null.");
		String mobileNumber = source.getMobileNumber();

		if (StringUtils.isBlank(mobileNumber))
		{
			mobileNumber = "";
		}
		target.setMobileNumber(mobileNumber);
	}

}
