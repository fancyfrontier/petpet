package com.petpet.model;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name="Member")
public class Member {
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "MemberID")
	private Integer memberid;
	
	@Column(name = "Email", nullable = false)
	private String email;
	
	@Column(name = "Password", nullable = false)
	private String password;
	
	@Lob
	@Column(name = "Photo", nullable = true)
	private byte[] photo;
	
	@Column(name = "Fullname", nullable = true)
	private String fullname;
	
	@Column(name = "Mobile", nullable = true)
	private String mobile;
	
	@Column(name = "Birthday", nullable = true)
	private String birthday;
	
	@Column(name = "Gneder", nullable = true)
	private String gender;
	
	@Column(name = "LogRecord", nullable = true)
	private Timestamp logrecord;
	
	@Column(name = "WishlistID", nullable = true)
	private Integer wishlistid;
	
	@Column(name = "CreateTime", nullable = true, updatable = false)
	private Date createtime;
	
	@Column(name = "UpdatePwdDate", nullable = true)
	private Timestamp updatepwddate;
	
	@Column(name = "PostalCode", nullable = true)
	private String postalcode;
	
	@Column(name = "City", nullable = true)
	private String city;
	
	@Column(name = "Region", nullable = true)
	private String region;
	
	@Column(name = "Address", nullable = true)
	private String address;
	
	@Column(name = "PostName", nullable = true)
	private String postname;
	
	@Column(name = "PostMobile", nullable = true)
	private String postmobile;
	
	@Column(name = "Enabled", nullable = true)
	private boolean enabled;

	@Column(name = "VerificationCode", updatable = false)
	private String verificationcode;

	@Column(name = "Reset_Password_Token")
	private String resetPasswordToken;
	
	public Member() {
	}
	
	public Integer getMemberid() {
		return memberid;
	}

	public void setMemberid(Integer memberId) {
		this.memberid = memberId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Timestamp getLogrecord() {
		return logrecord;
	}

	public void setLogrecord(Timestamp logrecord) {
		this.logrecord = logrecord;
	}

	public Integer getWishlistid() {
		return wishlistid;
	}

	public void setWishlistid(Integer wishlistid) {
		this.wishlistid = wishlistid;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Timestamp getUpdatepwddate() {
		return updatepwddate;
	}

	public void setUpdatepwddate(Timestamp updatepwddate) {
		this.updatepwddate = updatepwddate;
	}

	public String getPostalcode() {
		return postalcode;
	}

	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostname() {
		return postname;
	}

	public void setPostname(String postname) {
		this.postname = postname;
	}

	public String getPostmobile() {
		return postmobile;
	}

	public void setPostmobile(String postmobile) {
		this.postmobile = postmobile;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getVerificationcode() {
		return verificationcode;
	}

	public void setVerificationcode(String verificationcode) {
		this.verificationcode = verificationcode;
	}

	public String getResetPasswordToken() {
		return resetPasswordToken;
	}

	public void setResetPasswordToken(String resetPasswordToken) {
		this.resetPasswordToken = resetPasswordToken;
	}

	
	
}
