package products.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import products.dto.ProductsCommentDTO;
import products.dto.ProductsDTO;
import sqlmap.MybatisManager;

public class ProductsDAO {
	//게시물 목록 리턴
	public List<ProductsDTO> list(int start, int end,String newproduct){
		List<ProductsDTO> list=null;
		SqlSession session=null;
		//혹시 있을지 모를 예외발생을 처리하기 위해 try~catch문처리
		try {
			session=MybatisManager.getInstance().openSession();
			Map<String,Object> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			if(newproduct == "y") {
			map.put("newproduct", newproduct);
			list=session.selectList("products.newproduct", map);
			}else {
			list=session.selectList("products.list", map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}
	public List<ProductsDTO> listcate(int start, int end, String categories_detail){
		List<ProductsDTO> list=null;
		SqlSession session=null;
		//혹시 있을지 모를 예외발생을 처리하기 위해 try~catch문처리
		try {
			session=MybatisManager.getInstance().openSession();
			Map<String,Object> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			map.put("categories_detail", categories_detail);
			list=session.selectList("products.listcate", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}
	
	//게시물 저장
	public void insert(ProductsDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("products.insert", dto);
			session.commit();//auto commit 아님
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	//첨부파일의 이름 찾기
	public String getFileName(int num) {
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			result = session.selectOne("products.getFileName", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return result;
	}

	//좋아요 횟수 증가 처리
	public void plusClick(int num, HttpSession count_session) {
		SqlSession session=null;
		try {
			long like_time=0;
			if(count_session.getAttribute("like_time_"+num)!=null) {
				like_time=(long)count_session.getAttribute("like_time_"+num);
			}
			long current_time=System.currentTimeMillis();//현재시각
			session=MybatisManager.getInstance().openSession();
			if(current_time-like_time>24*60*60*1000) {//현재시간-읽은시간>5초,
				session.update("products.plusClick", num);
				session.commit();//auto commit 아님
				//최근 좋아요 시각 업데이트
				count_session.setAttribute(
						"like_time_"+num, current_time);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	
	public ProductsDTO view(int num) {
		ProductsDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto = session.selectOne("products.view", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return dto;
	}
	
	public ProductsDTO viewReplace(int num) {
		ProductsDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto = session.selectOne("products.view", num);
			//줄바꿈 처리
			String content=dto.getContent();
			content=content.replace("<br>", "\n");
			dto.setContent(content);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return dto;
		
	}
	
	
	

	//조회수 증가 처리
	public void plusReadCount(int num, HttpSession count_session) {
		SqlSession session=null;
		try {
			long read_time=0;
			if(count_session.getAttribute("read_time_"+num)!=null) {
				read_time=(long)count_session.getAttribute("read_time_"+num);
			}
			long current_time=System.currentTimeMillis();//현재시각
			session=MybatisManager.getInstance().openSession();
			if(current_time-read_time>24*60*60*1000) {//현재시간-읽은시간>5초,
				//하루에 한번 증가 24*60*60*1000
				session.update("products.plusReadCount", num);
				session.commit();//auto commit 아님
				//최근 열람 시각 업데이트
				count_session.setAttribute(
						"read_time_"+num, current_time);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}

	}

	//댓글 목록
	public List<ProductsCommentDTO> commentList(int num) {
		List<ProductsCommentDTO> list=null;
		SqlSession session=null;
		try {
			session = MybatisManager.getInstance().openSession();
			list=session.selectList("products.commentList", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;

	}

	//댓글 추가
	public void commentAdd(ProductsCommentDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("products.commentAdd", dto);
			session.commit();//auto commit 아님
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}

	}

	//답글의 순서 조정
	public void updateStep(int ref, int re_step) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			ProductsDTO dto=new ProductsDTO();
			dto.setRef(ref);
			dto.setRe_step(re_step);
			session.update("products.updateStep", dto);
			session.commit();//auto commit 아님
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}

	}

	//비밀번호 체크
	public String passwdCheck(int num, String passwd) {
		String result=null;
		SqlSession session=null;
		try {
			session = MybatisManager.getInstance().openSession();
			Map<String,Object> map=new HashMap<>();
			map.put("num", num);
			map.put("passwd", passwd);
			result=session.selectOne("products.pass_check", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return result;
	}

	//수정
	public void update(ProductsDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("products.update", dto);
			session.commit();//auto commit 아님
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	//삭제
	public void delete(int num) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("products.delete", num);
			session.commit();//auto commit 아님
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	//검색기능
	public List<ProductsDTO> searchList(int start, int end, String search_option, String keyword) {
		List<ProductsDTO> list=null;
		//try~with문 : java 1.7버전부터 사용 가능
		//try(){}문장에서 finally절을 안써도 자동으로 리소스가 정리된다.
	    try(SqlSession session=MybatisManager.getInstance().openSession()) {
			Map<String,Object> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			map.put("search_option", search_option);
			map.put("keyword", "%"+keyword+"%");
			list=session.selectList("products.searchList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	//게시물 갯수 계산
	public int count() {
		int result=0;
		try(SqlSession session=MybatisManager.getInstance().openSession()) {
			result=session.selectOne("products.count");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public int countnew() {
		int result=0;
		try(SqlSession session=MybatisManager.getInstance().openSession()) {
			result=session.selectOne("products.countnew");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	//게시물 갯수 계산
		public int countcate(String categories_detail) {
			int result=0;
			try(SqlSession session=MybatisManager.getInstance().openSession()) {
				result=session.selectOne("products.countcate", categories_detail);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}
	//게시물 갯수 계산
		public int searchcount(String keyword) {
			int result=0;
			try(SqlSession session=MybatisManager.getInstance().openSession()) {
				result=session.selectOne("products.searchcount", "%"+keyword+"%");
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}
}