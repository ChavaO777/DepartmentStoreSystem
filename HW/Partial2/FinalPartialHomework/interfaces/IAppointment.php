<?php

	interface IAppointment{
		public function get();
		public function getTodaysAppointments();
		public function getAppointmentsInDateRange($prevDate, $nextDate);
		public function deleteProductAppointment();
	    public function save();
	    public function update();
	    public function delete();
	}

?>