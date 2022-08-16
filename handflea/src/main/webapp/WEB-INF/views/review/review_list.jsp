<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>list</title>
</head>
    <div class="myList">
        <table border="1" summary="">
        <h3>상품 후기</h3>
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
                <th scope="col" class="thumb">번호</th>
                <th scope="col">사진/옵션</th>
                <th scope="col" class="{$config.use_date|display}">후기</th>
				<th scope="col">작성자</th>
                <th scope="col" class="{$config.is_use_point|display}">작성일</th>
                <th scope="col">별점</th>				
            </tr>
        </thead>
        <tbody module="board_notice_[seq]" class="notice">

            <tr style="{$list_bg_color} {$list_char_color}">
                <td>{$no}</td>
                <td class="thumb"><a href="/product/detail.html{$param_product}">{$review_photo}<span>{$option_no}</span></a></td>

                <td class="txtLess {$date_display|display}">{$review_contents}</td>
				<td>{$mem_no}</td>
                <td class="txtLess {$date_display|display}">{$write_date}</td>
				<td class="subject">${dto.star_point}</td>
            </tr>
            <tr style="{$list_bg_color} {$list_char_color}">
                <td>{$no}</td>
                <td class="thumb"><a href="/product/detail.html{$param_product}">{$review_photo}<span>{$option_no}</span></a></td>
                <td class="txtLess {$date_display|display}">{$review_contents}</td>
				<td>{$mem_no}</td>
				<td class="txtLess {$date_display|display}">{$write_date}</td>
				<td class="subject"></td>

            </tr>
        </tbody>
        <tbody module="board_fixed_[seq]" class="notice">

            <tr style="{$list_bg_color} {$list_char_color}">
                <td>{$no}</td>
                <td class="thumb"><a href="/product/detail.html{$param_product}">{$review_photo}<span>{$option_no}</span></a></td>
                <td class="date {$date_display|display}">{$review_contents}</td>
				<td>{$mem_no}</td>
				<td class="txtLess {$date_display|display}">{$write_date}</td>
				<td class="subject"></td>

            </tr>
            <tr style="{$list_bg_color} {$list_char_color}">
                <td>{$no}</td>
                <td class="thumb"><a href="/product/detail.html{$param_product}">{$review_photo}<span>{$option_no}</span></a></td>
                <td class="date {$date_display|display}">{$review_contents}</td>
				<td>{$mem_no}</td>
				<td class="txtLess {$date_display|display}">{$write_date}</td>
				<td class="subject"></td>
            </tr>
        </tbody>
        <tbody module="board_list_[seq]">

            <tr style="{$list_bg_color} {$list_char_color}">
                <td>{$no}</td>
                <td class="thumb"><a href="/product/detail.html{$param_product}">{$review_photo}<span>{$option_no}</span></a></td>
				<td class="txtLess {$hit_display|display}">{$review_contents}</td>
				<td>{$mem_no}</td>
                <td class="txtLess {$date_display|display}">{$write_date}</td>
				<td class="subject">
                </td>
            </tr>
            <tr style="{$list_bg_color} {$list_char_color}">
                <td>{$no}</td>
                <td class="thumb"><a href="/product/detail.html{$param_product}">{$review_photo}<span>{$option_no}</span></a></td>
                <td class="txtLess {$date_display|display}">{$review_contents}</td>
				<td>{$mem_no}</td>
				<td class="txtLess {$date_display|display}">{$write_date}</td>
				<td class="subject"></td>
            </tr>
        </tbody>
        </table>
    </div>
</html>
