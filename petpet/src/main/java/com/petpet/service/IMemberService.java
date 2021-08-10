package com.petpet.service;

import java.util.List;
import java.util.Optional;

import com.petpet.model.Member;

public interface IMemberService {

	public List<Member> findAll();
	public Member findById(Integer memberid);
	public Member save(Member member);
	public void delete(Member member);
	public void deleteById(Integer memberid);
	public Member findByEmail(String email);
	public Member findByEmailAndPassword(String email, String password);
	public void enable(Integer memberid);
	public Member findByVerificationcode(String code);
	public boolean verify(String verificationCode);
	Optional<Member> adminFindById(Integer memberid);
	public Member findByPassword(String password);
	public Member findByPasswordAndMemberid(String password, Integer memberid);
}
