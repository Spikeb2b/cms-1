<?php
class Dbconn
{

	private $host = 'seight.mysql';
	private $username = 'seight_mysql';
	private $pass = 'hvxhtors';
	private $dbname = 'seight_clean';
	private $charset = 'UTF-8';

	private $result;
	private $currentindex;
	private $query;

	public $debug = 0;
	public $queries = array();


	function connect() 
	{
	    if (!@mysql_pconnect($this->host, $this->username, $this->pass)) {
	        echo $this->error();
	        return FALSE;
	    }

	    if (!@mysql_select_db($this->dbname)) {
	        echo $this->error();
	        return FALSE;
	    }
	    
	    @mysql_set_charset('utf8');
	}


	public function query($sql)
    {
    	$e_sql = "";
    	
    	if(!empty($sql))
    	{
    		foreach($sql as $key=>$val)
    		{
    			
    			if($key=="JOIN")
	    		{
	    			//if join
    				foreach($val as $kk=>$vv)
    				{
    					foreach($vv as $kkk=>$vvv)
    					{
    						$e_sql .= "\n ".$kk." ".$key;
    						$e_sql .= "\n\t ".$vvv." ";
    					};
    				};
    				//\\if join
    			}else
    			{
    				//if not join
	    			
    				$e_sql .= "\n ".$key." ";
    				if(!empty($val))
    				{
    					foreach($val as $kk=>$vv)
    					{
    						$e_sql .= "\n\t ".$vv;
    						if($key=="SELECT" && isset($val[$kk+1]))
    						{
    							$e_sql .= ", ";
    						}
    					};
    				}
    				
    				//\\if not join
    				
    			}
    		};
    	}
    	
    	//echo "<pre>";print_r($sql);echo "</pre>";
    	//echo "<pre>";print_r($e_sql);echo "</pre>";
    	//die();
    	
        $qq = @mysql_query($e_sql);
        if($qq)
        {
        	//количество найденных поиций
            $this->numResults = mysql_num_rows($qq);
            
            $mass = array();
            
            for($i = 0; $i < $this->numResults; $i++)
            {
                $mass[$i] = mysql_fetch_assoc($qq);
            };
            return $mass;
		}
        
    }


	function fetch_array() 
	{
	    if ($this->currentindex >= sizeof($this->result)) {
	        return ;
	    } else {
	        $this->currentindex++;
	        return $this->result[($this->currentindex - 1)];
	    }
	}


	function fetch_assoc()  
	{
	    return $this->fetch_array();
	}


	function result($index, $field) 
	{
	    if ($index < 0 || $index >= sizeof($this->result)) {
	        echo "DB error: " . $index . ": no such index (query: <b>" . $this->query . "</B>).";
	        return ;
	    }
	    return $this->result[$index][$field];
	}


	function numrows() 
	{
	    return sizeof($this->result);
	}


	function error() 
	{
	    return mysql_error();
	}


	function insert_id() 
	{
	    return mysql_insert_id();
	}


	function disconnect() 
	{
		return mysql_close();
	}


}
?>