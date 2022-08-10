package kr.co.handflea.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
@Service
public class ReviewService {

	@Autowired
    private ReviewDAO reviewDAO;
	
	public int write( ReviewDTO dto ) {
		int successCount = 0;
		return successCount;
	}//write
	
	public List<ReviewDTO> getReviewList(){
		List<ReviewDTO> list = null;
		return list;
	}//list


	
}
