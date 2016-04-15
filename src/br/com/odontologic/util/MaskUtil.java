package br.com.odontologic.util;

import java.text.ParseException;

import javax.swing.text.MaskFormatter;

public class MaskUtil {

	private static final String MASCARA_CPF = "###.###.###-##";
	private static final String MASCARA_CNPJ = "##.###.###/####-##";
	private static final String MASCARA_CEP = "#####-###";
	private static final String MASCARA_TELEFONE = "(##) ####-#####";

	public static String format(String padrao,String valor){
		if (valor == null){
			return null;
		}
		MaskFormatter mask;
        try {
            mask = new MaskFormatter(padrao);
            mask.setValueContainsLiteralCharacters(false);
            return mask.valueToString(valor);
        } catch (ParseException e) {
            return null;
        }
	}
	
	public static String formatCPF(String valor){
		return format(MASCARA_CPF,valor);
	}
	
	public static String formatCNPJ(String valor){
		return format(MASCARA_CNPJ,valor);
	}
	
	public static String formatCEP(String valor){
		return format(MASCARA_CEP,valor);
	}
	
	public static String formatTelefone(String valor){
		return format(MASCARA_TELEFONE,valor);
	}
}
