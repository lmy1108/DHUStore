package com.dhu.demo2.pojo;

import java.util.ArrayList;
import java.util.List;

public class DiscountExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public DiscountExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andDiscountidIsNull() {
            addCriterion("discountId is null");
            return (Criteria) this;
        }

        public Criteria andDiscountidIsNotNull() {
            addCriterion("discountId is not null");
            return (Criteria) this;
        }

        public Criteria andDiscountidEqualTo(Integer value) {
            addCriterion("discountId =", value, "discountid");
            return (Criteria) this;
        }

        public Criteria andDiscountidNotEqualTo(Integer value) {
            addCriterion("discountId <>", value, "discountid");
            return (Criteria) this;
        }

        public Criteria andDiscountidGreaterThan(Integer value) {
            addCriterion("discountId >", value, "discountid");
            return (Criteria) this;
        }

        public Criteria andDiscountidGreaterThanOrEqualTo(Integer value) {
            addCriterion("discountId >=", value, "discountid");
            return (Criteria) this;
        }

        public Criteria andDiscountidLessThan(Integer value) {
            addCriterion("discountId <", value, "discountid");
            return (Criteria) this;
        }

        public Criteria andDiscountidLessThanOrEqualTo(Integer value) {
            addCriterion("discountId <=", value, "discountid");
            return (Criteria) this;
        }

        public Criteria andDiscountidIn(List<Integer> values) {
            addCriterion("discountId in", values, "discountid");
            return (Criteria) this;
        }

        public Criteria andDiscountidNotIn(List<Integer> values) {
            addCriterion("discountId not in", values, "discountid");
            return (Criteria) this;
        }

        public Criteria andDiscountidBetween(Integer value1, Integer value2) {
            addCriterion("discountId between", value1, value2, "discountid");
            return (Criteria) this;
        }

        public Criteria andDiscountidNotBetween(Integer value1, Integer value2) {
            addCriterion("discountId not between", value1, value2, "discountid");
            return (Criteria) this;
        }

        public Criteria andDiscountnameIsNull() {
            addCriterion("discountName is null");
            return (Criteria) this;
        }

        public Criteria andDiscountnameIsNotNull() {
            addCriterion("discountName is not null");
            return (Criteria) this;
        }

        public Criteria andDiscountnameEqualTo(String value) {
            addCriterion("discountName =", value, "discountname");
            return (Criteria) this;
        }

        public Criteria andDiscountnameNotEqualTo(String value) {
            addCriterion("discountName <>", value, "discountname");
            return (Criteria) this;
        }

        public Criteria andDiscountnameGreaterThan(String value) {
            addCriterion("discountName >", value, "discountname");
            return (Criteria) this;
        }

        public Criteria andDiscountnameGreaterThanOrEqualTo(String value) {
            addCriterion("discountName >=", value, "discountname");
            return (Criteria) this;
        }

        public Criteria andDiscountnameLessThan(String value) {
            addCriterion("discountName <", value, "discountname");
            return (Criteria) this;
        }

        public Criteria andDiscountnameLessThanOrEqualTo(String value) {
            addCriterion("discountName <=", value, "discountname");
            return (Criteria) this;
        }

        public Criteria andDiscountnameLike(String value) {
            addCriterion("discountName like", value, "discountname");
            return (Criteria) this;
        }

        public Criteria andDiscountnameNotLike(String value) {
            addCriterion("discountName not like", value, "discountname");
            return (Criteria) this;
        }

        public Criteria andDiscountnameIn(List<String> values) {
            addCriterion("discountName in", values, "discountname");
            return (Criteria) this;
        }

        public Criteria andDiscountnameNotIn(List<String> values) {
            addCriterion("discountName not in", values, "discountname");
            return (Criteria) this;
        }

        public Criteria andDiscountnameBetween(String value1, String value2) {
            addCriterion("discountName between", value1, value2, "discountname");
            return (Criteria) this;
        }

        public Criteria andDiscountnameNotBetween(String value1, String value2) {
            addCriterion("discountName not between", value1, value2, "discountname");
            return (Criteria) this;
        }

        public Criteria andDiscountdesIsNull() {
            addCriterion("discountDes is null");
            return (Criteria) this;
        }

        public Criteria andDiscountdesIsNotNull() {
            addCriterion("discountDes is not null");
            return (Criteria) this;
        }

        public Criteria andDiscountdesEqualTo(String value) {
            addCriterion("discountDes =", value, "discountdes");
            return (Criteria) this;
        }

        public Criteria andDiscountdesNotEqualTo(String value) {
            addCriterion("discountDes <>", value, "discountdes");
            return (Criteria) this;
        }

        public Criteria andDiscountdesGreaterThan(String value) {
            addCriterion("discountDes >", value, "discountdes");
            return (Criteria) this;
        }

        public Criteria andDiscountdesGreaterThanOrEqualTo(String value) {
            addCriterion("discountDes >=", value, "discountdes");
            return (Criteria) this;
        }

        public Criteria andDiscountdesLessThan(String value) {
            addCriterion("discountDes <", value, "discountdes");
            return (Criteria) this;
        }

        public Criteria andDiscountdesLessThanOrEqualTo(String value) {
            addCriterion("discountDes <=", value, "discountdes");
            return (Criteria) this;
        }

        public Criteria andDiscountdesLike(String value) {
            addCriterion("discountDes like", value, "discountdes");
            return (Criteria) this;
        }

        public Criteria andDiscountdesNotLike(String value) {
            addCriterion("discountDes not like", value, "discountdes");
            return (Criteria) this;
        }

        public Criteria andDiscountdesIn(List<String> values) {
            addCriterion("discountDes in", values, "discountdes");
            return (Criteria) this;
        }

        public Criteria andDiscountdesNotIn(List<String> values) {
            addCriterion("discountDes not in", values, "discountdes");
            return (Criteria) this;
        }

        public Criteria andDiscountdesBetween(String value1, String value2) {
            addCriterion("discountDes between", value1, value2, "discountdes");
            return (Criteria) this;
        }

        public Criteria andDiscountdesNotBetween(String value1, String value2) {
            addCriterion("discountDes not between", value1, value2, "discountdes");
            return (Criteria) this;
        }

        public Criteria andDiscountvalIsNull() {
            addCriterion("discountVal is null");
            return (Criteria) this;
        }

        public Criteria andDiscountvalIsNotNull() {
            addCriterion("discountVal is not null");
            return (Criteria) this;
        }

        public Criteria andDiscountvalEqualTo(Float value) {
            addCriterion("discountVal =", value, "discountval");
            return (Criteria) this;
        }

        public Criteria andDiscountvalNotEqualTo(Float value) {
            addCriterion("discountVal <>", value, "discountval");
            return (Criteria) this;
        }

        public Criteria andDiscountvalGreaterThan(Float value) {
            addCriterion("discountVal >", value, "discountval");
            return (Criteria) this;
        }

        public Criteria andDiscountvalGreaterThanOrEqualTo(Float value) {
            addCriterion("discountVal >=", value, "discountval");
            return (Criteria) this;
        }

        public Criteria andDiscountvalLessThan(Float value) {
            addCriterion("discountVal <", value, "discountval");
            return (Criteria) this;
        }

        public Criteria andDiscountvalLessThanOrEqualTo(Float value) {
            addCriterion("discountVal <=", value, "discountval");
            return (Criteria) this;
        }

        public Criteria andDiscountvalIn(List<Float> values) {
            addCriterion("discountVal in", values, "discountval");
            return (Criteria) this;
        }

        public Criteria andDiscountvalNotIn(List<Float> values) {
            addCriterion("discountVal not in", values, "discountval");
            return (Criteria) this;
        }

        public Criteria andDiscountvalBetween(Float value1, Float value2) {
            addCriterion("discountVal between", value1, value2, "discountval");
            return (Criteria) this;
        }

        public Criteria andDiscountvalNotBetween(Float value1, Float value2) {
            addCriterion("discountVal not between", value1, value2, "discountval");
            return (Criteria) this;
        }

        public Criteria andFullpriceIsNull() {
            addCriterion("fullPrice is null");
            return (Criteria) this;
        }

        public Criteria andFullpriceIsNotNull() {
            addCriterion("fullPrice is not null");
            return (Criteria) this;
        }

        public Criteria andFullpriceEqualTo(Integer value) {
            addCriterion("fullPrice =", value, "fullprice");
            return (Criteria) this;
        }

        public Criteria andFullpriceNotEqualTo(Integer value) {
            addCriterion("fullPrice <>", value, "fullprice");
            return (Criteria) this;
        }

        public Criteria andFullpriceGreaterThan(Integer value) {
            addCriterion("fullPrice >", value, "fullprice");
            return (Criteria) this;
        }

        public Criteria andFullpriceGreaterThanOrEqualTo(Integer value) {
            addCriterion("fullPrice >=", value, "fullprice");
            return (Criteria) this;
        }

        public Criteria andFullpriceLessThan(Integer value) {
            addCriterion("fullPrice <", value, "fullprice");
            return (Criteria) this;
        }

        public Criteria andFullpriceLessThanOrEqualTo(Integer value) {
            addCriterion("fullPrice <=", value, "fullprice");
            return (Criteria) this;
        }

        public Criteria andFullpriceIn(List<Integer> values) {
            addCriterion("fullPrice in", values, "fullprice");
            return (Criteria) this;
        }

        public Criteria andFullpriceNotIn(List<Integer> values) {
            addCriterion("fullPrice not in", values, "fullprice");
            return (Criteria) this;
        }

        public Criteria andFullpriceBetween(Integer value1, Integer value2) {
            addCriterion("fullPrice between", value1, value2, "fullprice");
            return (Criteria) this;
        }

        public Criteria andFullpriceNotBetween(Integer value1, Integer value2) {
            addCriterion("fullPrice not between", value1, value2, "fullprice");
            return (Criteria) this;
        }

        public Criteria andReducepriceIsNull() {
            addCriterion("reducePrice is null");
            return (Criteria) this;
        }

        public Criteria andReducepriceIsNotNull() {
            addCriterion("reducePrice is not null");
            return (Criteria) this;
        }

        public Criteria andReducepriceEqualTo(Integer value) {
            addCriterion("reducePrice =", value, "reduceprice");
            return (Criteria) this;
        }

        public Criteria andReducepriceNotEqualTo(Integer value) {
            addCriterion("reducePrice <>", value, "reduceprice");
            return (Criteria) this;
        }

        public Criteria andReducepriceGreaterThan(Integer value) {
            addCriterion("reducePrice >", value, "reduceprice");
            return (Criteria) this;
        }

        public Criteria andReducepriceGreaterThanOrEqualTo(Integer value) {
            addCriterion("reducePrice >=", value, "reduceprice");
            return (Criteria) this;
        }

        public Criteria andReducepriceLessThan(Integer value) {
            addCriterion("reducePrice <", value, "reduceprice");
            return (Criteria) this;
        }

        public Criteria andReducepriceLessThanOrEqualTo(Integer value) {
            addCriterion("reducePrice <=", value, "reduceprice");
            return (Criteria) this;
        }

        public Criteria andReducepriceIn(List<Integer> values) {
            addCriterion("reducePrice in", values, "reduceprice");
            return (Criteria) this;
        }

        public Criteria andReducepriceNotIn(List<Integer> values) {
            addCriterion("reducePrice not in", values, "reduceprice");
            return (Criteria) this;
        }

        public Criteria andReducepriceBetween(Integer value1, Integer value2) {
            addCriterion("reducePrice between", value1, value2, "reduceprice");
            return (Criteria) this;
        }

        public Criteria andReducepriceNotBetween(Integer value1, Integer value2) {
            addCriterion("reducePrice not between", value1, value2, "reduceprice");
            return (Criteria) this;
        }

        public Criteria andFullnumIsNull() {
            addCriterion("fullNum is null");
            return (Criteria) this;
        }

        public Criteria andFullnumIsNotNull() {
            addCriterion("fullNum is not null");
            return (Criteria) this;
        }

        public Criteria andFullnumEqualTo(Integer value) {
            addCriterion("fullNum =", value, "fullnum");
            return (Criteria) this;
        }

        public Criteria andFullnumNotEqualTo(Integer value) {
            addCriterion("fullNum <>", value, "fullnum");
            return (Criteria) this;
        }

        public Criteria andFullnumGreaterThan(Integer value) {
            addCriterion("fullNum >", value, "fullnum");
            return (Criteria) this;
        }

        public Criteria andFullnumGreaterThanOrEqualTo(Integer value) {
            addCriterion("fullNum >=", value, "fullnum");
            return (Criteria) this;
        }

        public Criteria andFullnumLessThan(Integer value) {
            addCriterion("fullNum <", value, "fullnum");
            return (Criteria) this;
        }

        public Criteria andFullnumLessThanOrEqualTo(Integer value) {
            addCriterion("fullNum <=", value, "fullnum");
            return (Criteria) this;
        }

        public Criteria andFullnumIn(List<Integer> values) {
            addCriterion("fullNum in", values, "fullnum");
            return (Criteria) this;
        }

        public Criteria andFullnumNotIn(List<Integer> values) {
            addCriterion("fullNum not in", values, "fullnum");
            return (Criteria) this;
        }

        public Criteria andFullnumBetween(Integer value1, Integer value2) {
            addCriterion("fullNum between", value1, value2, "fullnum");
            return (Criteria) this;
        }

        public Criteria andFullnumNotBetween(Integer value1, Integer value2) {
            addCriterion("fullNum not between", value1, value2, "fullnum");
            return (Criteria) this;
        }

        public Criteria andReducenumIsNull() {
            addCriterion("reduceNum is null");
            return (Criteria) this;
        }

        public Criteria andReducenumIsNotNull() {
            addCriterion("reduceNum is not null");
            return (Criteria) this;
        }

        public Criteria andReducenumEqualTo(Integer value) {
            addCriterion("reduceNum =", value, "reducenum");
            return (Criteria) this;
        }

        public Criteria andReducenumNotEqualTo(Integer value) {
            addCriterion("reduceNum <>", value, "reducenum");
            return (Criteria) this;
        }

        public Criteria andReducenumGreaterThan(Integer value) {
            addCriterion("reduceNum >", value, "reducenum");
            return (Criteria) this;
        }

        public Criteria andReducenumGreaterThanOrEqualTo(Integer value) {
            addCriterion("reduceNum >=", value, "reducenum");
            return (Criteria) this;
        }

        public Criteria andReducenumLessThan(Integer value) {
            addCriterion("reduceNum <", value, "reducenum");
            return (Criteria) this;
        }

        public Criteria andReducenumLessThanOrEqualTo(Integer value) {
            addCriterion("reduceNum <=", value, "reducenum");
            return (Criteria) this;
        }

        public Criteria andReducenumIn(List<Integer> values) {
            addCriterion("reduceNum in", values, "reducenum");
            return (Criteria) this;
        }

        public Criteria andReducenumNotIn(List<Integer> values) {
            addCriterion("reduceNum not in", values, "reducenum");
            return (Criteria) this;
        }

        public Criteria andReducenumBetween(Integer value1, Integer value2) {
            addCriterion("reduceNum between", value1, value2, "reducenum");
            return (Criteria) this;
        }

        public Criteria andReducenumNotBetween(Integer value1, Integer value2) {
            addCriterion("reduceNum not between", value1, value2, "reducenum");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}