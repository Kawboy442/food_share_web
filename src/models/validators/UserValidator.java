package models.validators;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import models.User;
import utils.DBUtil;

public class UserValidator {
    public static List<String> validate(User u, Boolean userNameDuplicateCheckFlag, Boolean passwordCheckFlag) {
        List<String> errors = new ArrayList<String>();

        String code_error = validateUserName(u.getUser_name(), userNameDuplicateCheckFlag);
        if(!code_error.equals("")) {
            errors.add(code_error);
        }

        String password_error = validatePassword(u.getPassword(), passwordCheckFlag);
        if(!password_error.equals("")) {
            errors.add(password_error);
        }

        return errors;
    }

    // ユーザー名
    private static String validateUserName(String userName, Boolean userNameDuplicateCheckFlag) {
        // 必須入力チェック
        if(userName == null || userName.equals("")) {
            return "ユーザー名を入力してください。";
        }

        // すでに登録されているユーザー名との重複チェック
        if(userNameDuplicateCheckFlag) {
            EntityManager em = DBUtil.createEntityManager();
            long users_count = (long)em.createNamedQuery("checkRegisteredUser", Long.class).setParameter("name", userName).getSingleResult();
            em.close();
            if(users_count > 0) {
                return "入力されたユーザー名はすでに存在しています。";
            }
        }

        return "";
    }

    // パスワードの必須入力チェック
    private static String validatePassword(String password, Boolean passwordCheckFlag) {
        // パスワードを変更する場合のみ実行
        if(passwordCheckFlag && (password == null || password.equals(""))) {
            return "パスワードを入力してください。";
        }
        return "";
    }
	// パスワードの入力チェック
	private static String validatePassword(String password, String againPassword, Boolean passwordCheckFlag) {
		// 新規ユーザー登録時/パスワードを変更する場合に実行
		if(passwordCheckFlag && (password == null || password.equals(""))) {
			return "パスワードを入力してください。";
		}
		if(passwordCheckFlag && (password != againPassword)) {
			return "入力されたパスワードが一致していません。確認して再度パスワードを入力してください。";
		}
		return "";
	}

}
