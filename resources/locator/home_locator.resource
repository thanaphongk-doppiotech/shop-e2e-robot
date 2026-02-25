*** Variables ***
${home_locator.dti_suggest_item}                css=[data-testid="home-featured-list"] > [data-testid^="home-featured-item-"]
${home_locator.dti_suggest_product_by_index}    css=[data-testid^="home-featured-item-"] >> nth=@#index@#
