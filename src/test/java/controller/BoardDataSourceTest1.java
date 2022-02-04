package controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.inject.Inject;
import javax.sql.DataSource;
import java.sql.Connection;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
        locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
)
public class BoardDataSourceTest1 {

    // DataSource 객체 생성(DI)
    @Inject
    private DataSource ds;

    @Test
    public void testDataSource() throws Exception {
        System.out.println("테스트 작동 시작");

        System.out.println("ds : " + ds);
        System.out.println("------------------------------");

        try (Connection con = ds.getConnection()) {
            System.out.println("con : " + con);
        } catch (Exception e) {
            e.printStackTrace();
        }


        System.out.println("테스트 작동 종료");
    }

}
