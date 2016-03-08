<?php
class Conts
{

	function show_form() 
	{
		$Dbconn = new Dbconn();
		
		if(isset($_GET['key']) && !empty($_GET['key']))
		{
			$key = $_GET['key'];
		}else
		{
			$key = "";
		}
		
		$sql = array();
		$sql['SELECT'] = array(
			'DISTINCT (harvals.id)',
			'hars.id AS har_id',
			'hars.name',
			'harvals.val'
		);
		$sql['FROM'] = array(
			'harvals, hars, hars_harvals'
		);
		/*$sql['JOIN']['INNER'] = array(
			'products ON hars_harvals.product_id = products.id',
		);*/
		$sql['WHERE'][] = 'harvals.is_active = 1';
		$sql['WHERE'][] = 'AND hars_harvals.har_id = hars.id';
		$sql['WHERE'][] = 'AND hars_harvals.harval_id = harvals.id';
		
		$sql['ORDER BY'] = array(
			'harvals.id'
		);
		
		$props = $Dbconn->query($sql);
		$err = $Dbconn->error();
		if($err)
		{
			echo "<pre>"; print_r($err); echo "</pre>";
		}
		//echo "<pre>"; print_r($props); echo "</pre>";
		
		$nm = array();
		
		foreach($props as $kk=>$vv)
		{
			$nm[$props[$kk]['har_id']]['name'] = $props[$kk]['name'];
			$nm[$props[$kk]['har_id']][$kk]['prop_id'] = $props[$kk]['id'];
			$nm[$props[$kk]['har_id']][$kk]['val'] = $props[$kk]['val'];
			unset($props[$kk]);
		}
		//echo "<pre>"; print_r($nm);echo "</pre>";
		
		//тут доделать не успел - можно еще прикрутить id форме или диваку и аяксом подгружать новый вид формы сзатемненными неактивными чекбоксами, если кликаем какой-то из чекбоксов
	    echo "<form action='index.php'>";
	    echo "<h2>Поиск по каталогу</h2>";
	    echo "<div><input name='go' type='hidden' value='1' /></div>";
	    echo "<div><input type='text' name='key' value='".$key."' size='50' placeholder='поисковый запрос'  /></div>";
	    echo "<br />";
	    if(isset($nm) && !empty($nm))
	    {
	    	echo "<blockquote>";
	    	foreach($nm as $key=>$val)
	    	{
	    		if(isset($val['name']) && !empty($val['name']))
	    		{
	    			echo "<div>".$val['name']."</div>";
	    		}
	    		echo "<div><blockquote>";
	    		foreach($val as $kk=>$vv)
	    		{
	    			if(is_numeric($kk) && isset($vv['prop_id']) && isset($vv['val']) && !empty($vv['prop_id']) && !empty($vv['val']))
	    			{
	    				$check = "";
	    				if(isset($_GET['prop_id_'.$vv['prop_id']]) &&  $_GET['prop_id_'.$vv['prop_id']]=="on")
	    				{
	    					$check = "checked";
	    				}
	    				
	    				echo "<input type='checkbox' id='prop_id_".$vv['prop_id']."' name='prop_id_".$vv['prop_id']."' ".$check."><lable for='prop_id_".$vv['prop_id']."'>".$vv['val']."</label>&nbsp;&nbsp;&nbsp;&nbsp;";
	    			}
	    		};
	    		echo "</blockquote></div>";
	    	};
	    	echo "</blockquote>";
	    }
	    echo "<div><input type='submit' value='Искать!' /></div>";
	    echo "</form>";
	}


	function search_res() 
	{
		$Dbconn = new Dbconn();
		
		
		//здесь доделать не успеваю, но как-то примерно так
		/*if(isset($_GET))
		{
			$props_mass = "";
			print_r($_GET);
			foreach($_GET as $p=>$u)
			{
				if(strpos($p, "prop_id"))
				{
					//тут еще условие будет чтобы запятую лишнюю не ставить вконце
					$props_mass .= $u.", ";
				}
			};
		}*/
		
		//дальше скуль
		$sql = array();
		$sql['SELECT'] = array(
			'products.id',
			'products.name AS name',
			'prices.price',
			'hars_harvals.har_id',
			'hars_harvals.harval_id',
			'hars.name as prop_name',
			'harvals.val'
		);
		$sql['FROM'] = array(
			'products'
		);
		
		//здесь доделать не успеваю, но как-то примерно так
		/*if(isset($props_mass) && !empty($props_mass))
		{
			$sql['JOIN']['INNER'] = array(
				'prices ON prices.product_id = products.id',
				'hars_harvals ON hars_harvals.product_id = products.id',
				'hars ON hars.id = hars_harvals.har_id',
				'harvals ON harvals.id = hars_harvals.harval_id'
			);
			//наверное как-то так должно выглядеть - не успел потестить
			$sql['WHERE'][] = 'harval_id IN ('.$props_mass.')';
		}else
		{*/
			$sql['JOIN']['LEFT'] = array(
				'prices ON prices.product_id = products.id',
				'hars_harvals ON hars_harvals.product_id = products.id',
				'hars ON hars.id = hars_harvals.har_id',
				'harvals ON harvals.id = hars_harvals.harval_id'
			);
			
		//}
		
		$sql['WHERE'][] = 'products.is_active = 1';
		if(isset($_GET['key']) && !empty($_GET['key']))
		{
			$sql['WHERE'][] = 'AND products.name LIKE "%'.$_GET['key'].'%"';
		}
		
		$sql['ORDER BY'] = array(
			'products.id'
		);
		
		/*
		//вот так в итоге запрос будет выглядеть после генерации функцией из массива выше
		$sql = "
		SELECT 
			products.id,
			products.name AS name,
			prices.price,
			hars_harvals.har_id,
			hars_harvals.harval_id,
			hars.name as prop_name,
			harvals.val
		FROM 
			products
		LEFT JOIN 
			prices ON prices.product_id = products.id
		LEFT JOIN 
			hars_harvals ON hars_harvals.product_id = products.id
		LEFT JOIN 
			hars ON hars.id = hars_harvals.har_id
		LEFT JOIN 
			harvals ON harvals.id = hars_harvals.harval_id
		WHERE
			products.is_active = 1
		ORDER BY
			products.id
		";*/
		
		$result = $Dbconn->query($sql);
		$err = $Dbconn->error();
		if($err)
		{
			echo "<pre>"; print_r($err); echo "</pre>";
		}
		//echo "<pre>"; print_r($result); echo "</pre>";
		
		$nm = array();
		
		foreach($result as $kk=>$vv)
		{
			$nm[$result[$kk]['id']]['name'] = $result[$kk]['name'];
			$nm[$result[$kk]['id']]['price'] = $result[$kk]['price'];
			$nm[$result[$kk]['id']][$kk]['har_id'] = $result[$kk]['har_id'];
			$nm[$result[$kk]['id']][$kk]['harval_id'] = $result[$kk]['harval_id'];
			$nm[$result[$kk]['id']][$kk]['prop_name'] = $result[$kk]['prop_name'];
			$nm[$result[$kk]['id']][$kk]['val'] = $result[$kk]['val'];
			unset($result[$kk]);
		}
		echo "<pre>"; print_r($nm);echo "</pre>";
	}


}
?>