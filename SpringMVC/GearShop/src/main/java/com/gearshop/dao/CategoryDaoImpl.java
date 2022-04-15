package com.gearshop.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gearshop.model.Category;

@Repository
public class CategoryDaoImpl implements CategoryDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Category> getAllCategories() {
		List<Category> categories = new ArrayList<Category>();
		try(Session session = sessionFactory.openSession()) {
			session.beginTransaction();
			CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			CriteriaQuery<Category> criteriaQuery = criteriaBuilder.createQuery(Category.class);
			Root<Category> root = criteriaQuery.from(Category.class);
			criteriaQuery.select(root);
			categories = session.createQuery(criteriaQuery).getResultList();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return categories;
	}
}
