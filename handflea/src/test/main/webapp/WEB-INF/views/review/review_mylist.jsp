<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>list</title>
</head>
    <div class="myList">
        <table border="1" summary="">
        <h3>내가 작성한 후기</h3>
        <colgroup module="board_listheader_[seq]">
            <col style="width:70px;" />
            <col style="width:134px;" />
            <col style="width:135px;" class="{$config.is_category|display}" />
            <col style="width:auto;" />
            <col style="width:84px;" />
            <col style="width:80px;" class="{$config.use_date|display}" />
            <col style="width:55px;" class="{$config.use_cnt|display}" />
            <col style="width:55px;" class="{$config.is_use_recom|display}" />
            <col style="width:80px;" class="{$config.is_use_point|display}" />
        </colgroup>
        <thead module="board_listheader_[seq]">
            <tr style="{$list_bg_color} {$list_char_color}">
              <th scope="col" class="thumb">상품정보</th>
                <th scope="col">후기</th>
              <th scope="col" class="{$config.use_date|display}">작성일</th>
                <th scope="col">별점</th>
            </tr>
        </thead>
        <tbody module="board_notice_[seq]" class="notice">

            <tr style="{$list_bg_color} {$list_char_color}">
                <td class="thumb"><a href="/product/detail.html{$param_product}">{$product_img}<span>{$product_name}</span></a></td>

                <td class="txtLess {$date_display|display}">{$review_contents}</td>
                <td class="txtLess {$date_display|display}">{$write_date}</td>
				<td class="subject">${dto.star_point}</td>
            </tr>
            <tr style="{$list_bg_color} {$list_char_color}">
                <td class="thumb"><a href="/product/detail.html{$param_product}">{$product_img}<span>{$product_name}</span></a></td>
                <td class="txtLess {$date_display|display}">{$review_contents}</td>
				<td class="txtLess {$date_display|display}">{$write_date}</td>
				<td class="subject"></td>

            </tr>
        </tbody>
        <tbody module="board_fixed_[seq]" class="notice">

            <tr style="{$list_bg_color} {$list_char_color}">
                <td class="thumb"><a href="/product/detail.html{$param_product}">{$product_img}<span>{$product_name}</span></a></td>
                <td class="date {$date_display|display}">{$review_contents}</td>
				<td class="txtLess {$date_display|display}">{$write_date}</td>
				<td class="subject"></td>

            </tr>
            <tr style="{$list_bg_color} {$list_char_color}">
                <td class="thumb"><a href="/product/detail.html{$param_product}">{$product_img}<span>{$product_name}</span></a></td>
                <td class="date {$date_display|display}">{$review_contents}</td>
				<td class="txtLess {$date_display|display}">{$write_date}</td>
				<td class="subject"></td>
            </tr>
        </tbody>
        <tbody module="board_list_[seq]">

            <tr style="{$list_bg_color} {$list_char_color}">
                <td class="thumb"><a href="/product/detail.html{$param_product}">{$product_img}<span>{$product_name}</span></a></td>
				<td class="txtLess {$hit_display|display}">{$review_contents}</td>
                <td class="txtLess {$date_display|display}">{$write_date}</td>
				<td class="subject">
                </td>
            </tr>
            <tr style="{$list_bg_color} {$list_char_color}">
                <td class="thumb"><a href="/product/detail.html{$param_product}">{$product_img}<span>{$product_name}</span></a></td>
                <td class="txtLess {$date_display|display}">{$review_contents}</td>
				<td class="txtLess {$date_display|display}">{$write_date}</td>
				<td class="subject"></td>
            </tr>
        </tbody>
        </table>
    </div>
</html>
