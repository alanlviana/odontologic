package br.com.odontologic.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import br.com.caelum.vraptor.Convert;
import br.com.caelum.vraptor.converter.Converter;

@Convert(Date.class)
public class DateConverter implements Converter<Date> {

	@Override
	public Date convert(String value, Class<? extends Date> arg1) {
		// TODO Auto-generated method stub
		try {
			return new SimpleDateFormat("dd/MM/yyyy HH:mm").parse(value);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
