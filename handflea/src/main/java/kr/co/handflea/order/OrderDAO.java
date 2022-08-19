package kr.co.handflea.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class OrderDAO {

	@Autowired
	private SqlSession sqlSession;

	public int updateDeliveryAddrUsedDate( OrderDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("OrderMapper.updateDeliveryAddrUsedDate", dto);
		return successCount;
	}//updateDeliveryAddrUsedDate

	public int updateCreditCardUsedDate( OrderDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("OrderMapper.updateCreditCardUsedDate", dto);
		return successCount;
	}//updateCreditCardUsedDate

	public int deleteBasketByArray(String [] arr_basket_no) {
		int successCount = 0;
		successCount = sqlSession.delete("OrderMapper.deleteBasketByArray", arr_basket_no);
		return successCount;
	}//deleteBasketByArray

	public int insertBuyNowOrderDetail(OrderDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("OrderMapper.insertBuyNowOrderDetail", dto);
		return successCount;
	}//insertOrderDetail

	public int insertOrderDetail(OrderDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("OrderMapper.insertOrderDetail", dto);
		return successCount;
	}//insertOrderDetail

	public int insertOrderMain(OrderDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("OrderMapper.insertOrderMain", dto);
		return successCount;
	}//insertOrderMain

	public int deleteBasketByArray(Object arr_basket_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertOrder(OrderDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}//class
