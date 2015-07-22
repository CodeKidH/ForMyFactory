package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import logic.Todo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.jdbc.core.support.AbstractLobCreatingPreparedStatementCallback;
import org.springframework.jdbc.support.lob.LobCreator;
import org.springframework.jdbc.support.lob.LobHandler;
import org.springframework.stereotype.Repository;

@Repository
public class TodoDaoImpl implements TodoDao{
	
	@Autowired
	private LobHandler lobHandler;
	
	private SimpleJdbcTemplate template;

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.template = new SimpleJdbcTemplate(dataSource);
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	private static final String FIND_ALL = "select * from todo";
	
	public List<Todo> findAll(){
		RowMapper<Todo> mapper = new BeanPropertyRowMapper<Todo>(Todo.class);
		return this.jdbcTemplate.query(TodoDaoImpl.FIND_ALL,mapper);
	}
	
	private static final String INSERT = "INSERT INTO todo(note) values (?)";

	public void create(final Todo todo) {
		this.jdbcTemplate.execute(INSERT, new AbstractLobCreatingPreparedStatementCallback(lobHandler) {
			@Override
			protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException,
					DataAccessException {
				int index = 0;
				ps.setString(++index, todo.getNote());
			}
		});
	}

}
