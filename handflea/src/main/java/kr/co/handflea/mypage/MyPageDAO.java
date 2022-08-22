package kr.co.handflea.mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.handflea.util.dto.BankDTO;
import kr.co.handflea.util.dto.MemberDTO;
import kr.co.handflea.util.dto.SellerDTO;

@Repository
public class MyPageDAO {
	
	@Autowired
	SqlSession sqlSession;

	public void updateSellerYN(String mem_no) {
		sqlSession.update("MyPageMapper.updateSellerYN", mem_no);
	}
	
	public int sellerjoin(SellerDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("MyPageMapper.sellerjoin", dto);
		return successCount;
	}//sellerjoin
	
	public List<BankDTO> bankSelect() {
		List<BankDTO> list = null;
		list = sqlSession.selectList("MyPageMapper.bankSelect");
		return list;
	}

	public MemberDTO sellerInfoSelect(String mem_no) {
		MemberDTO dto = null;
		dto = sqlSession.selectOne("MyPageMapper.sellerInfoSelect", mem_no);
		return dto;
	}
	
	public MemberDTO infoSelect(String mem_no) {
		MemberDTO dto = null;
		dto = sqlSession.selectOne("MyPageMapper.infoSelect", mem_no);
		
		return dto;
	}

	public int sellerInfoUpdate(MemberDTO dto) {
		int updateYN = 0;
		updateYN = sqlSession.update("MyPageMapper.sellerInfoUpdate", dto);
		
		return updateYN;
	}
	
	public int infoUpdate(MemberDTO dto) {
		int updateYN = 0;
		updateYN = sqlSession.update("MyPageMapper.infoUpdate", dto);
		
		return updateYN;
	}

	public int sellerDelete(MemberDTO dto) {
		int deleteYn = 0;
		deleteYn = sqlSession.delete("MyPageMapper.sellerDelete", dto);
		return deleteYn;
	}

	public int memDelete(MemberDTO dto) {
		int deleteYn = 0;
		deleteYn = sqlSession.delete("MyPageMapper.memDelete", dto);
		return deleteYn;
	}

}
