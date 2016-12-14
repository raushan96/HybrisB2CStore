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
package com.store.rau.storefront.forms.validation;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.store.rau.storefront.forms.UpdateProfileForm;


/**
 * Validator for profile forms.
 */
@Component("raustoreProfileValidator")
public class ProfileValidator implements Validator
{

	@Override
	public boolean supports(final Class<?> aClass)
	{
		return UpdateProfileForm.class.equals(aClass);
	}

	@Override
	public void validate(final Object object, final Errors errors)
	{
		final UpdateProfileForm profileForm = (UpdateProfileForm) object;
		final String title = profileForm.getTitleCode();
		final String firstName = profileForm.getFirstName();
		final String lastName = profileForm.getLastName();
		final String mobileNumber = profileForm.getMobileNumber();

		if (StringUtils.isEmpty(title))
		{
			errors.rejectValue("titleCode", "profile.title.invalid");
		}
		else if (StringUtils.length(title) > 255)
		{
			errors.rejectValue("titleCode", "profile.title.invalid");
		}

		if (StringUtils.isBlank(firstName))
		{
			errors.rejectValue("firstName", "profile.firstName.invalid");
		}
		else if (StringUtils.length(firstName) > 255)
		{
			errors.rejectValue("firstName", "profile.firstName.invalid");
		}

		if (StringUtils.isBlank(lastName))
		{
			errors.rejectValue("lastName", "profile.lastName.invalid");
		}
		else if (StringUtils.length(lastName) > 255)
		{
			errors.rejectValue("lastName", "profile.lastName.invalid");
		}
		if (StringUtils.isBlank(mobileNumber))
		{
			errors.rejectValue("mobileNumber", "profile.mobileNumber.invalid");
		}
		else if (StringUtils.length(mobileNumber) > 10)
		{
			errors.rejectValue("mobileNumber", "profile.mobileNumber.invalid");
		}
	}

}
