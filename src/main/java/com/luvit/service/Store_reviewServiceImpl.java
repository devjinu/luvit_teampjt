package com.luvit.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.luvit.domain.QnaVO;
import com.luvit.domain.StoreVO;
import com.luvit.domain.Store_reviewVO;
import com.luvit.persistence.Store_reviewDAO;

//@Service : 해당 클래스를 서비스 객체로 처리 하겠다.(스프링에서 인식)



@Service
public class Store_reviewServiceImpl implements Store_reviewService{
	// DB처리하기위한 객체 주입 
		@Inject
		private Store_reviewDAO srdao;
		
		// 후기 조회
		@Override
		public List<Store_reviewVO> list_store_review() throws Exception {

			return srdao.list_store_review();
		}
		
		/* 후기 등록 */
		@Override
		public void insertReview(Store_reviewVO vo) throws Exception {
			// 컨트롤러 -> 서비스 호출 -> DAO 호출 -> Mapper->DB
			System.out.println("Service : 리뷰 작성 동작");
			if(vo == null) {
				//처리
				return;
			}
			
			srdao.insertReview(vo);
		}	
		
		// 후기 정보 가져오기
		@Override
		public Store_reviewVO getStore_review(int s_r_bno) throws Exception {
			System.out.println("Service : 후기 가져오기 동작");
			
			Store_reviewVO vo = srdao.getStore_review(s_r_bno);
			srdao.storeReviewHit(s_r_bno); // 조회수 증가
			
			return vo;
		}
		
		/* 후기 수정 */
		@Override
		public void updateReview(Store_reviewVO vo) throws Exception {
			System.out.println("S : updateReview(vo) 호출");
			System.out.println("S : DAO 객체 생성후 메서드 호출");
			
			srdao.updateReview(vo);
			
			System.out.println("S : 수정완료! ");
		}
		
		/* 후기 삭제 */
		@Override 
		public void deleteReview(int s_r_bno)  {
			srdao.deleteReview(s_r_bno);
			System.out.println("S : 삭제완료! ");
		 }
		
		/* 후기 갯수 */
		@Override 
		public int count() throws Exception {
			return srdao.count();
		}
		
		// 게시물 목록 + 페이징 (전체)
		@Override
		public List listAll2(int displayPost3, int postNum3) throws Exception{
			return srdao.listAll2(displayPost3, postNum3); 
		}
		
		// 게시물 목록 + 페이징
		@Override
		public List listPage(int displayPost, int postNum, int s_r_pno) throws Exception{ 
			System.out.println("@@@@@@@@@@@@@@@@@ : postNum" + postNum);
			System.out.println("@@@@@@@@@@@@@@@@@ : displayPost" + displayPost);
			return srdao.listPage(displayPost, postNum, s_r_pno); 
		}
		
		// 게시물 목록 + 페이징 (카테고리)
		@Override
		public List catePage(int displayPost1, int postNum1,String s_r_cate) throws Exception{ 
			return srdao.catePage(displayPost1, postNum1,s_r_cate); 
		}
		
		// 후기 추천여부 검사
		@Override
		public int srlCheck(Map<String, Object> m) throws Exception{
			return srdao.srlCheck(m);
		}
		
		// 후기 추천
		@Override
		public void srlUpdate(Map<String, Object> m) throws Exception{
			srdao.srlUpdate(m);
		}
		
		// 후기 추천 제거
		@Override
		public void srlDelete(Map<String, Object> m) throws Exception{
			srdao.srlDelete(m);
		}
		
		// 후기 추천수
		@Override
		public int srlCount(int s_r_bno) throws Exception{
			return srdao.srlCount(s_r_bno);
		}
		
		// 상품 이름 조회 
		@Override
		public StoreVO productName(int s_r_pno) throws Exception{
			System.out.println("Service : 상품 이름 조회");
			StoreVO vo = srdao.productName(s_r_pno);
			
			return vo;
		}
		
		
}
		
		
