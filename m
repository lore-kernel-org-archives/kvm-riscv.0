Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD21606A31C
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 11:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lvlXorjV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=oBhDmiPB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0enw2ffMBNEMzpLBSdmSmO6mAp/8bciEYzbO9pr2RI8=; b=lvlXorjVwyHBZ9+dXP0klpVOR0
	PW+x9MUg0+9zKAjCHTBr8ftj9tYUJBpDeU8uVtiC0fv4QkqHM8u3hCdOPYakeFt1fdcQHHJCY8oVe
	lXQe3O8vt5zcS/OfX5pjjvWsus/4rVrCIqq8BE8GwC6eki+LJopjADD9Eahvg1vvY92filqO8YgYx
	rgeAj2y3GRKrLW74eMI/AzbnkLnDc+8wjHDXia+JyEMuo8dKx9vZb4JwBq9x5JS8K+X19U2AS8axG
	fPrLv7We1Z659ZgqwGz838h0z48gmf21uqCFSbqY4LU4/VjQFeGEAPDbx5e/1ocdvjT32wUvgftkf
	7j1O32/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRppd-0000000CaiC-3S7b;
	Fri, 13 Nov 2026 11:52:37 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRppc-0000000Cah6-01fh
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 11:52:37 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-491aaed7565so338977f8f.2
        for <kvm-riscv@lists.infradead.org>; Fri, 13 Nov 2026 03:52:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794570754; cv=none;
        d=google.com; s=arc-20260327;
        b=DrwavRnbTorhOmynbFWmsUEPtrlYy9xoNBgsFVAUUHMwSNmKqhyClZAtlUXhbIIX3s
         GLcV6uUoLLUgG8U6fEUgaLrKLfNwl6YPH0RPPmjvSOEz9R/DFSYkTmdQQ6PHoSgVCYp6
         +a5e6lbT0ioDnCbUeIzgSULjw8LiLs41GiDPyhZFSrsXa66Y7qLgZf1jGvyHXBXE6diE
         Yc4ATsNAZoQch4wdsbmHkGfgPAgRjAU/y0EooZ77oTqCOn8D/phRccNozH12boRmu637
         jTpXUqsteOLkLezN2YOplCawZ/XhES0eq/bVvtjvVU0YtthQf3oA8PMzv04EDH7eR9GD
         4TWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rFJV8f4SaM77hiC2RgsHSVyvllFeY8X5U8hH/4aH3VM=;
        fh=5DcW4PUv4xsustg0pIu+zwBmWvlvjCpOie4ZLCtx88s=;
        b=FP/Z+LB0GSWQ9y6/u0Ydj22cahQl7dauPkqwvSX80I/JTIkeZHgNWb3piZFYhMXg2C
         gvg/smiKz7Ab9OpBZqNTng6nVnOryKVxLggKkny0sKpFzX9dIJ5/DKtZGSvdi988/FDq
         TVzKo3PCS5/xXDg2dMHqVpR8T64TzmRqJNDCqtXKg1VwxrrpXq6vd59jKJwXKJqWj66f
         aOTn1iatEkZbtByZPJjsTQ1eO3/NqaM9QzHjfKyf+PXK+5jzFmEUC9thHcrRyKE/bU7d
         qF+cHWc3irvighKLI7CI2iZYrngy16r3T0elX8IrM74GHFskMQAM/XCUz0ZRksl2LwZC
         romA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794570754; x=1795175554; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rFJV8f4SaM77hiC2RgsHSVyvllFeY8X5U8hH/4aH3VM=;
        b=oBhDmiPBtujkXfgBwMfgYzP7zsHj1MbQtldwMJqTXXMBKn10P99CVm7xchQelBAcwH
         apXUtV+WHwDOeWI2BtDGMo2AiyyHpamAsp3uG+7SzmhFf3YdGzgUqTTeihJFbL0Zh93o
         b/a6NioDY2W6jQe6/k43kuM38MAufNtfSpaOA4uWxKPpJ62RRwAQ8H+45b0cthf0K4W5
         klYTswRHbO6XklFWpco2C7mo1Jhkffqxy30RqyQ9RYgl6zx7cYR5ILxXgdzleGG4awLR
         p6Q4q6x+HMU/hq9L149kZAKHnpfGUm/Zy7TP8fAc14dehs2JxtDNT2cSueNNP0wX9bQQ
         YL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794570754; x=1795175554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFJV8f4SaM77hiC2RgsHSVyvllFeY8X5U8hH/4aH3VM=;
        b=VhTHvDNkCn/fTqI+OelVJ0m0UoCal7T+jmQ12XMhcA65TZOC7n/iVP12/ThuyqhxJ8
         JnOlnZizIiVCawkIcoEldOcC5SHo2rO5A7VceuZPdeJfVq2MWsuLm7t0hJUxpthR4wrT
         d+2OFS9HcwdsYQGAt157+Ev1f+lfU0DPh4LxB6WzI4eJ+WZgafe5tCaNDHemgp5S0o5l
         D7SUPyVyZ0kJFqpSjb9dNv235/pxiPUS3LYLSygaQZJgwr0pwZxEH7/U2xPZ8Y+SZvMM
         33WtDDPRuZfsGtl18p4xdwu/rpVUFcNhVMec2b+NeMB6JzXm7cy5BL5T31sh/Xa/vX8N
         F9ZA==
X-Forwarded-Encrypted: i=1; AL+hErGp2YbZupVh+9d1U06S9e9voxwxNprmAGjrQeWkvZGuXHzD0PrtsBkDb3Xbq1rY9wXbpoj2QK8fmsk=@lists.infradead.org
X-Gm-Message-State: APuU4Z/f5dq76Q72TJKGKMqyR68yylDcMueBLlNi50FPj0J/M1W5fuYm
	nrx77aTN1nZIZsHgybradSD9jjb9tOnHj7eHYIPpqDp3qbuHsRPYiLfU2KPNB3TqrfJlLJDKM/G
	HTW5EpVjwRmM6t8NEYfCY2h6eig67VtgBSuQnlY+LQhAnuR4e40vP
X-Gm-Gg: AYBFou10Ag6lug4Fkfh/VW8waOBEgKegxWKVCstqkqqMyUyRuPmVsHNjRVWPt+ROHfa
	Vl1Prp3bqLJv8jwQR2ixqm3Ise0+rGQ+uM6Ccg8gW7DxKP8jNQ1Nirk8SYv/aB8Is5q9keteavp
	7GHhzscouE/ZqInzICcMF6LWgPJaSTggrFbBVkQ6L6mTnpTGm8JMaQmWcNJeGojlazzdjZOcyDY
	DMS40XlRiLQiQKGB8OdGvcF+uJ0wt649yg83wlH43JfM4kmkMNRnyCJ+QAleVqgLG1BHJc/Rsy1
	ix7zZyg4rgm/4HtqC3+/oLxRvSQAjKJ3AkeRbPEF+DgtX1vRhXdvOrTEfNOW8YaiB//J8zT7Fd2
	JkZD05TMwzj6ZageZRNz7ivFD5OCGAbOQvDmMqudvHgPci6Woo4WoKRgXmO3c2o+rcMBv6gkBs4
	CqKH0RtCq2WccIxGYn3aJ7DXBTKgdwoF2jew1+1wJydYAL4je5hweo+YY=
X-Received: by 2002:a05:6000:27c6:b0:497:9e2a:b27 with SMTP id
 ffacd0b85a97d-49c72e85cdcmr3456559f8f.38.1794570754020; Fri, 13 Nov 2026
 03:52:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019144304.2678066-1-andrew.jones@linux.dev>
In-Reply-To: <20261019144304.2678066-1-andrew.jones@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Nov 2026 17:22:22 +0530
X-Gm-Features: AclHuK_B-tIZNaWaX5qAf23plZzHsb0LvkBpo6TqDvhSVaG0Z1182jGHh-coKtQ
Message-ID: <CAAhSdy0MhPf9qrBBSJP+3EExmc9vRRe07gdHHv2JSYnOmWRvkw@mail.gmail.com>
Subject: Re: [PATCH kvmtool] riscv: Place the FDT after the kernel's image_size
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, will@kernel.org, julien.thierry.kdev@gmail.com, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_035236_101539_E16504F5 
X-CRM114-Status: GOOD (  24.89  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBPY3QgMTksIDIwMjYgYXQgODoxM+KAr1BNIEFuZHJldyBKb25lcyA8YW5kcmV3Lmpv
bmVzQGxpbnV4LmRldj4gd3JvdGU6Cj4KPiBUaGUgRkRUIGlzIHBsYWNlZCByZWxhdGl2ZSB0byB0
aGUgZW5kIG9mIHRoZSBrZXJuZWwgaW1hZ2UgZmlsZSwgYnV0IGEKPiBrZXJuZWwncyBtZW1vcnkg
Zm9vdHByaW50IGluY2x1ZGVzIGl0cyBCU1MsIHdoaWNoIGlzbid0IGluIHRoZSBmaWxlLiBXaGVu
Cj4gdGhlIEJTUyBpcyBsYXJnZSBlbm91Z2gsIGUuZy4gd2l0aCBsb2NrZGVwIGVuYWJsZWQsIHRo
ZSBGRFQgbGFuZHMgaW5zaWRlCj4gaXQgYW5kIGlzIHdpcGVkIHdoZW4gdGhlIGtlcm5lbCBjbGVh
cnMgQlNTLCBsZWF2aW5nIHRoZSBndWVzdCBodW5nIHdpdGggbm8KPiBjb25zb2xlIG91dHB1dC4g
VXNlIHRoZSBpbWFnZV9zaXplIGZyb20gdGhlIEltYWdlIGhlYWRlciwgYXMgYXJtNjQgZG9lcy4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YW5kcmV3LmpvbmVzQGxpbnV4LmRldj4K
CkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJl
Z2FyZHMsCkFudXAKCj4gLS0tCj4gIHJpc2N2L2luY2x1ZGUvYXNtL2ltYWdlLmggfCA0MCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgcmlzY3Yva3ZtLmMgICAgICAg
ICAgICAgICB8IDI2ICsrKysrKysrKysrKysrKysrKysrKystLS0KPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA2MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
cmlzY3YvaW5jbHVkZS9hc20vaW1hZ2UuaAo+Cj4gZGlmZiAtLWdpdCBhL3Jpc2N2L2luY2x1ZGUv
YXNtL2ltYWdlLmggYi9yaXNjdi9pbmNsdWRlL2FzbS9pbWFnZS5oCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjBkZWI3NGRkZDlkNAo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9yaXNjdi9pbmNsdWRlL2FzbS9pbWFnZS5oCj4gQEAgLTAsMCArMSw0MCBAQAo+ICsv
KiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLwo+ICsKPiArI2lmbmRlZiBfX0FT
TV9JTUFHRV9ICj4gKyNkZWZpbmUgX19BU01fSU1BR0VfSAo+ICsKPiArI2RlZmluZSBSSVNDVl9J
TUFHRV9NQUdJQyAgICAgICJSSVNDVlwwXDBcMCIKPiArI2RlZmluZSBSSVNDVl9JTUFHRV9NQUdJ
QzIgICAgICJSU0NceDA1Igo+ICsKPiArLyoKPiArICogc3RydWN0IHJpc2N2X2ltYWdlX2hlYWRl
ciAtIHJpc2N2IGtlcm5lbCBpbWFnZSBoZWFkZXIKPiArICogU2VlIERvY3VtZW50YXRpb24vYXJj
aC9yaXNjdi9ib290LWltYWdlLWhlYWRlci5yc3QgZm9yIGRldGFpbHMKPiArICoKPiArICogQGNv
ZGUwOiAgICAgICAgICAgICBFeGVjdXRhYmxlIGNvZGUKPiArICogQGNvZGUxOiAgICAgICAgICAg
ICBFeGVjdXRhYmxlIGNvZGUKPiArICogQHRleHRfb2Zmc2V0OiAgICAgICBJbWFnZSBsb2FkIG9m
ZnNldCAobGl0dGxlIGVuZGlhbikKPiArICogQGltYWdlX3NpemU6ICAgICAgICAgICAgICAgIEVm
ZmVjdGl2ZSBJbWFnZSBzaXplIChsaXR0bGUgZW5kaWFuKQo+ICsgKiBAZmxhZ3M6ICAgICAgICAg
ICAgIGtlcm5lbCBmbGFncyAobGl0dGxlIGVuZGlhbikKPiArICogQHZlcnNpb246ICAgICAgICAg
ICB2ZXJzaW9uCj4gKyAqIEByZXMxOiAgICAgICAgICAgICAgcmVzZXJ2ZWQKPiArICogQHJlczI6
ICAgICAgICAgICAgICByZXNlcnZlZAo+ICsgKiBAbWFnaWM6ICAgICAgICAgICAgIE1hZ2ljIG51
bWJlciAoUklTQy1WIHNwZWNpZmljOyBkZXByZWNhdGVkKQo+ICsgKiBAbWFnaWMyOiAgICAgICAg
ICAgIE1hZ2ljIG51bWJlciAyICh0byBtYXRjaCB0aGUgQVJNNjQgJ21hZ2ljJyBmaWVsZCBwb3Mp
Cj4gKyAqIEByZXMzOiAgICAgICAgICAgICAgcmVzZXJ2ZWQgKHdpbGwgYmUgdXNlZCBmb3IgUEUg
Q09GRiBvZmZzZXQpCj4gKyAqLwo+ICsKPiArc3RydWN0IHJpc2N2X2ltYWdlX2hlYWRlciB7Cj4g
KyAgICAgICB1MzIgY29kZTA7Cj4gKyAgICAgICB1MzIgY29kZTE7Cj4gKyAgICAgICBfX2xlNjQg
dGV4dF9vZmZzZXQ7Cj4gKyAgICAgICBfX2xlNjQgaW1hZ2Vfc2l6ZTsKPiArICAgICAgIF9fbGU2
NCBmbGFnczsKPiArICAgICAgIHUzMiB2ZXJzaW9uOwo+ICsgICAgICAgdTMyIHJlczE7Cj4gKyAg
ICAgICB1NjQgcmVzMjsKPiArICAgICAgIHU2NCBtYWdpYzsKPiArICAgICAgIHUzMiBtYWdpYzI7
Cj4gKyAgICAgICB1MzIgcmVzMzsKPiArfTsKPiArCj4gKyNlbmRpZiAvKiBfX0FTTV9JTUFHRV9I
ICovCj4gZGlmZiAtLWdpdCBhL3Jpc2N2L2t2bS5jIGIvcmlzY3Yva3ZtLmMKPiBpbmRleCAxZDQ5
NDc5MmRlNzkuLmZjMTkyYWYzNDQzNSAxMDA2NDQKPiAtLS0gYS9yaXNjdi9rdm0uYwo+ICsrKyBi
L3Jpc2N2L2t2bS5jCj4gQEAgLTQsOSArNCwxMSBAQAo+ICAjaW5jbHVkZSAia3ZtL3ZpcnRpby1j
b25zb2xlLmgiCj4gICNpbmNsdWRlICJrdm0vZmR0LmgiCj4KPiArI2luY2x1ZGUgPGxpbnV4L2J5
dGVvcmRlci5oPgo+ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gICNpbmNsdWRlIDxsaW51
eC9rdm0uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NpemVzLmg+Cj4gKyNpbmNsdWRlIDxhc20vaW1h
Z2UuaD4KPgo+ICBzdHJ1Y3Qga3ZtX2V4dCBrdm1fcmVxX2V4dFtdID0gewo+ICAgICAgICAgeyBE
RUZJTkVfS1ZNX0VYVChLVk1fQ0FQX09ORV9SRUcpIH0sCj4gQEAgLTEwMCw2ICsxMDIsMjIgQEAg
dm9pZCBrdm1fX2FyY2hfaW5pdChzdHJ1Y3Qga3ZtICprdm0pCj4gICAgICAgICByaXNjdl9faXJx
Y2hpcF9jcmVhdGUoa3ZtKTsKPiAgfQo+Cj4gKy8qCj4gKyAqIFRoZSBrZXJuZWwncyBtZW1vcnkg
Zm9vdHByaW50LCBpbmNsdWRpbmcgQlNTLCBpcyB0aGUgaW1hZ2Vfc2l6ZSBpbiB0aGUKPiArICog
SW1hZ2UgaGVhZGVyLCB3aGljaCBtYXkgYmUgbGFyZ2VyIHRoYW4gdGhlIGZpbGUuCj4gKyAqLwo+
ICtzdGF0aWMgdTY0IGt2bV9fYXJjaF9nZXRfa2VybmVsX3NpemUodm9pZCAqa2VybmVsLCBzc2l6
ZV90IGZpbGVfc2l6ZSkKPiArewo+ICsgICAgICAgc3RydWN0IHJpc2N2X2ltYWdlX2hlYWRlciAq
aGRyID0ga2VybmVsOwo+ICsKPiArICAgICAgIGlmICgoc2l6ZV90KWZpbGVfc2l6ZSA8IHNpemVv
ZigqaGRyKSB8fAo+ICsgICAgICAgICAgIChtZW1jbXAoJmhkci0+bWFnaWMyLCBSSVNDVl9JTUFH
RV9NQUdJQzIsIHNpemVvZihoZHItPm1hZ2ljMikpICYmCj4gKyAgICAgICAgICAgIG1lbWNtcCgm
aGRyLT5tYWdpYywgUklTQ1ZfSU1BR0VfTUFHSUMsIHNpemVvZihoZHItPm1hZ2ljKSkpKQo+ICsg
ICAgICAgICAgICAgICByZXR1cm4gZmlsZV9zaXplOwo+ICsKPiArICAgICAgIHJldHVybiBtYXhf
dCh1NjQsIGxlNjRfdG9fY3B1KGhkci0+aW1hZ2Vfc2l6ZSksIGZpbGVfc2l6ZSk7Cj4gK30KPiAr
Cj4gICNkZWZpbmUgRkRUX0FMSUdOICAgICAgU1pfNE0KPiAgI2RlZmluZSBJTklUUkRfQUxJR04g
ICA4Cj4gIGJvb2wga3ZtX19hcmNoX2xvYWRfa2VybmVsX2ltYWdlKHN0cnVjdCBrdm0gKmt2bSwg
aW50IGZkX2tlcm5lbCwgaW50IGZkX2luaXRyZCwKPiBAQCAtMTA4LDYgKzEyNiw3IEBAIGJvb2wg
a3ZtX19hcmNoX2xvYWRfa2VybmVsX2ltYWdlKHN0cnVjdCBrdm0gKmt2bSwgaW50IGZkX2tlcm5l
bCwgaW50IGZkX2luaXRyZCwKPiAgICAgICAgIHZvaWQgKnBvcywgKmtlcm5lbF9lbmQsICpsaW1p
dDsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgZ3Vlc3RfYWRkciwga2VybmVsX29mZnNldDsKPiAg
ICAgICAgIHNzaXplX3QgZmlsZV9zaXplOwo+ICsgICAgICAgdTY0IGtlcm5lbF9zaXplOwo+Cj4g
ICAgICAgICAvKgo+ICAgICAgICAgICogTGludXggcmVxdWlyZXMgdGhlIGluaXRyZCBhbmQgZHRi
IHRvIGJlIG1hcHBlZCBpbnNpZGUgbG93bWVtLAo+IEBAIC0xMzIsOSArMTUxLDEwIEBAIGJvb2wg
a3ZtX19hcmNoX2xvYWRfa2VybmVsX2ltYWdlKHN0cnVjdCBrdm0gKmt2bSwgaW50IGZkX2tlcm5l
bCwgaW50IGZkX2luaXRyZCwKPgo+ICAgICAgICAgICAgICAgICBkaWVfcGVycm9yKCJrZXJuZWwg
cmVhZCIpOwo+ICAgICAgICAgfQo+IC0gICAgICAga2VybmVsX2VuZCA9IHBvcyArIGZpbGVfc2l6
ZTsKPiAtICAgICAgIHByX2RlYnVnKCJMb2FkZWQga2VybmVsIHRvIDB4JWxseCAoJXpkIGJ5dGVz
KSIsCj4gLSAgICAgICAgICAgICAgICBrdm0tPmFyY2gua2Vybl9ndWVzdF9zdGFydCwgZmlsZV9z
aXplKTsKPiArICAgICAgIGtlcm5lbF9zaXplID0ga3ZtX19hcmNoX2dldF9rZXJuZWxfc2l6ZShw
b3MsIGZpbGVfc2l6ZSk7Cj4gKyAgICAgICBrZXJuZWxfZW5kID0gcG9zICsga2VybmVsX3NpemU7
Cj4gKyAgICAgICBwcl9kZWJ1ZygiTG9hZGVkIGtlcm5lbCB0byAweCVsbHggKCV6ZCBieXRlcywg
JWxsdSBpbiBtZW1vcnkpIiwKPiArICAgICAgICAgICAgICAgIGt2bS0+YXJjaC5rZXJuX2d1ZXN0
X3N0YXJ0LCBmaWxlX3NpemUsIGtlcm5lbF9zaXplKTsKPgo+ICAgICAgICAgLyogUGxhY2UgRkRU
IGp1c3QgYWZ0ZXIga2VybmVsIGF0IEZEVF9BTElHTiBhZGRyZXNzICovCj4gICAgICAgICBwb3Mg
PSBrZXJuZWxfZW5kICsgRkRUX0FMSUdOOwo+IC0tCj4gMi41Ni4wCj4KCi0tIAprdm0tcmlzY3Yg
bWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
