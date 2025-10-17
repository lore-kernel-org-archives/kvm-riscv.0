Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E67FCCD195
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 07:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RBBmeBfW7CjGLtzD30GoaiZUDG0W2N5vYq3aIwI5na8=; b=UCcHqpNzRWb0cD
	uoGYiVHf3RRDl5nlgZME9iVJ1GFi4Lvtvgk5wNMgMp/L5hLPOOZ6omBhcoEQlUB0j92kM4xrCyj/t
	LWqVqMhVSake117Sl709HPPMEWzwP5lMsUxhKKEyBSOEFw77YeTeLpHiZ6806Ab74/ClKpx1jEVIE
	vS6T/4vgWn5lZUInx+MLLTdXsqvwy500lM/e8xI/hv696NfXLKtk1c4VdOn97p65MthGjxHlFF5KY
	d+uw7to9tiNByIZaxTZQl3QRMRNLHcG8uMY/IncEGRmBGLT6Wre+H1Ri2wQELYXono94VAckYq4XU
	s2gimP5HH5sv6oQfksFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eYU-00000006vlW-0TPI;
	Fri, 17 Oct 2025 07:07:14 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eYR-00000006vkn-1TkE
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 07:07:12 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b62e7221351so1330629a12.1
        for <kvm-riscv@lists.infradead.org>; Fri, 17 Oct 2025 00:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1760684830; x=1761289630; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tBllN1KPXGz1kwWkEqmZXoXM1+36pBPLJkHM98NsOQ=;
        b=UzzGpqPnviQYm27Q/uSxLe1B5cmtBxMaZ4/vjrM92Xj8QQoRPi/88Wtxb3D/6aFVKy
         jh9OXT4BzjsyZdE1i04yImyIyj2CyxyYNp1c0Y9EbPEKyRDEpIxdb6DnANL0jqE3GneQ
         mmWGqx6BgahscB7tN2f0bG9wDGk/wtsr2s2EYrffQpQbZZwWxMBqLMT3K9CtmvaOtahh
         1jxtODU5DWCsn7UzEAgCidDDSyLjtl+9bEytpCsOrNOTf+FTxqhMTOqOixdxQj/0gw0w
         tf47Ym5nP4PKNyvqeRL9rOC8hJCl/PQEXCRrUdu1strBNUl9BgA2+j99msd3u939onXK
         Hi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760684830; x=1761289630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1tBllN1KPXGz1kwWkEqmZXoXM1+36pBPLJkHM98NsOQ=;
        b=wqjZZOFuA1/LVWmzi1pgJ3lFkdFXMh7m/d2ZWpQTxW0oG+QTm6zhM5SIDJH3iTTAJL
         CY7KIl6kitz3HcLJzm/F89R4qOqWLtOhnYCY3RAnByPvr+Weu+g6e+A8scn8OpruXk+0
         rHal8c3XXjp0XiuSXCMrYUJSGMX1RzJaLa1IPLURDu/j1sWt0nS3mCvhphSkp9iFzJsT
         pINFlReeG31VEZ7VYta0g2OArasDH1ffNwUSAdPA8mopCOIHM3Gh+0QsL9BJCzlCf32W
         ycKVFXjf/+XYchUpxT+rqXb4gd3JQgM/89QHBY9KmOgiYxl4SjRoedb/2hcMvmnoLz+4
         sX8g==
X-Forwarded-Encrypted: i=1; AJvYcCWkR3PI2EwCwOqRi9tZzhWTMcZbStcFzhU205KLA4iiJVgxgF9aQGcFTsiWzlnW5c64eoCs6R9qUkM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy2ATahSDGlZIwe6nlqSR5NipqDmixAAey7+EAYick5lf3KddN
	Tb2rIvNJL2iS2AaMTjJds8yhhQhadTMbGWJCsUUsU5Bo7kJGdnG4zkI5tkckVjA5DzrOaQ/jYdd
	i/QRET44/3H42hFzORYiq5JcnqcMcwRlQCX9qlGz6cZZFn36GLdJa
X-Gm-Gg: ASbGncsjK6HIosgODrxhicf7EvAvsxXQrk7E5GDc0Ld+d5bwjpMI9b62ljHBHxMrlAJ
	CvVoi31qjbYml7THIUVZ2LlMS76CFKsaYU75kkv1Oqm32c/SLsRgd14N6WoTnyE9XGJPFUpzPJ2
	eY0jJIya/LZOYgMr1yDHMxcwtDKAqXzUB1H1u0IM7+vd42M8nrfGNS2NjIyhxoIphmfO+66PqVx
	PP8/N9Yh9xbiAQU49Pgw4vcQ7T9EdzFoD1yIsVwk1tBvc8KorOsfJNEzJirTGnEsq7Vc+YhVYd8
	6jBNXDj3As2HtKlgy1OSgjWivS27
X-Google-Smtp-Source: AGHT+IFCshVxKTQarSYu+mbLMq9+cdps146TZixf/9pY/HK3AnNs9jHylKnsUq6JcPr+g9YcoZphbOzJ+VMIjriDxuQ=
X-Received: by 2002:a05:6e02:3e04:b0:430:c394:15a3 with SMTP id
 e9e14a558f8ab-430c528d628mr41557595ab.22.1760684336325; Thu, 16 Oct 2025
 23:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251016012659.82998-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20251016012659.82998-1-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Oct 2025 12:28:44 +0530
X-Gm-Features: AS18NWDRRpVn-G-IgqIpz7eW2arnxdgcUvLxINosb7XYvEXa1letznEamlVSgow
Message-ID: <CAAhSdy2UcmoPLF0CGBrsF1bRdJe-X05YA7UQOVffxBjZTourMA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Read HGEIP CSR on the correct cpu
To: fangyu.yu@linux.alibaba.com
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com, 
	guoren@kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_000711_384224_7AEDE876 
X-CRM114-Status: GOOD (  18.53  )
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

T24gVGh1LCBPY3QgMTYsIDIwMjUgYXQgNjo1N+KAr0FNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+Cj4KPiBXaGVuIGV4ZWN1dGluZyBrdm1fcmlzY3ZfdmNwdV9haWFfaGFzX2ludGVycnVw
dHMsIHRoZSB2Q1BVIG1heSBoYXZlCj4gbWlncmF0ZWQgYW5kIHRoZSBJTVNJQyBWUy1maWxlIGhh
dmUgbm90IGJlZW4gdXBkYXRlZCB5ZXQsIGN1cnJlbnRseQo+IHRoZSBIR0VJUCBDU1Igc2hvdWxk
IGJlIHJlYWQgZnJvbSB0aGUgaW1zaWMtPnZzZmlsZV9jcHUgKCB0aGUgcENQVQo+IGJlZm9yZSBt
aWdyYXRpb24gKSB2aWEgb25fZWFjaF9jcHVfbWFzaywgYnV0IHRoaXMgd2lsbCB0cmlnZ2VyIGFu
Cj4gSVBJIGNhbGwgYW5kIHJlcGVhdGVkIElQSSB3aXRoaW4gYSBwZXJpb2Qgb2YgdGltZSBpcyBl
eHBlbnNpdmUgaW4KPiBhIG1hbnktY29yZSBzeXN0ZW1zLgo+Cj4gSnVzdCBsZXQgdGhlIHZDUFUg
ZXhlY3V0ZSBhbmQgdXBkYXRlIHRoZSBjb3JyZWN0IElNU0lDIFZTLWZpbGUgdmlhCj4ga3ZtX3Jp
c2N2X3ZjcHVfYWlhX2ltc2ljX3VwZGF0ZSBtYXkgYmUgYSBzaW1wbGUgc29sdXRpb24uCj4KPiBG
aXhlczogNGNlYzg5ZGI4MGJhICgiUklTQy1WOiBLVk06IE1vdmUgSEdFSVtFfFBdIENTUiBhY2Nl
c3MgdG8gSU1TSUMgdmlydHVhbGl6YXRpb24iKQo+IFNpZ25lZC1vZmYtYnk6IEZhbmd5dSBZdSA8
ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFf
aW1zaWMuYyB8IDggKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMu
YyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gaW5kZXggZmRhMDM0NmYwZWExLi4xNjhj
MDJhZDBhNzggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiArKysg
Yi9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+IEBAIC02ODksOCArNjg5LDEyIEBAIGJvb2wg
a3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX2hhc19pbnRlcnJ1cHQoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1KQo+ICAgICAgICAgICovCj4KPiAgICAgICAgIHJlYWRfbG9ja19pcnFzYXZlKCZpbXNpYy0+
dnNmaWxlX2xvY2ssIGZsYWdzKTsKPiAtICAgICAgIGlmIChpbXNpYy0+dnNmaWxlX2NwdSA+IC0x
KQo+IC0gICAgICAgICAgICAgICByZXQgPSAhIShjc3JfcmVhZChDU1JfSEdFSVApICYgQklUKGlt
c2ljLT52c2ZpbGVfaGdlaSkpOwo+ICsgICAgICAgaWYgKGltc2ljLT52c2ZpbGVfY3B1ID4gLTEp
IHsKPiArICAgICAgICAgICAgICAgaWYgKGltc2ljLT52c2ZpbGVfY3B1ICE9IHNtcF9wcm9jZXNz
b3JfaWQoKSkKCkdvb2QgY2F0Y2ggISEhCgpJIGFncmVlIHdpdGggR3VvIFJlbi4gV2Ugc2hvdWxk
IHVzZSAidmNwdS0+Y3B1IiBvdmVyIGhlcmUKaW5zdGVhZCBvZiBzbXBfcHJvY2Vzc29yX2lkKCku
IEFsc28sIEkgdGhpbmsgd2Ugc2hvdWxkIGFkZApzb21lIGNvbW1lbnRzIGZvciBmdXR1cmUgcmVm
ZXJlbmNlLiBJIHdpbGwgdGFrZSBjYXJlIG9mIHRoaXMKYXQgdGhlIHRpbWUgb2YgbWVyZ2luZyB0
aGlzIHBhdGNoLgoKUXVldWVkIHRoaXMgYXMgZml4ZXMgZm9yIExpbnV4LTYuMTgKClRoYW5rcywK
QW51cAoKPiArICAgICAgICAgICAgICAgICAgICAgICByZXQgPSB0cnVlOwo+ICsgICAgICAgICAg
ICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gISEoY3NyX3JlYWQoQ1NS
X0hHRUlQKSAmIEJJVChpbXNpYy0+dnNmaWxlX2hnZWkpKTsKPiArICAgICAgIH0KPiAgICAgICAg
IHJlYWRfdW5sb2NrX2lycXJlc3RvcmUoJmltc2ljLT52c2ZpbGVfbG9jaywgZmxhZ3MpOwo+Cj4g
ICAgICAgICByZXR1cm4gcmV0Owo+IC0tCj4gMi41MC4xCj4KCi0tIAprdm0tcmlzY3YgbWFpbGlu
ZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
