package com.fdc.admin.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.fdc.admin.pojo.Comments;

/**
 * A data access object (DAO) providing persistence and search support for
 * Comments entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.fdc.admin.pojo.Comments
 * @author MyEclipse Persistence Tools
 */
public class CommentsDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(CommentsDAO.class);
	// property constants
	public static final String COMTER_ID = "comterId";
	public static final String COMTED_ID = "comtedId";
	public static final String CONTENT = "content";

	protected void initDao() {
		// do nothing
	}

	public void save(Comments transientInstance) {
		log.debug("saving Comments instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		}
		catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Comments persistentInstance) {
		log.debug("deleting Comments instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		}
		catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public void deleteById(int id) {
		Comments cmt = findById(id);
		if (null != cmt) {
			delete(cmt);
		}
		else {
			System.err.println("Can not find comment with id:" + id);
		}
	}

	public Comments findById(java.lang.Integer id) {
		log.debug("getting Comments instance with id: " + id);
		try {
			Comments instance = (Comments) getHibernateTemplate().get(
					"com.fdc.admin.pojo.Comments", id);
			return instance;
		}
		catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Comments> findByExample(Comments instance) {
		log.debug("finding Comments instance by example");
		try {
			List<Comments> results = getHibernateTemplate().findByExample(
					instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		}
		catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Comments> findByProperty(String propertyName, Object value) {
		log.debug("finding Comments instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Comments as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		}
		catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Comments> findByComterId(Object comterId) {
		return findByProperty(COMTER_ID, comterId);
	}

	public List<Comments> findByComtedId(Object comtedId) {
		return findByProperty(COMTED_ID, comtedId);
	}

	public List<Comments> findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	@SuppressWarnings("unchecked")
	public List<Comments> findAll() {
		log.debug("finding all Comments instances");
		try {
			String queryString = "from Comments";
			return getHibernateTemplate().find(queryString);
		}
		catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Comments merge(Comments detachedInstance) {
		log.debug("merging Comments instance");
		try {
			Comments result = (Comments) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		}
		catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Comments instance) {
		log.debug("attaching dirty Comments instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		}
		catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Comments instance) {
		log.debug("attaching clean Comments instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		}
		catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static CommentsDAO getFromApplicationContext(ApplicationContext ctx) {
		return (CommentsDAO) ctx.getBean("CommentsDAO");
	}
}