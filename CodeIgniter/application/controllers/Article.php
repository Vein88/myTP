<?PHP
class Article extends MY_Controller {
	public function zan() {
		$callback = $_GET['callback'];
		$ret = array(
			'errno' => 0,
			'data' => 'I am very proud!!!'
		);
		$retJson = json_encode($ret);
		echo $callback . "($retJson)";
		$configDir = $this->mysmarty->getConfigDir();
		print_r($configDir);
	}
}

?>
