var dayRewardsCheck   = 0;
var daysStart         = 0;
var currentWeek       = "WEEK (1)";

function closeDailyRewards() {
	$("#daypacks").html('');
	dayRewardsCheck   = 0;
    $.post("http://tp-dailyrewards/closeNUI", JSON.stringify({}));
}

$(function() {
	window.addEventListener('message', function(event) {
		var item = event.data;

		if (item.type == "enable_dailyrewards") {
			document.body.style.display = item.enable ? "block" : "none";

			document.getElementById("showloading").style.display="none";
			document.getElementById("enable_dailyrewards").style.display="block";

		}else if (item.type == "enable_loading") {
			document.body.style.display = item.enable ? "block" : "none";

			document.getElementById("enable_dailyrewards").style.display="none";
			document.getElementById("showloading").style.display="block";
		}
		
		else if (item.action === 'refreshData'){
			closeDailyRewards();
		}

		else if (item.action === 'mainData') {
			dayRewardsCheck = item.daysStart;
			daysStart       = item.daysCheck;
			currentWeek     = item.currentWeek;
		}

		else if (item.action === 'addPlayerDetails'){
			$("#left-side").html('');

			currentWeek = currentWeek.replace("WEEK_", "");
			
			$("#left-side").append(
		
				`</div>`+
					`<span id="reward_progress">ㅤCurrent Day: `+ item.day + ` / 28 Days | Week (` + currentWeek + `)ㅤ</span>`+
				`</div>`

			);

		}
		
		else if (item.action === 'addDays'){

			if (dayRewardsCheck >= daysStart) {
				dayRewardsCheck = daysStart;
				$("#daypacks").html('');
			}

			dayRewardsCheck++

			var day_detail = item.day_detail

			var toolTipDescription = "[" + day_detail.title + "] "  + day_detail.description;

			if (item.status == "waiting"){

				$("#daypacks").append(
					`<div id="rewardBox" >`+
					`<div id="day_counter" style="background-color:rgba(0, 0, 0, 0.507);">DAY `+ dayRewardsCheck+`</div>`+

					`<div id=" ">ㅤ</div>`+
					
						`<div id="day_box_det">`+
						`<div id=" ">ㅤ</div>`+
							`<img src="`+ day_detail.image +`" id="reward_box_img">`+

							`<div id="reward_box_claimer" data-tooltip="` + toolTipDescription +`" >`+
								`<i class="fas fa-lock"> LOCKED</i>`+
							`</div>`+
							
						`</div>`+
	
					`</div>`
				);


			}
			else if (item.status == "claimed"){

				$("#daypacks").append(
					`<div id="rewardBox">`+

	
					`<div id="day_counter" style="background-color:rgba(255, 152, 238, 0.417);">DAY `+ dayRewardsCheck+`</div>`+
					`<div id=" ">ㅤ</div>`+
						`<div id="day_box_det">`+
						`<div id=" ">ㅤ</div>`+
							`<img src="`+ day_detail.image +`" id="reward_box_img">`+

							`<div id="reward_box_claimer" data-tooltip="` + toolTipDescription +`" >`+
								`<i class="fa fa-check"> CLAIMED</i>`+
							`</div>`+

						`</div>`+
	
					`</div>`
				);
			}
			
			else if (item.status == "canClaim"){

				$("#daypacks").append(
					`<div id="rewardBox">`+
					`<div id="day_counter" style="background-color:rgba(255, 152, 238, 0.417);">DAY `+ dayRewardsCheck+`</div>`+
					`<div id=" ">ㅤ</div>`+

						`<div id="day_box_det">`+
						`<div id=" ">ㅤ</div>`+
							`<img src="`+ day_detail.image +`" id="reward_box_img">`+

							`<div id="reward_box_canClaim" data-tooltip="` + toolTipDescription +`" day='`+ dayRewardsCheck + `' >`+
								`<i class="fa fa-gift"> RECEIVE</i></i>`+
							`</div>`+

						`</div>`+

					`</div>`
				);
			}
		}

	});

	$("body").on("keyup", function (key) {
		if (key.which == 27){
			closeDailyRewards();
		}
	});

	// CLAIM REWARD
	$("#daypacks").on("click", "#reward_box_canClaim", function() {
		var $button = $(this);
        var $day = $button.attr('day')

		$.post('http://tp-dailyrewards/claimRewards', JSON.stringify({
			day : $day
		}))
		closeDailyRewards();
		return

	});

});


