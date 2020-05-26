create or replace
procedure proc_customer is 
  v_cnt number;
begin
    select  count(*) into v_cnt 
    from all_tables
    where owner = 'demo' and table_name = 'CUSTOMER'
    if v_cnt = 0 then 
      execute immediate 'create table CUSTOMER
                          (
                          customer_id integer,
                          email       varchar(45),
                          firstname   varchar(20),
                          lastname    varchar(40),
                          gender      varchar(20),
                          birthdate   date,
                          credits decimal(4)
                          )';
      COMMIT;
    end if;  
    select  count(*) INTO v_cnt
    from all_sequences
    where sequence_owner  = 'demo' and sequence_name = 'SEQ_CUSTOMER'
    
    if v_cnt = 0 then
    execute immediate 'create squence seq_customer
                        start with 10000
                        increment by 1
                        cache        20';
    commit;
   end if; 
end proc_customer;