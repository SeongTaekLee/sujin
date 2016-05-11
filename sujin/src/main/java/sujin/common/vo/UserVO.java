package sujin.common.vo;

public class UserVO {
	private String userId;
	private Boolean loginCondition;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Boolean getLoginCondition() {
		return loginCondition;
	}
	public void setLoginCondition(Boolean loginCondition) {
		this.loginCondition = loginCondition;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UserVO [userId=");
		builder.append(userId);
		builder.append(", loginCondition=");
		builder.append(loginCondition);
		builder.append("]");
		return builder.toString();
	}
	
	
}
