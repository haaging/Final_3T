package com.act.sitting;

import java.util.ArrayList;
import java.util.List;

import com.act.walk.WalkDTO;

public interface ISittingDAO
{
	public ArrayList<SittingDTO> list();
	public ArrayList<SittingDTO> IndexTagList();
	public ArrayList<SittingDTO> tagList();

	// 회원의 시험제출 유무 확인
	public int stsCount(SittingDTO dto);
	
	// 회원의 펫시터 면허번호 유무 확인
	public int slCount(SittingDTO dto);

	// 회원번호로 예전~현재 돌봄장소 기본정보 조회
	public ArrayList<SittingDTO> sittingPlaceBasic(String memSid);
	
	// ※현재 사용하고 있는 돌봄장소※의 태그들 조회
	public ArrayList<SittingDTO> sittingPlaceTags(int spSid);
	
	// 회원번호로 펫시터인 나에게 달린 후기 조회
	public ArrayList<SittingDTO> sittingReviews(String memSid);
	
	// 나에게 달린 후기를 쓴 회원번호로 그 회원의 닉네임 조회를 위한 전체출력
	public ArrayList<SittingDTO> sittingReviewers();
	
	public ArrayList<SittingDTO> spfilterlist(SittingDTO dto);
	
	public ArrayList<SittingDTO> spFilterTagList(SittingDTO dto);
	
	// 견주로서 오늘 펫시팅 예약 취소된건
	public ArrayList<SittingDTO> memSittingCancelToday(String memSid);
	
	// 펫시터로서 오늘 달린 펫시팅 후기들
	public ArrayList<SittingDTO> sittingReviewToday(String memSid);
	
	// 펫시터로서 오늘 반려당한 펫시팅 돌봄장소
	public ArrayList<SittingDTO> sittingCompanionToday(String memSid);

	// 견주입장에서 본인이 오늘 결제한 펫시팅의 시작일 ~ 종료일
	public ArrayList<SittingDTO> sittingStartEndNotice(String memSid);
	
	
	
	
	
	
	
	
	
}
