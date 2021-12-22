package com.evolve.signup.vo;

public class Signup_TermsAgreement_VO {

	private Boolean useTA;
	private Boolean personalinfoTA;
	private Boolean snsTA;
	
	public Boolean getUseTA() {
		return useTA;
	}
	public void setUseTA(Boolean useTA) {
		this.useTA = useTA;
	}
	public Boolean getPersonalinfoTA() {
		return personalinfoTA;
	}
	public void setPersonalinfoTA(Boolean personalinfoTA) {
		this.personalinfoTA = personalinfoTA;
	}
	public Boolean getSnsTA() {
		return snsTA;
	}
	public void setSnsTA(Boolean snsTA) {
		this.snsTA = snsTA;
	}
	@Override
	public String toString() {
		return "Signup_TermsAgreement_VO [useTA=" + useTA + ", personalinfoTA=" + personalinfoTA + ", snsTA=" + snsTA
				+ "]";
	}
	
}
