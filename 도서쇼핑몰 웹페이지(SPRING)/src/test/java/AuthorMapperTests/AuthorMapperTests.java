package AuthorMapperTests;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shop.mapper.AuthorMapper;
import com.shop.model.AttachImageVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AuthorMapperTests {

	@Autowired
	private AuthorMapper mapper;

	/*
	 * 작가 등록 테스트
	 * 
	 * @Test public void authorEnroll() throws Exception{
	 * 
	 * AuthorVO author = new AuthorVO();
	 * 
	 * author.setNationId("01"); author.setAuthorName("테스트");
	 * author.setAuthorIntro("테스트 소개");
	 * 
	 * mapper.authorEnroll(author);
	 * 
	 * }
	 */

	/* 작가 목록 테스트 */
	/*
	 * @Test public void authorGetListTest() throws Exception {
	 * 
	 * Criteria cri = new Criteria(); // cri.setKeyword("일런");
	 * 
	 * List<AuthorVO> list = mapper.authorGetList(cri);
	 * 
	 * 
	 * for (int i = 0; i < list.size(); i++) { System.out.println("list" + i +
	 * ".........." + list.get(i)); }
	 * 
	 * }
	 */
	
	/*
	 * @Test public void authorGetTotalTest() throws Exception {
	 * 
	 * Criteria cri = new Criteria(); cri.setKeyword("유ㅜ재현");
	 * 
	 * int total = mapper.authorGetTotal(cri);
	 * 
	 * System.out.println("total....." + total); }
	 */
	
	/* 작가 상세 페이지 */

	
	
		
	}
    
	
	

