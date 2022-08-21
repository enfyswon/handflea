package kr.co.handflea.mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.handflea.order.OrderDTO;
import kr.co.handflea.util.dto.BankDTO;
import kr.co.handflea.util.dto.DeliveryDTO;
import kr.co.handflea.util.dto.MemberDTO;
import kr.co.handflea.util.dto.SellerDTO;

@Repository
public class MyPageDAO {
	
	@Autowired
	SqlSession sqlSession;

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

	public MemberDTO infoSelect(String mem_no) {
		MemberDTO dto = null;
		dto = sqlSession.selectOne("MyPageMapper.infoSelect", mem_no);
		
		return dto;
	}

	public int infoUpdate(MemberDTO dto) {
		int updateYN = 0;
		updateYN = sqlSession.update("MyPageMapper.infoUpdate", dto);
		
		return updateYN;
	}

	public void updateSellerYN(String mem_no) {
		sqlSession.update("MyPageMapper.updateSellerYN", mem_no);
	}

	public List<OrderDTO> recentOrder(String mem_no) {
		List<OrderDTO> list = null;
		list = sqlSession.selectList("MyPageMapper.recentOrder", mem_no);
		
		return list;
	}

	public List<OrderDTO> recentSellOrder(String mem_no) {
		List<OrderDTO> list = null;
		list = sqlSession.selectList("MyPageMapper.recentSellOrder", mem_no);
		
		return list;
	}

	public List<OrderDTO> saleList(String mem_no) {
		List<OrderDTO> list = null;
		list = sqlSession.selectList("MyPageMapper.saleList", mem_no);
		
		return list;
	}

	public OrderDTO saleDeliveryList(String detail_no) {
		OrderDTO dto = null;
		dto = sqlSession.selectOne("MyPageMapper.saleDeliveryList", detail_no);
		
		return dto;
	}

	public List<OrderDTO> orderList(String mem_no) {
		List<OrderDTO> list = null;
		list = sqlSession.selectList("MyPageMapper.orderList", mem_no);
		
		return list;
	}

	public OrderDTO orderDeliveryList(String detail_no) {
		OrderDTO dto = null;
		dto = sqlSession.selectOne("MyPageMapper.orderDeliveryList", detail_no);
		
		return dto;
	}

	public String deliveryChk(String detail_no) {
		String delivery_no = null;
		delivery_no = sqlSession.selectOne("MyPageMapper.deliveryChk", detail_no);
		
		return delivery_no;
	}

	public OrderDTO orderDetail(String detail_no) {
		OrderDTO dto = null;
		dto = sqlSession.selectOne("MyPageMapper.orderDetail", detail_no);
		
		return dto;
	}

	public OrderDTO orderDeliveryDetial(String detail_no) {
		OrderDTO dto = null;
		dto = sqlSession.selectOne("MyPageMapper.orderDeliveryDetial", detail_no);
		
		return dto;
	}

	public String sellerNo(String detail_no) {
		String seller_no = null;
		seller_no = sqlSession.selectOne("MyPageMapper.sellerNo", detail_no);
		
		return seller_no;
	}

	public List<DeliveryDTO> deliverySelect() {
		List<DeliveryDTO> list = null;
		list = sqlSession.selectList("MyPageMapper.deliverySelect");
		
		return list;
	}
}
