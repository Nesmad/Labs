select order_id, order_item_id, max(price) from olist.order_items order by price desc;
select order_id, order_item_id, min(price) from olist.order_items order by price desc;