package br.com.odontologic.dialect;

import org.hibernate.dialect.HSQLDialect;

public class TemporaryHSQLDBDialect extends HSQLDialect {

	@Override
	public boolean supportsSequences() {
		return false;
	}
}