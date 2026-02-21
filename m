Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD98C61DE4
	for <kvm-riscv@archiver.kernel.org>; Sat, 21 Feb 2026 10:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4DFxVfQ6Unak4JwWafwhKS+fT/E8Nsf+sNF/PWyQUk=; b=HPKI+3dUH3Poa7
	bRwgydT3N8Fzxx54WSMMkX4NuOVbY0mzxCKzvWf0YI/oj5liq/pPacU1NbGXbqNsYM3MAqYJHzjGk
	ediB9E8jNkzKl4SQZbKixdnJfio21CfRzPlWJ9/y6+M3GXBJteZajxRXNVlB/3hGhDbyVab2QOfgE
	xDAemQ9thdWqU02rdbIQX6P3HSSj/2H21zKzdlfN3rXd0G5QBBiEeodJkZRwXlfF8p+IkDuVCgVSx
	j+zks+CyS4PKD4qbbCql6SvJ7mk2KVZZ6tSVLCBirzUTMd6CAEeZ9NoTfcM27ufvbZOaaMuCNATqJ
	AII6aya+paeiWTwqD4/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtkYH-0000000FzJw-3IRh;
	Sat, 21 Feb 2026 10:49:33 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtkYE-0000000FzJF-3LEj
	for kvm-riscv@lists.infradead.org;
	Sat, 21 Feb 2026 10:49:32 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-64ad9fabd08so2774093d50.2
        for <kvm-riscv@lists.infradead.org>; Sat, 21 Feb 2026 02:49:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771670969; cv=none;
        d=google.com; s=arc-20240605;
        b=NhETMOdzfYu50PaTtOelUCYo3Ta3/7H6nJNMalOb2PM0epvgD1cPZK1xlvrM2RSxFh
         t6zW9+wAo0haSjoK2LaYK9LM6fPex2zqDL/xnSs0+3+J9GxjkucqSvBcy13QdaTB7Om6
         40HyRg1C8lCOFrwv7lJJqfJ7I81YQO5N3Hd9/u4amJkjMsRem5iu1pjQzNnabaiDws0C
         O6c9KzpCqCJPbL7BAcCew48uV0O6mdrS0seR751qa2+FmNRSX013pHlEpYUbj64yMdX9
         6oh9+8y02VTnnSYwjObMizfd2sgjEtCzqeCbnxhOEZM12Hhw2mKWTmn67HfciS1k0mUy
         7BVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9TNS5VFp2OtSYclpYYMlkswuqleo0XcOqWN7QFvC4nE=;
        fh=nhKLotymGhY65OVD8QUYt9BSHlpmswXjyoGRiJ2NsXo=;
        b=LSRYXjWgY/sGRcaEiOF7eedwDJoNh3w3tfKNE1jzqrxS+yamjlzkqeOI56yjLN03WC
         L3GOnFs1mhPxdpgzaG01kdgnJYgmcmkPKX7XiZUGydbay904jIH7hdCdkrlGSnhumhGJ
         IRcZQdsTv9Amo+xTLiGEJyQirRlg7nXarcTQkKGjrA02dYmUYRykDQcxuCx8WU3mDgKs
         nypWjf9wsV8vReH9dwHo7DtfZwsGN3cHakIcJXDyHu3GbQeRWcadKEYtG0MLyyBt4ic0
         57mvdoGFlKwdcNArRr42i//NEgVWossQEQqy4Jv4ZoHSskHjlF4DvFXeIXi2QSY60xUn
         OUOA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1771670969; x=1772275769; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TNS5VFp2OtSYclpYYMlkswuqleo0XcOqWN7QFvC4nE=;
        b=lUhWPTGB1PwiRrcQX0qfjBj43u6YjUa9jL5XUAl6+VlkKw8wDjo+IMG4ku2NOt8ZLC
         0YZ/KBEoeqaf0j/QIJIFVhW+eESr3GXbAqN/d3av9xN5cbVQ/xxsEH4nyh7AvvQnZXoH
         y+ui6CwFo1PwPBjZqyRwj291i2zM/hXMP6RfAsIvlfNzz0aoROHxoKVkb/qUj7O/dAlb
         UHfNeoBFAEMbr4Xm0Gnsbrvit/9P/93JSluJDhidACFSiF9tSb1jK42g2qd5NlG0rPEz
         O8bV3OYZ1oub/lAsDcoiWklPjF0hKh9SW2Rc5e6xI2QqUoflaeUsgFXXn3N7+t4LuHiW
         ppLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771670969; x=1772275769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9TNS5VFp2OtSYclpYYMlkswuqleo0XcOqWN7QFvC4nE=;
        b=d6cZ8RKLdf2j7M8BDzWLKaWet8JHU/MuV0NHdHZ/40/UnpWcI7nP561F//pkL5QRLp
         jdG6xKgtg8UR4cLK/m9gOCZ44MLVh7VA28xVs4HTaO97oL5c2J/0rfQDMvDKaWSinCYp
         Vy2r2QmAD6/khsK3Ezmh/Img3dJAHuW/JAhcHdGrNrp71lnHJZfg11Oru1UAu8Zmb3kv
         8+glzFS9vSkWkuMBEEV5UnuAI2zf5Zadc8ifkEli+dLkiTqf+vNwTXdklCd9dX6EyH8h
         GJOhdpiaOtrs89RO0kCw6O6qCXKfPsHSIq8TNnk/tBscRXwqbsgQ+ho04hr6MAb6H2ly
         y/OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYQf6zunLRa3X/Dhpv2UEX5HWD9cbspbG74diKYjXTH0ds/OSdaoXw/ElFjwb5yvxtiAywnRyjZuc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwyVr3GZY1HYouEnLC6ugCBDNl2/VuTZ/xC4ci8/LVQ/TjPBF7E
	UxWVC5CFtXx40FvdEVektLCqPPeoD1QjELqzAXeBholqi/9SjBaq7mHGcsqEnufHHgxZg234Xr4
	HxVsh2tb+5r5ukoCBAjnvksucskyTYA/MYxDNrnHk8A==
X-Gm-Gg: AZuq6aJFW4JscJ8ef7zSVTrHmfGxIrtFx4kylosWvzuMRxdXMxSWjVjVQH3K5EHp3/4
	4xrC/llH1H3RBgD0IwUXAhZhcCgkuJ7GkAoKRz66z1bVCgVjvrY2Db5hH5AIz24wksi0ZHaF/ZR
	lXHlAOwPOF4bzbgk1HFWzTT+VTHbtH6nTSBenI3f4aKMVJz6b1gXTPfGHRQuFpm/Pf3Vvk/GrEj
	Hh0P8eHOXDR2yZx/mpEHB/qscSfT9A4rhhThAOMLOi5SKgDxnqCb6yObNDNN5BvmoA8X7tqQywt
	h+xElS/hQ18TX0R5EoWZKZDjGO5r82PMUXi1vS8t7zPq52nfdoE=
X-Received: by 2002:a05:690e:12ca:b0:644:7933:ae8a with SMTP id
 956f58d0204a3-64c787d4d86mr2116237d50.16.1771670969304; Sat, 21 Feb 2026
 02:49:29 -0800 (PST)
MIME-Version: 1.0
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com> <20260206002349.96740-5-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260206002349.96740-5-andrew.jones@oss.qualcomm.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 21 Feb 2026 18:49:18 +0800
X-Gm-Features: AaiRm50-Nd8DvhuwtjTpj63edqqgIHwZuLPXqUXWXlhq8AT7aQHbuBkQWQHaDfM
Message-ID: <CAH1PCMb5YS3UzaxhHCjPJHxeTKMcdO78VTPxa7+oktbbhqQ72Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1 04/11] riscv: Add B to hwcap
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Charlie Jenkins <thecharlesjenkins@gmail.com>, Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_024931_124069_9E1E099A 
X-CRM114-Status: GOOD (  18.34  )
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

SGksIERyZXcKCk9uIEZyaSwgRmViIDYsIDIwMjYgYXQgODoyNOKAr0FNIEFuZHJldyBKb25lcwo8
YW5kcmV3LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gQWRkIEIgdG8gaHdjYXAg
YW5kIGVuc3VyZSB3aGVuIEIgaXMgcHJlc2VudCB0aGF0IFpiYSwgWmJiLCBhbmQgWmJzCj4gYXJl
IGFsbCBzZXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFuZHJldy5qb25lc0Bv
c3MucXVhbGNvbW0uY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgg
ICAgICB8IDEgKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdjYXAuaCB8IDEgKwo+
ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgICAgICB8IDggKysrKysrKysKPiAgMyBm
aWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpJIHNhdyB5b3UgY2hvc2Ugbm90IHRvIGFk
ZCBCIHRvIGh3cHJvYmUgaW4gdGhpcyBzZXJpZXMsIHBlcgp5b3VyIHJldmlldyBvZiBteSBwYXRj
aCBbMV0uIEkgaGF2ZSBhIGRpZmZlcmVudCBvcGluaW9uLgoKQXMgeW91IHNhaWQsIEZELCBDLCBh
bmQgViBhcmUgYWxsIGV4cG9ydGVkIHRocm91Z2ggYm90aCBod2NhcAphbmQgaHdwcm9iZS4gQWRk
aW5nIEIgdG8gaHdwcm9iZSB0b28ga2VlcHMgdGhpbmdzIGNvbnNpc3RlbnQsCnVzZXJzIGNhbiBx
dWVyeSBhbGwgdGhlIHNpbmdsZS1sZXR0ZXIgZXh0ZW5zaW9ucyBmcm9tIG9uZQppbnRlcmZhY2Ug
d2l0aG91dCBuZWVkaW5nIHRvIGtub3cgdGhhdCBCIGlzIG1pc3NpbmcgaW4gaHdwcm9iZQphbmQg
dGhhdCB0aGV5J2QgaGF2ZSB0byBjaGVjayBaYmEvWmJiL1picyB0byBpbmZlciBCIHN1cHBvcnQu
CgpSZWx5aW5nIG9uIHRoZSBydmEyM3U2NCBiYXNlIGJpdCB0byBpbXBseSBCIGFsc28gZG9lc24n
dCBjb3ZlcgpjaGlwcyB0aGF0IGltcGxlbWVudCBCIHdpdGhvdXQgYmVpbmcgcnZhMjN1NjQgY29t
cGxpYW50LiBFZy4gbXkKcGF0Y2hzZXQgWzJdIGFkZHMgc3VwcG9ydCBmb3IgZXhpc3RpbmcgKG5v
bi1ydmEyM3U2NCkgU29Dcy4KCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9rM3Jp
a3NnamNpM2p3N3RncWYyN3R1NnZyZnhmczZlN2pvNWppbnd3YWR5cnV5cWdiNkBhcHF5aW00emRj
cWMvClsxXQpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjAxMTUtYWRkaW5n
LWItZHRzaS12Mi0wLTI1NGRkNjFjZjk0N0ByaXNjc3Rhci5jb20vClsyXQoKVGhhbmtzLApHdW9k
b25nCgoKCkd1b2RvbmcKCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9o
d2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gaW5kZXggMDNhY2QyMmJi
YmFhLi5jMTdlMTFjYWNhODMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9o
d2NhcC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gQEAgLTExLDYg
KzExLDcgQEAKPiAgI2luY2x1ZGUgPHVhcGkvYXNtL2h3Y2FwLmg+Cj4KPiAgI2RlZmluZSBSSVND
Vl9JU0FfRVhUX0EgICAgICAgICAgICAgICAgKCdhJyAtICdhJykKPiArI2RlZmluZSBSSVNDVl9J
U0FfRVhUX0IgICAgICAgICAgICAgICAgKCdiJyAtICdhJykKPiAgI2RlZmluZSBSSVNDVl9JU0Ff
RVhUX0MgICAgICAgICAgICAgICAgKCdjJyAtICdhJykKPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhU
X0QgICAgICAgICAgICAgICAgKCdkJyAtICdhJykKPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX0Yg
ICAgICAgICAgICAgICAgKCdmJyAtICdhJykKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdjYXAu
aAo+IGluZGV4IGM1MmJiN2JiYmFiZS4uOTZiN2NmODU0ZTA5IDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od2NhcC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L3VhcGkvYXNtL2h3Y2FwLmgKPiBAQCAtMjEsNiArMjEsNyBAQAo+ICAjZGVmaW5lIENPTVBBVF9I
V0NBUF9JU0FfRiAgICAgKDEgPDwgKCdGJyAtICdBJykpCj4gICNkZWZpbmUgQ09NUEFUX0hXQ0FQ
X0lTQV9EICAgICAoMSA8PCAoJ0QnIC0gJ0EnKSkKPiAgI2RlZmluZSBDT01QQVRfSFdDQVBfSVNB
X0MgICAgICgxIDw8ICgnQycgLSAnQScpKQo+ICsjZGVmaW5lIENPTVBBVF9IV0NBUF9JU0FfQiAg
ICAgKDEgPDwgKCdCJyAtICdBJykpCj4gICNkZWZpbmUgQ09NUEFUX0hXQ0FQX0lTQV9WICAgICAo
MSA8PCAoJ1YnIC0gJ0EnKSkKPgo+ICAjZW5kaWYgLyogX1VBUElfQVNNX1JJU0NWX0hXQ0FQX0gg
Ki8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9y
aXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gaW5kZXggMjVlZDFkNjk1OGQ3Li5jYTdhMzRmNjY3
MzggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gQEAgLTQyOSw2ICs0MjksMTIgQEAgc3Rh
dGljIGNvbnN0IHVuc2lnbmVkIGludCByaXNjdl9jX2V4dHNbXSA9IHsKPiAgICAgICAgIFJJU0NW
X0lTQV9FWFRfWkNELAo+ICB9Owo+Cj4gK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3Zf
Yl9leHRzW10gPSB7Cj4gKyAgICAgICBSSVNDVl9JU0FfRVhUX1pCQSwKPiArICAgICAgIFJJU0NW
X0lTQV9FWFRfWkJCLAo+ICsgICAgICAgUklTQ1ZfSVNBX0VYVF9aQlMsCj4gK307Cj4gKwo+ICAv
Kgo+ICAgKiBUaGUgY2Fub25pY2FsIG9yZGVyIG9mIElTQSBleHRlbnNpb24gbmFtZXMgaW4gdGhl
IElTQSBzdHJpbmcgaXMgZGVmaW5lZCBpbgo+ICAgKiBjaGFwdGVyIDI3IG9mIHRoZSB1bnByaXZp
bGVnZWQgc3BlY2lmaWNhdGlvbi4KPiBAQCAtNDc2LDYgKzQ4Miw3IEBAIGNvbnN0IHN0cnVjdCBy
aXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewo+ICAgICAgICAgX19SSVNDVl9J
U0FfRVhUX0RBVEFfVkFMSURBVEUoZCwgUklTQ1ZfSVNBX0VYVF9ELCByaXNjdl9leHRfZF92YWxp
ZGF0ZSksCj4gICAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShxLCBSSVNDVl9JU0FfRVhUX1Ep
LAo+ICAgICAgICAgX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKGMsIFJJU0NWX0lTQV9FWFRfQywg
cmlzY3ZfY19leHRzKSwKPiArICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVChiLCBSSVND
Vl9JU0FfRVhUX0IsIHJpc2N2X2JfZXh0cyksCj4gICAgICAgICBfX1JJU0NWX0lTQV9FWFRfU1VQ
RVJTRVRfVkFMSURBVEUodiwgUklTQ1ZfSVNBX0VYVF9WLCByaXNjdl92X2V4dHMsIHJpc2N2X2V4
dF92ZWN0b3JfZmxvYXRfdmFsaWRhdGUpLAo+ICAgICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEo
aCwgUklTQ1ZfSVNBX0VYVF9IKSwKPiAgICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVF9W
QUxJREFURSh6aWNib20sIFJJU0NWX0lTQV9FWFRfWklDQk9NLCByaXNjdl94bGludXhlbnZjZmdf
ZXh0cywgcmlzY3ZfZXh0X3ppY2JvbV92YWxpZGF0ZSksCj4gQEAgLTEwODksNiArMTA5Niw3IEBA
IHZvaWQgX19pbml0IHJpc2N2X2ZpbGxfaHdjYXAodm9pZCkKPiAgICAgICAgIGlzYTJod2NhcFsn
ZicgLSAnYSddID0gQ09NUEFUX0hXQ0FQX0lTQV9GOwo+ICAgICAgICAgaXNhMmh3Y2FwWydkJyAt
ICdhJ10gPSBDT01QQVRfSFdDQVBfSVNBX0Q7Cj4gICAgICAgICBpc2EyaHdjYXBbJ2MnIC0gJ2En
XSA9IENPTVBBVF9IV0NBUF9JU0FfQzsKPiArICAgICAgIGlzYTJod2NhcFsnYicgLSAnYSddID0g
Q09NUEFUX0hXQ0FQX0lTQV9COwo+ICAgICAgICAgaXNhMmh3Y2FwWyd2JyAtICdhJ10gPSBDT01Q
QVRfSFdDQVBfSVNBX1Y7Cj4KPiAgICAgICAgIGlmICghYWNwaV9kaXNhYmxlZCkgewo+IC0tCj4g
Mi40My4wCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3Zt
LXJpc2N2Cg==
