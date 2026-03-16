Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFFEF53D65
	for <kvm-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 15:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0SS/45KSyvyW1+vv5+8yqZpyG6GRQMqIPOdQEnxYeiQ=; b=zYl0+sgMZd/uWu
	Gp7cYryjkBJaatt0vtyVX93togASTa5cktTIECpGB1jNeVlgQpQcZbOzaGncZ4l2pG92ZMBZ2+CPO
	8BbxL8/GVJ0hyMmA+ua8Y43bs/Umjd/sxvKNOufSpBW0uhBAQPo+z7VpwsdDeI5skrbJl7z9La9xo
	O4ogqaQ1XlqELnMoNC9VFmS0QNi8U1ShFTF8J0BEkJNmAL4m52+TKiMUIy8yzrP4+ejgifz18UXkf
	cS+/ZfxSwTHLTKDZxFFuZXmSkPLS0awZrUsEOXEeyRJA9B/XLF9extjbyzUuaGVSupc6onfoG4O7O
	WTlhgiRQ5pIauMz+ICNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29nr-00000004KRE-0cch;
	Mon, 16 Mar 2026 15:24:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29np-00000004KQa-1CBf
	for kvm-riscv@bombadil.infradead.org;
	Mon, 16 Mar 2026 15:24:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=itDjDNSUH/60tzVJAFo+yyruw+YSC3+dRFoatVaVIZg=; b=eAhJ7NtlW+40yqMJNWcdbeb61V
	DVYsP0dUEYa4oyde3Sy8I5BCwru949LJ00H3zI0lOJwBzgrAeFAp9cb7QoJAvyfI1RLm+YJSRIY2M
	v89Un+z9YMVBkTkJ9jLWktvHxJq7iS1EtIThvLr15wM6xmv2aETrnshAMaUwYriorQ1n0QlPMT6y3
	rrlkTk+SB0HbWz9aRu/eDlEytmtzgasmeejLi8A1rq/HbgsXYOnLi9PHFKPz51bViAemFs/aRcQ/D
	yvAp4jDJSD/iY/ezDK9k6FPdwH2X9GMmJYhtuaJhQgNlmxbNgyR6x0EspSYXAxluFvDTNx/To0Dew
	ED/+naYw==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29nm-000000074Q2-0UjB
	for kvm-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 15:24:20 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-43b43f5990dso714355f8f.2
        for <kvm-riscv@lists.infradead.org>; Mon, 16 Mar 2026 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773674657; x=1774279457; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=itDjDNSUH/60tzVJAFo+yyruw+YSC3+dRFoatVaVIZg=;
        b=eYv/ZJ4dHPN0Gnm1KEzRL3Xi9hYZ5Sq/HzFT2+baXmFypm2IhFSHXlx3ACxhKQnXwA
         78rBdHhCj2DTs4frbZXg6+36xpZLANbd8dA2+giCAWgG4Z8pTciqETE6UMYUx1A7C0x3
         ARfLdeorttlLYuqPCOoK9Xq25jJSpdUkwFPz46FzdqxpQlYa5B74J4mpgPiDf3jIeqgG
         1P0f9TXgNvnhG+/ueTfRqje1zJhe5dYzOTMg9wIHN+OhTKDBxjRmwdwwZWjX7T6cbuLv
         n3RftsEIn1S7jshymyPNLQrJQ7bsu63TGF3CWibxnjD6XdqYLZooLhFgclwi7gEvdUrr
         isGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674657; x=1774279457;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=itDjDNSUH/60tzVJAFo+yyruw+YSC3+dRFoatVaVIZg=;
        b=bdyr5RS0qMSpZXLQJ654eCQRHn5pEp858XYC0ljXobfxKLnOQqL5e5chY8p/nTN5bY
         TOYj8xs0dp9mDnx/wlVhDnjkDQ7Od4IoS5y9SI6UKkFIS/QSxFrPiZ/GSqQuTlXdxDNk
         psIgRAmtxnY6qrp7bi8ywgPwP9I7axIBXBj5Dd/UHgVYMsbTayMDxMPRn1vvTvrwUqOs
         5v/aeRXfkf+K+la65LMUOu+9ysipTNxLD28OxshK8qF+1XAd56GJvx8y1DXSppkvuYHn
         4DTkO31vOQKdNYrOCzZYMMciVy1IaNokqW7JZIwNMzm/QlE7gC9d4vb07uognPR2Vl59
         hOHA==
X-Gm-Message-State: AOJu0Yz+T8l3eCzFQ9h4vtDfV8b+fZUfIMVbfkqmB5iggTKJWfys+lIv
	1KcR0qvBFpfTJdBlf6fsFnQO/xDpXn4fUK7bDzZ7p/IYZnOadky80TNy
X-Gm-Gg: ATEYQzzhN2+2IRoGcxaUkK3TOwtNOKgOQDtqHTZn+yxFhrcnc27Q+YwkZKkAI5nKw+I
	uPsUjkzelRGHAYnciOv+oCIbleGfBQTpgKPnP+VFGxlcv13b5C+CF7c6FUZQ4yAY1VLld9Wtirm
	XqFfaMJUReb2FZQaXHLUURN3UfItHHPq/D1LgOlSEBB33Fg8l5LqCdQeiou0P+QZHjp5EvdEdty
	yYMB83G5nxk2Tgfnj8NgvatkX63JcYG/h3W14+dDElbXcEPAM7ZwXJmdD6a16o8+6UrV/u67G9P
	nL+K9TWy3daUGo7qjXxw51H/uPGwTZ1s9upWyvp54JS7TeeMG8nmgZ6HphjssKJJgltTnoxwShT
	8QqRTlSliSw9JR4ykgfoQF2lT6pyisTeqXcGYbUPlg7NmpQKuPDUA3figOr2UG+pOqipnDk6+ze
	zdR+Lyu7g3w3G6YJL93egjbWvuZ8cBtHBxX2TIT1ReXQvCFT7vY1kI
X-Received: by 2002:a05:6000:310a:b0:439:de1d:74ae with SMTP id ffacd0b85a97d-43a04d868c3mr24898503f8f.22.1773674656451;
        Mon, 16 Mar 2026 08:24:16 -0700 (PDT)
Received: from osama ([41.44.7.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bd9csm42651753f8f.21.2026.03.16.08.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:24:16 -0700 (PDT)
Date: Mon, 16 Mar 2026 16:24:12 +0100
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: kvm: fix vector context allocation leak
Message-ID: <abggnCAb9Py60PBT@osama>
References: <20260314223144.154349-1-osama.abdelkader@gmail.com>
 <19cdcafd-adab-469d-9729-f01e8bcaf543@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <19cdcafd-adab-469d-9729-f01e8bcaf543@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_152418_282151_67175DDF 
X-CRM114-Status: GOOD (  10.59  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMTA6MjM6MjdBTSArMDEwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gPiBXaGVuIHRoZSBzZWNvbmQga3phbGxvYyAoaG9zdF9jb250ZXh0LnZlY3Rvci5k
YXRhcCkgZmFpbHMgaW4KPiA+IGt2bV9yaXNjdl92Y3B1X2FsbG9jX3ZlY3Rvcl9jb250ZXh0LCB0
aGUgZmlyc3QgYWxsb2NhdGlvbgo+ID4gKGd1ZXN0X2NvbnRleHQudmVjdG9yLmRhdGFwKSBpcyBs
ZWFrZWQuIEZyZWUgaXQgYmVmb3JlIHJldHVybmluZy4KPiAKPiBXZXJlIGFueSBzb3VyY2UgY29k
ZSBhbmFseXNpcyB0b29scyBpbnZvbHZlZCBoZXJlPwo+IAoKTm8sIHRoZXJlIHdlcmUgZm91bmQg
ZHVyaW5nIG1hbnVhbCByZXZpZXcuCgo+IAo+IEhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gYWRk
IGFueSB0YWdzIChsaWtlIOKAnEZpeGVz4oCdIGFuZCDigJxDY+KAnSkgYWNjb3JkaW5nbHk/Cj4g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMv
bGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5y
c3Q/aD12Ny4wLXJjNCNuMTQ1Cj4KCkRvbmUsIEkganVzdCBzZW50IHYyLCB0aGFuayB5b3UuCiAK
PiBSZWdhcmRzLAo+IE1hcmt1cwoKQmVzdCByZWdhcmRzLApPc2FtYQoKLS0gCmt2bS1yaXNjdiBt
YWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
