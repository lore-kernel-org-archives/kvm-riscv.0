Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6DFF5A8B9
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 20:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGuL3ju0FzF134hUOY9WV31YETHP99VoSzJQSWrpfY8=; b=lPQxQdEdPC+PDy
	DO9GcB+6asZ7N5fdnA/ydv0dpLJ1z9DMHpJ0FrXhF/lkHFnoR9Rq59pbYyMwnCLO6GYrysTGlhkom
	B1oHY4GArIDqUxYNrxQhjgnpt7iQT219Mqi4m7VYhUZtoxrQce/i2xnDczZr7iLAlZQOO1v3VieL9
	Rga8cE94dLE18Jo0pbe5W9g4nN4Nhlz6N+qko0ZeAABXVjdlVbhUTWA6XfinApqlA8UJ1BKZtIJtz
	tzEeFkz6mn3+W/tTV4JEiD6qatKqz4NJa37P4r4uktxlG+9HcI2w5WjZT1E78IBc7yebUvAtekefW
	IBkXUzTgx6utWVqfUpUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEv2p-00000007cPO-1itD;
	Mon, 20 Apr 2026 20:16:35 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEv2m-00000007cO0-15Sf
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 20:16:34 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-38dd9f11a09so32600521fa.2
        for <kvm-riscv@lists.infradead.org>; Mon, 20 Apr 2026 13:16:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776716189; cv=none;
        d=google.com; s=arc-20240605;
        b=AgJ4eG5F5D/eFYdcUSPUG79iLPo1sk2okGXiOLwleZjU31wuoEqzlELsltPIBom9XL
         J7Hug3ghmf9fEX/2BPgQN+z5y2BV5deVe2laUJxUZwSv2wLfCt8gICw0OxFMMP/L/32Y
         JhncibMZEr1Osny+JORnZ/lqtrhsM3AnuRh/r6nX7Q9xEkj0/iNbtJvx8mRmdlh/++ZD
         96MatlRn1FhOjgt8r9uBqNGURyFPXgN8COJBKqE0CUuqXPhhaQtmtUkJkGP0/Sllq117
         6v4ykuRkfJ4TaA3BqbWgD1XPuLC9zShq/RhhB770/l9nM/iWFEBHiY6Syq+yIuJ3PO/0
         WiZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uT/kFgtDJcz1r8Wwv13r6DbOoiLv2w0cC+Hfy6lE6eQ=;
        fh=nquImGCi8H24eHm9xe1cOEvP+Qv6AbN9SJ6Ai9rcfos=;
        b=hYV/d3RRn8DcJ5+L4e3Z0CihF9rsFi5x3Vm/3sAazSxrurGXM7hFHFXd9m5pQiEY2Q
         hF7blIG9xbroQPV5yalkrHnLl5+goztCuivRSTodVCoH4JQyCSnH1A+ssCO7GdQchHtR
         0GwzTQflZdY5qEK0dWtSL77q+JRVzgLQLHSVyGDJVRPGdiAvfsMKirMcoeqnKq2kujQ5
         1fLwdHdEWaOVZw+L4C6s7hk9MMEKspl6QyYqWEXkGFr9D8Oe8/m74nYfq5IGqJv+zCsQ
         uQXlbFuG0Fz0z8963NI7vu18Q25TjzMC5C3iPjrRlVnGimksk8AU2V20UgYgVCyBuvWT
         jJ/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776716189; x=1777320989; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uT/kFgtDJcz1r8Wwv13r6DbOoiLv2w0cC+Hfy6lE6eQ=;
        b=dSPIYs9Pl0xoW5aPKoV+vgjZO6pmcldvcj2FX60RjCfI2IpZn8kRfTXQoMmKxGP+BB
         6plqmrAAIBGz0fRBWenyDRaGOpiJOsQZ67d1lkVAeTKpOQwsSoDQhxHufcIWXfT4pNec
         Vp0X52TmI2uz3pgN99wqKcTM+Q07GEEntt8evvRWwiML0mYkCh/mXTy/D4TPTTuzFFbb
         lWuWvUxZMwbUVsenhkI/qWzl3ndN3W8eFq4hH1PhhuMeJRFfaWjOFx2H7NBiMS0rMoQW
         rbXweAE+ynvWAApV/zNQdIyFpAcMnNKIO+wvlJoTvQ77BzLWAC1/meHUCtT0T6hEbGWy
         e9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776716189; x=1777320989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uT/kFgtDJcz1r8Wwv13r6DbOoiLv2w0cC+Hfy6lE6eQ=;
        b=Xss10NNi5lY3KsW2srMYehfw32LDskecdPOxUO/+pIeHuZiu5p56VfwSXSFYy/evdV
         SgLrGv/AdT6M+5mBpTsEkmjHhU/aRYQt9ZeO4q2nierbZHRl2bol8OWINOL1UU1+LKd5
         WC9jVkubOSYEsI9j4CzSRmf/prAHAuHvpsNBNTJoxXACGxhB5J3qeXaRXLYE7jFcarfL
         X1Xt5KWl75udIR3/kFc/11B9QB0lhXJIZbqZXzJbNiSRWeAM6dN5Mn64ghoXlcu4wMGS
         aXuiyN1ZJLQd6ND6SQYFjdIEg4JKFPqSuV05yOpeL5/W6tPtfJL9Unyr4yWGGydoQJ4M
         SI9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Q7reeYocXSR3uglmUAD2lp+pYQqe17eX3dc7yYsGNBYv0iRCqd1MqD0Z/cc9TmfED3Wev68w7l7s=@lists.infradead.org
X-Gm-Message-State: AOJu0YxfrYdD5XGLd7ROjOTKOnrwsc71gvA1AFKeOmwWb5NPfhtDphKx
	2e8vQXdZI2St/UuEWq1qb+bdPpKjnbo+1p9kIKxmNoAG/2PSssb1JZxVym2SIALIbS7VJc5opAg
	bMWRDaI6Cwdm7Wfw6dDNKj3WkwXPaIH5fCjhIisvJ
X-Gm-Gg: AeBDievv2VECiTwGDhchzDlYDV6XW5+uNuyMUAV/17erIIfp49BDPLB1TJEmza2bgHY
	liPIuyJl/X+dDUxwuUqpZS7prhpeZYZQr44zVlE9IkIyqpPzlo0Mz23zekejZIqfYTO1PzONBO5
	yV+zfDrukvDiLvmCThgfJPG3IdPyHHiek7VHJgZlS7jdIM7BToHdtBwUnREEdOENo/sdRtVRuQU
	kwNyB0fv08tH2PP+aHgXFhRVK+6s5K2O/IaedPA2VkPHZzA10FeuzNsM+yE1IvzUxsEOPw/B3nl
	/xL56jtzJEqSFwkmtzcckhg3tzWTZunzSOCspgzy
X-Received: by 2002:a05:651c:400e:b0:38e:76c2:dc8f with SMTP id
 38308e7fff4ca-38ec7ae0487mr32714001fa.25.1776716188389; Mon, 20 Apr 2026
 13:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com> <20260220004223.4168331-2-dmatlack@google.com>
 <aeaHPYwzs0dhwX9-@google.com>
In-Reply-To: <aeaHPYwzs0dhwX9-@google.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 20 Apr 2026 13:15:59 -0700
X-Gm-Features: AQROBzA7QaU-uTclKNPqPjm7N83BGZYqy9MhPcyoyTd2bRZSTk_SV3WPxct_hj8
Message-ID: <CALzav=dvNr2s3UzDKPyxS3JUcaWykKNvYPJUW+8g21DA9SzJLw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] KVM: selftests: Use gva_t instead of vm_vaddr_t
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Bibo Mao <maobibo@loongson.cn>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_131632_337129_E0B0640C 
X-CRM114-Status: GOOD (  19.23  )
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

T24gTW9uLCBBcHIgMjAsIDIwMjYgYXQgMTowNuKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgRmViIDIwLCAyMDI2LCBEYXZpZCBN
YXRsYWNrIHdyb3RlOgo+ID4gUmVwbGFjZSBhbGwgb2NjdXJyZW5jZXMgb2Ygdm1fdmFkZHJfdCB3
aXRoIGd2YV90IHRvIGFsaWduIHdpdGggS1ZNIGNvZGUKPiA+IGFuZCB3aXRoIHRoZSBjb252ZXJz
aW9uIGhlbHBlcnMgKGUuZy4gYWRkcl9ndmEyaHZhKCkpLiBBbHNvIHJlcGxhY2UKPiA+IHZtX3Zh
ZGRyIGluIGZ1bmN0aW9uIG5hbWVzIHdpdGggZ3ZhIHRvIGFsaWduIHdpdGggdGhlIG5ldyB0eXBl
IG5hbWUuCj4KPiAuLi4KPgo+ID4gQEAgLTcxNiwyMiArNzE2LDIyIEBAIHZvaWQgdm1fbWVtX3Jl
Z2lvbl9tb3ZlKHN0cnVjdCBrdm1fdm0gKnZtLCB1aW50MzJfdCBzbG90LCB1aW50NjRfdCBuZXdf
Z3BhKTsKPiA+ICB2b2lkIHZtX21lbV9yZWdpb25fZGVsZXRlKHN0cnVjdCBrdm1fdm0gKnZtLCB1
aW50MzJfdCBzbG90KTsKPiA+ICBzdHJ1Y3Qga3ZtX3ZjcHUgKl9fdm1fdmNwdV9hZGQoc3RydWN0
IGt2bV92bSAqdm0sIHVpbnQzMl90IHZjcHVfaWQpOwo+ID4gIHZvaWQgdm1fcG9wdWxhdGVfdmFk
ZHJfYml0bWFwKHN0cnVjdCBrdm1fdm0gKnZtKTsKPiA+IC12bV92YWRkcl90IHZtX3ZhZGRyX3Vu
dXNlZF9nYXAoc3RydWN0IGt2bV92bSAqdm0sIHNpemVfdCBzeiwgdm1fdmFkZHJfdCB2YWRkcl9t
aW4pOwo+ID4gLXZtX3ZhZGRyX3Qgdm1fdmFkZHJfYWxsb2Moc3RydWN0IGt2bV92bSAqdm0sIHNp
emVfdCBzeiwgdm1fdmFkZHJfdCB2YWRkcl9taW4pOwo+ID4gLXZtX3ZhZGRyX3QgX192bV92YWRk
cl9hbGxvYyhzdHJ1Y3Qga3ZtX3ZtICp2bSwgc2l6ZV90IHN6LCB2bV92YWRkcl90IHZhZGRyX21p
biwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgZW51bSBrdm1fbWVtX3JlZ2lvbl90eXBl
IHR5cGUpOwo+ID4gLXZtX3ZhZGRyX3Qgdm1fdmFkZHJfYWxsb2Nfc2hhcmVkKHN0cnVjdCBrdm1f
dm0gKnZtLCBzaXplX3Qgc3osCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm1f
dmFkZHJfdCB2YWRkcl9taW4sCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51
bSBrdm1fbWVtX3JlZ2lvbl90eXBlIHR5cGUpOwo+ID4gLXZtX3ZhZGRyX3Qgdm1fdmFkZHJfYWxs
b2NfcGFnZXMoc3RydWN0IGt2bV92bSAqdm0sIGludCBucl9wYWdlcyk7Cj4gPiAtdm1fdmFkZHJf
dCBfX3ZtX3ZhZGRyX2FsbG9jX3BhZ2Uoc3RydWN0IGt2bV92bSAqdm0sCj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZW51bSBrdm1fbWVtX3JlZ2lvbl90eXBlIHR5cGUpOwo+ID4g
LXZtX3ZhZGRyX3Qgdm1fdmFkZHJfYWxsb2NfcGFnZShzdHJ1Y3Qga3ZtX3ZtICp2bSk7Cj4gPiAr
Z3ZhX3QgZ3ZhX3VudXNlZF9nYXAoc3RydWN0IGt2bV92bSAqdm0sIHNpemVfdCBzeiwgZ3ZhX3Qg
dmFkZHJfbWluKTsKPiA+ICtndmFfdCBndmFfYWxsb2Moc3RydWN0IGt2bV92bSAqdm0sIHNpemVf
dCBzeiwgZ3ZhX3QgdmFkZHJfbWluKTsKPiA+ICtndmFfdCBfX2d2YV9hbGxvYyhzdHJ1Y3Qga3Zt
X3ZtICp2bSwgc2l6ZV90IHN6LCBndmFfdCB2YWRkcl9taW4sCj4gPiArICAgICAgICAgICAgICAg
ZW51bSBrdm1fbWVtX3JlZ2lvbl90eXBlIHR5cGUpOwo+ID4gK2d2YV90IGd2YV9hbGxvY19zaGFy
ZWQoc3RydWN0IGt2bV92bSAqdm0sIHNpemVfdCBzeiwKPiA+ICsgICAgICAgICAgICAgICAgICAg
IGd2YV90IHZhZGRyX21pbiwKPiA+ICsgICAgICAgICAgICAgICAgICAgIGVudW0ga3ZtX21lbV9y
ZWdpb25fdHlwZSB0eXBlKTsKPiA+ICtndmFfdCBndmFfYWxsb2NfcGFnZXMoc3RydWN0IGt2bV92
bSAqdm0sIGludCBucl9wYWdlcyk7Cj4gPiArZ3ZhX3QgX19ndmFfYWxsb2NfcGFnZShzdHJ1Y3Qg
a3ZtX3ZtICp2bSwKPiA+ICsgICAgICAgICAgICAgICAgICAgIGVudW0ga3ZtX21lbV9yZWdpb25f
dHlwZSB0eXBlKTsKPiA+ICtndmFfdCBndmFfYWxsb2NfcGFnZShzdHJ1Y3Qga3ZtX3ZtICp2bSk7
Cj4KPiBUaGUgZXhpc3Rpbmcgdm1fdmFkZHJfYWxsb2MoKSBhbmQgZnJpZW5kcyBhcmUgcHJldHR5
IGJhZCBuYW1lcy4gIGd2YV9hbGxvYygpIGlzCj4gZmFyLCBmYXIgd29yc2UuICBUaGUgQVBJcyBh
cmVuJ3QganVzdCBhbGxvY2F0aW9uIGEgZ3Vlc3QgdmlydHVhbCBhZGRyZXNzLCB0aGV5J3JlCj4g
YWxsb2NhdGluZyBndWVzdCBwaHlzaWNhbCBtZW1vcnksIGZpbmRpbmcgYSB1c2FibGUgdmlydHVh
bCBhZGRyZXNzLCBhbmQgY3JlYXRpbmcKPiBtYXBwaW5ncy4KPgo+IEkgZG9uJ3Qgc2VlIGFueSBy
ZWFzb24gdG8gaGF2ZSB2YWRkciBvciBndmEgaW4gdGhlIG5hbWUuICBFLmcuIG1hbGxvYygpIGlz
bid0Cj4gdmlydF9tYWxsb2MoKS4gIEJ1dCBJIGRvIHRoaW5rIHRoZXkgbmVlZCB0byBiZSBleHBs
aWNpdGx5IHNjb3BlZCB0byBLVk0sIGFuZCB0bwo+IGEgVk0uICBJJ2xsIGRyb3AgQVBJIHJlbmFt
ZXMgZnJvbSB0aGlzIHBhdGNoLCBhbmQgcmVuYW1lIHRoZW0gdG8gdm1fYWxsb2MoKSBhbmQKPiBm
cmllbmRzIGluIGEgc2VwYXJhdGUgcGF0Y2guICBBbXVzaW5nbHksIHRoYXQgbmFtaW5nIHNjaGVt
ZSB3aWxsIHN0aWxsIHdvcmsgaWYKPiAidm0iIGlzIG1pc2NvbnN0cnVlZCBhcyAidmlydHVhbCBt
ZW1vcnkiIGluc3RlYWQgb2YgInZpcnR1YWwgbWFjaGluZSIuCgpTb3VuZHMgZ29vZCB0byBtZS4K
Cj4gUC5TLiBUaGlzIGlzIGEgZ3JlYXQgZXhhbXBsZSBvZiB3aHkgSSBpbnNpc3Qgb24gb25lIGxv
Z2ljYWwgY2hhbmdlIHBlciBwYXRjaCwgd2l0aAo+IGp1ZGljaW91cyBleGVtcHRpb25zIGZvciBv
cHBvcnR1bmlzdGljIGNsZWFudXBzL2NoYW5nZXMuICBJZiB0aGlzIGhhcyBiZWVuIGEKPiBzZXBh
cmF0ZSBwYXRjaCwgaXQgd291bGQgaGF2ZSB0YWtlbiBtZSBhbGwgb2YgdHdvIHNlY29uZHMgdG8g
dW53aW5kLiAgQXMgaXQgd2FzLAo+IEkgc3BlbnQgYSBnb29kIDEwLTE1IG1pbnV0ZXMgZGVhbGlu
ZyB3aXRoIHRoaXMuICBJbiBsYXJnZSBwYXJ0IGJlY2F1c2UgSSBrZXB0Cj4gbWFraW5nIGdvb2Zz
LCBidXQgdGhhdCdzIHRoZSB3aG9sZSBwb2ludDogdGhlcmUgd2FzIG5vIHJlYXNvbiB0byBwdXQg
bWUgaW4gYQo+IHBvc2l0aW9uIHRvIG1ha2UgZ29vZnMuCj4KPiBUaGUgb3RoZXIgYXJndW1lbnQg
YWdhaW5zdCB0aGVzZSBzb3J0cyBvZiAiQWxzbyBkbyB4eXoiIGFkZC1vbnMgaXMgdGhhdCBvZiBh
Cj4gc2xpcHBlcnkgc2xvcGUuICBXaHkgcmVuYW1lIHRoZXNlIEFQSXMgaW4gdGhpcyBwYXRjaCwg
YnV0IG5vdCB0aGUgbXlyaWFkIHZhZGRyCj4gdmFyaWFibGVzPyAgVGhlbiBhZnRlciBhIGZldyAi
SSdsbCBqdXN0IGNsZWFuIHRoaXMgdXAgdG9vIiBjaGFuZ2VzLCB0aGVyZSdzIGFuCj4gZW50aXJl
IHNlcmllcyBpbiB3aGF0IGlzIHB1cnBvcnRlZGx5IGp1c3QgYSB0eXBlZGVmIHJlbmFtZS4KCllv
dSdyZSByaWdodCwgdGhlIEFQSSByZW5hbWUgc2hvdWxkIGhhdmUgYmVlbiBzcGxpdCBvZmYgaW50
byBpdHMgb3duIHBhdGNoLgpUaGFua3MgZm9yIHRoZSBndWlkYW5jZSEKCi0tIAprdm0tcmlzY3Yg
bWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
