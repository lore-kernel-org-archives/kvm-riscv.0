Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35B4C54F54
	for <kvm-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 05:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bpYC/5XAn/mIsZYIfZN9ncWgszBTIBRtpRPQxa5Z7a0=; b=fr8Al2AXF64a87
	3u3uvzpsbtsxZ6UNOcoVSSFYv39lEPkUF4C9uWB8WEXjOhtSuJizs0KhzjqnMJ8Q80QMIsiTivsQV
	P22YodMEoUMgBT3d6KXVpCXOh5ffOPjRzqX5dkDcWZ3mxXY/2lxP8XOk9hbva2JKXPZ1IzNyu4o/H
	9mJDriV/mMPkkLtqG2t4cAyGwCxnZTyfmhU/FH15eTFQDBd0A4sAq/o+VhKLVBw+ghH7nhbC7HiGE
	viXiMZdamkjSl5XLpaNEiIOmuvyXMQrAM8kXf1e4MWQ5DEljui6j37invPyWWrXO3ieN60XTw1Kf9
	vMxWtmd/RXYYvtk/Ch3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpg2i-0000000BpF9-1203;
	Fri, 31 Jul 2026 05:44:24 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpg2f-0000000BpEO-1iJN
	for kvm-riscv@lists.infradead.org;
	Fri, 31 Jul 2026 05:44:22 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47640541585so374349f8f.1
        for <kvm-riscv@lists.infradead.org>; Thu, 30 Jul 2026 22:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785476659; cv=none;
        d=google.com; s=arc-20260327;
        b=A8OMIapoRsDgQMXkf7kNVGniiIo6PZv3MgH5yZL2l34B39qjD+c0/ZESFtSTdg9Q0A
         r3pGmUJ8OccwQwhiyCMmBID5LcKrpviKRXETtAKXXFIUA/NOS9l5RSMmyFjUzpm5tiIV
         e4/WswfXmzHK0xJPaJ9tpMYs3vLJo1aYPwhj5w7nKyLuU7DM47DPP1Pl6XEBqXpn1kJm
         k3rEXZgjMo/4Aj2mM9qrQjOlDYMqSvFeRGiQELacSr1Qk00YRkkjsksIAlek0dK/kKf7
         8A5mcRVJtK5VwTyEZswqtd3b0PMKozjJ5L0CtE5cqJSjFTVHvFNoSNTJIKyvOeEbtxYJ
         ALhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tyufRcDXkH7OGX3Tp/WXvppb4b1akynKEKRhP9itFK4=;
        fh=WeQBJFKb8Tu/sn6pG7+7GpJg1p8EfZXI0+X2sPwTwUE=;
        b=aaQQJ4syYMU5pUAKFakqwQPcRIzU7UuQtqv2rC3W9k4bXprNw5LmpfI1Yyuaqoi2+F
         yENIQ616pLjOV24zJIPDlsD26eyBpkqHVGUpwEXb04k4tKhs7j9sFwUIjYBDMxsOiMib
         8KBFSdKfttsnyg0EJSt0f8YnL8a23FjcnItT7xRkQd3NBX/7LXyienXP//o4tyycXUsu
         bslWriyDfrT7ejiqQxmB1od/Per+f13pXlITW7JThz+jKJYYl7CxJsz+WgrK6cAt9LBZ
         qmf/0ysMFwoE9Huq+FXRRjUYvCHdgErtCV9lusNrI7azhVQOeHLfa9AUypI/+9xMT0gk
         xY+w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785476659; x=1786081459; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tyufRcDXkH7OGX3Tp/WXvppb4b1akynKEKRhP9itFK4=;
        b=cz4hiAowNTZ7STjrhxkgABeUZkHF7a6/vP/bLzNhv5YTAl5f4v29Yo7cdriYWDnwmv
         fuPCH8VwzQ+zUu7yvNYJf0MFS3qhIIaVq8go/oGW/5vwnfLGiLPa/9ADwF3odyzed5+s
         r+CeCOSDiHv1LF4F8cV3Bq5vZhyLBVpbQtsbfer6LK5BxihWPbsVxxG50+Aj5S5ul2uN
         ilTDn7miBOUf0eeWcgCc0h1m/sbEkmcFa4T0BbKcfcc5JvIQ2vQ1mjulqcO93UnTohjA
         7PQd0TyNZ0XiUXkqqbv19q6T8j7P7tC113aXPDpcKy1CMwzgeVCDvbO7JN3e4etNXwXn
         gEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785476659; x=1786081459;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tyufRcDXkH7OGX3Tp/WXvppb4b1akynKEKRhP9itFK4=;
        b=fnUIvcEORKboxXVOV0VHKsUWaW6n5M2nej4C71t1SaQ840bw+C3A0VBauD+G8oOI63
         efKWt39y/dfUsyTjqVmyGoCl4oRk0Q3mahRNLwZIl/oSnHq27fty0FzS75xBJXOLyYt3
         ghCahBqD6WpkXGQ/GbXvx+I604tkUx4ug1OwdbgvK7sEP/VFKRvNMmlOXlkm1DC9zRi6
         0K6p7uhmWANiGYRa9J7Ty3SVAlWwhKjhtJEdFsAT3lrcmcK91nGw4gb7mMNt5JJpgpQl
         QW7KiBK2b4jlJ0yf+jsJLfKt3kUOXGZxDQtyhVlzgNeMgUxTqlgVdoY+/mBD9/8ml+Ks
         udVQ==
X-Forwarded-Encrypted: i=1; AHgh+RpR3/fLZkvAlOUUywcH1k0uB+bpnyi4CBmrC11aS4xiGXtFk7QO19HRiXn8v9Z8sxIol0aCzf/dOLw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyTuR3wAXXa9O+6sYffiFx0l8T6cmW8sGfWuIJSkz+MAPQiq9AJ
	7YGiZQKOBYoZll/6oVssPaiDQOVzwcrqUHl7ncHhZy7c3FH3SElFUi8WgUiS/m0aJySm93qEWl9
	33ZhWvHT0wmxlJbz7EQKS6sfoSvSeWOsMnzl3Gr8TXg==
X-Gm-Gg: AR+sD13A3P1sYyXG1AaK+waHP07zN1ZQZYwdlD7Im0kLTEm+nx7vqu0dCTaRNG/tWKT
	qKZuINUFzQ7GZzoaW9kwjqS1ugTgMUtJV65j0wH4QKdXHWtBKXnv4kH/kPcNRLbOtvDnYuCJt4X
	h9OnXhlPotuy/jIRKXPw1KlRUn5uz84dMZqxL5RDaJLg784OedDTVuQtxQ/oTnMxA/COMq3uEZr
	otx7q/df3HAMHG7Hg8G89MsM51MyyJYih27UYe57O+mbfY0Bswfot/isq4/RTgu5kayBdI1V01V
	ETet/HuTRwHTPhKacZhVD590h1qmpXs6cLrDeXplt0LSa5XJtOJJLLE9yNOUsU9OoLcUCoGpiEo
	Yt5rjwKsBpUfiiapebcOE7BrKmiYmprtZ4Npv2glgfqRbgRLQWPIcK73D+SmzPi4=
X-Received: by 2002:a05:6000:2212:b0:47f:8e50:93e0 with SMTP id
 ffacd0b85a97d-47fd2b328efmr1580964f8f.39.1785476659463; Thu, 30 Jul 2026
 22:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260701120954.129873-1-wang.yechao255@zte.com.cn> <20260701120954.129873-4-wang.yechao255@zte.com.cn>
In-Reply-To: <20260701120954.129873-4-wang.yechao255@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 31 Jul 2026 11:14:08 +0530
X-Gm-Features: AUfX_myKDnYmDHijHAzG-jJrRvK3vmSuf-KnXv-nXgVsR5qZr7fmqUsH6abxvaI
Message-ID: <CAAhSdy27pUkVYiciMOp6RdcyzNvsEeOXGA5pW43C1oZJZR4W_Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] RISC-V: KVM: Remove redundant TLB flush operations
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_224421_465605_934A9744 
X-CRM114-Status: GOOD (  16.56  )
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

T24gV2VkLCBKdWwgMSwgMjAyNiBhdCA1OjQx4oCvUE0gV2FuZyBZZWNoYW8gPHdhbmcueWVjaGFv
MjU1QHp0ZS5jb20uY24+IHdyb3RlOgo+Cj4gVGhlIGZ1bmN0aW9uIGt2bV9hcmNoX21tdV9lbmFi
bGVfbG9nX2RpcnR5X3B0X21hc2tlZCgpIGlzIGludm9rZWQgZnJvbQo+IHR3byBkaXN0aW5jdCBj
YWxsIHBhdGhzOgo+Cj4ga3ZtX2NsZWFyX2RpcnR5X2xvZ19wcm90ZWN0KCkKPiAgIGt2bV9hcmNo
X21tdV9lbmFibGVfbG9nX2RpcnR5X3B0X21hc2tlZCgpCj4KPiBrdm1fdm1faW9jdGxfcmVzZXRf
ZGlydHlfcGFnZXMoKQo+ICAga3ZtX2RpcnR5X3JpbmdfcmVzZXQoKQo+ICAgICBrdm1fcmVzZXRf
ZGlydHlfZ2ZuKCkKPiAgICAgICAgIGt2bV9hcmNoX21tdV9lbmFibGVfbG9nX2RpcnR5X3B0X21h
c2tlZCgpCj4KPiBJbiBib3RoIHNjZW5hcmlvcywgdGhlIGNhbGxlciBhbHJlYWR5IHBlcmZvcm1z
IGEgcmVtb3RlIFRMQiBmbHVzaCBhZnRlcgo+IGRpcnR5IGxvZ2dpbmcgaXMgZW5hYmxlZCwgc28g
dGhlIFRMQiBmbHVzaCBpbnNpZGUKPiBrdm1fYXJjaF9tbXVfZW5hYmxlX2xvZ19kaXJ0eV9wdF9t
YXNrZWQoKSBpcyB1bm5lY2Vzc2FyeS4gUmVtb3ZlIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogV2Fu
ZyBZZWNoYW8gPHdhbmcueWVjaGFvMjU1QHp0ZS5jb20uY24+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yv
a3ZtL21tdS5jIHwgNiArLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jIGIvYXJj
aC9yaXNjdi9rdm0vbW11LmMKPiBpbmRleCAzNjMyMzhlZmFlZGI0Li4wNTZjMGFiZTI3OGFmIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0v
bW11LmMKPiBAQCAtMTYyLDE0ICsxNjIsMTAgQEAgdm9pZCBrdm1fYXJjaF9tbXVfZW5hYmxlX2xv
Z19kaXJ0eV9wdF9tYXNrZWQoc3RydWN0IGt2bSAqa3ZtLAo+ICAgICAgICAgcGh5c19hZGRyX3Qg
c3RhcnQgPSAoYmFzZV9nZm4gKyAgX19mZnMobWFzaykpIDw8IFBBR0VfU0hJRlQ7Cj4gICAgICAg
ICBwaHlzX2FkZHJfdCBlbmQgPSAoYmFzZV9nZm4gKyBfX2ZscyhtYXNrKSArIDEpIDw8IFBBR0Vf
U0hJRlQ7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX2dzdGFnZSBnc3RhZ2U7Cj4gLSAgICAgICBib29s
IGZsdXNoOwo+Cj4gICAgICAgICBrdm1fcmlzY3ZfZ3N0YWdlX2luaXQoJmdzdGFnZSwga3ZtKTsK
Pgo+IC0gICAgICAgZmx1c2ggPSBrdm1fcmlzY3ZfZ3N0YWdlX3dwX3JhbmdlKCZnc3RhZ2UsIHN0
YXJ0LCBlbmQpOwo+IC0gICAgICAgaWYgKGZsdXNoKQo+IC0gICAgICAgICAgICAgICBrdm1fZmx1
c2hfcmVtb3RlX3RsYnNfcmFuZ2Uoa3ZtLCBzdGFydCA+PiBQQUdFX1NISUZULAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGVuZCAtIHN0YXJ0KSA+PiBQQUdF
X1NISUZUKTsKPiArICAgICAgIGt2bV9yaXNjdl9nc3RhZ2Vfd3BfcmFuZ2UoJmdzdGFnZSwgc3Rh
cnQsIGVuZCk7CgpQbGVhc2UgYWRkIGNvbW1lbnQgaGVyZSB0aGF0IHJlbW90ZSBUTEIgZmx1c2gg
aXMgbm90IG5lZWRlZCBoZXJlCnNpbmNlIGNhbGxlcnMgb2Yga3ZtX2FyY2hfbW11X2VuYWJsZV9s
b2dfZGlydHlfcHRfbWFza2VkKCkgYWxyZWFkeQpkbyBpdC4KCj4gIH0KPgo+ICB2b2lkIGt2bV9h
cmNoX3N5bmNfZGlydHlfbG9nKHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9tZW1vcnlfc2xv
dCAqbWVtc2xvdCkKPiAtLQo+IDIuNDMuNQo+CgpPdGhlcndpc2UsIHRoaXMgbG9va3MgZ29vZCB0
byBtZS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKVGhh
bmtzLApBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2
bS1yaXNjdgo=
