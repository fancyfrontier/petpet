package com.petpet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.petpet.model.Member;

@Repository("memberDAO")
@Transactional
public interface MemberRepository  extends JpaRepository<Member, Integer>{
	
	public Member findByEmail(String email);
	public Member findByEmailAndPassword(String email, String password);

	@Query("UPDATE Member c SET c.enabled = true WHERE c.memberid = ?1")
	@Modifying
	public void enable(Integer memberid);
	
	public Member findByVerificationcode(String code);
	
	public Member findByResetPasswordToken(String token);
	
	public Member findByPassword(String password);

	public Member findByPasswordAndMemberid(String password, Integer memberid);
	
	public String findByOldpassword(String password);
}
