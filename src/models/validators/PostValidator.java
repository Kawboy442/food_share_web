package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Post;

public class PostValidator {
	public static List<String> validate(Post p) {
		List<String> errors = new ArrayList<String>();

		String store_name_error = _validateStoreName(p.getStore_name());
		if(!store_name_error.equals("")) {
			errors.add(store_name_error);
		}

		String title_error = _validateTitle(p.getTitle());
		if(!title_error.equals("")) {
			errors.add(title_error);
		}

		String content_error = _validateContent(p.getContent());
		if(!content_error.equals("")) {
			errors.add(content_error);
		}

		String evaluation_error = _validateEvaluation(p.getEvaluation());
		if(!evaluation_error.equals("")) {
			errors.add(evaluation_error);
		}

		return errors;
	}

	private static String _validateStoreName(String store_name) {
		if(store_name == null || store_name.equals("")) {
			return "店名を入力してください。";
		}

		return "";
	}

	private static String _validateTitle(String title) {
		if(title == null || title.equals("")) {
			return "タイトルを入力してください。";
		}

		return "";
	}

	private static String _validateContent(String content) {
		if(content == null || content.equals("")) {
			return "内容を入力してください。";
		}

		return "";
	}

	private static String _validateEvaluation(int evaluation) {
		if(evaluation == 0) {
			return "店の評価を設定してください。";
		}

		return "";
	}

}
