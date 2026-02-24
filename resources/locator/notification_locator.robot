*** Variables ***
${notification_locator.txt_notification_message}          css=div[role="status"] > div:has-text("@#string@#")
${notification_locator.btn_close_notification}            css=div[role="status"] > div ~ button >> nth=0
