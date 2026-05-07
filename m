Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6363ECD3442
	for <kvm-riscv@archiver.kernel.org>; Thu,  7 May 2026 10:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nR2MduRZG5m/Ks99IkczufdUWMzNP2Ww3gC0CK9OeUU=; b=dQWaGlJv1wIyOt
	MChwCaeBcnY0y5WCW8wPuB2xkkSGu6tHjoZTPbK1KtF3GhqQwX0jWOJB1QmI81X3S6RQ/3+szkX3f
	KuRFgQsHpiozfbS9UcGIP48CKp8KocIheQg0iTSMNGgA3OYFYrmw7IwVjSkEjL9mBskx9evrgcPWY
	QRYsp1qfLLfhO9WwM8m2uKrEl0EhNCJXIu5NQUFB9n0RIodz7vSYMLCsqIsCyunrxL3MWMHTNeOa8
	9CUjuWjiaI7OGDEjySweVoKi/67WnIhHO4HmUNcoEg4srjYlusXL1Aa/y5PdCSsHhRuLXSCFaR/nY
	yvmN092ROMm9p/TVoXUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvb6-00000003R87-03BT;
	Thu, 07 May 2026 10:04:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvb3-00000003R79-1gT5
	for kvm-riscv@lists.infradead.org;
	Thu, 07 May 2026 10:04:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EDAD43D39
	for <kvm-riscv@lists.infradead.org>; Thu,  7 May 2026 10:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A8BC2BCF7
	for <kvm-riscv@lists.infradead.org>; Thu,  7 May 2026 10:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778148284;
	bh=FSBoQYl9pKVX8kDbLQ9ev59hCVL1FSyoN047oWdFqAM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iQYmZPveOlChILrXBaOikArVjvLHUif2Wm19E7Ugqe8rvhk4mbs4lq7FwrmeqRSwP
	 4z0pT5mkzz3hZinWJ6lpKJRmOSqIyBhF81sj3c5Hin91accm9LpDS5qDXj6c5G7Ist
	 Z5vnHmsX2uwSGG6oWF0aKUMz4H2HDQSoPRYwy7O5pCcmAjNFm1/N5wbERJxfkCwtWP
	 CTWUPSJyoCQJsjDcRFc/k4xNle6oMtnJofQ/5F6riKpVzzTA/sli/n3E3/HnO3Of7m
	 CfPvc1uGajnJGyl9+ce6hmQ6CQWWAUbuw7fcwL9CGPnXT/IaU7XWkm4Xiq9SBVUptv
	 1MokFMB9Y94vg==
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d7e23defbso368959f8f.0
        for <kvm-riscv@lists.infradead.org>; Thu, 07 May 2026 03:04:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ98IjWO2HmMv58hbxhwaxoA4UFYdDKyvfniiIMaH0xi4FcMLK/yPMWFa3xfRZkQsKnfci/5PvO/zw0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdPyghEt+HMYzE3aA16z7aLDm7YLj10Q4y8dsEzwgiJxTeWPz0
	PY6uLA6gLT17nf6mHkJTs0pLWwW+/oInqf7NRji3pRhyxFDuGQjW+PcyVXllmqc8l+IPFaK5pjg
	gNairTzqe3dgj/vRC4Ou9eXgDWKUxBwo=
X-Received: by 2002:a05:6000:61e:b0:43d:7b90:fa23 with SMTP id
 ffacd0b85a97d-4515d4d0fafmr12396020f8f.29.1778148282572; Thu, 07 May 2026
 03:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260425005916.3321811-1-guoren@kernel.org> <20260425005916.3321811-4-guoren@kernel.org>
 <87wlxhwr8v.ffs@tglx>
In-Reply-To: <87wlxhwr8v.ffs@tglx>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 7 May 2026 18:04:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRWpbqmbLcqX-CroOp_XsNGZxinxMEb8FEkBY-qJeniRQ@mail.gmail.com>
X-Gm-Features: AVHnY4Imjt2cNMxiqNS60LFeeQz6aivaWccZakhoucv_O_-tz8wElEbBRk3SQEg
Message-ID: <CAJF2gTRWpbqmbLcqX-CroOp_XsNGZxinxMEb8FEkBY-qJeniRQ@mail.gmail.com>
Subject: Re: [PATCH V2 3/4] irqchip/riscv-imsic: Move nr_guest_files to
 per-HART local config
To: Thomas Gleixner <tglx@kernel.org>
Cc: alex@ghiti.fr, anup@brainfault.org, aou@eecs.berkeley.edu, 
	atish.patra@linux.dev, cp0613@linux.alibaba.com, fangyu.yu@linux.alibaba.com, 
	gaohan@iscas.ac.cn, inochiama@gmail.com, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, me@ziyao.cc, palmer@dabbelt.com, 
	pjw@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_030445_458920_23894DC0 
X-CRM114-Status: GOOD (  12.66  )
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

T24gV2VkLCBNYXkgNiwgMjAyNiBhdCA0OjEy4oCvQU0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBBcHIgMjUgMjAyNiBhdCAwMDo1OSwgZ3VvcmVu
QGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBGcm9tOiAiR3VvIFJlbiAoQWxpYmFiYSBEQU1PIEFjYWRl
bXkpIiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPgo+ID4gV2l0aCB0aGUgcmVjZW50IEtWTSBBSUEg
cGVyLUhBUlQgSEdFSSBjb252ZXJzaW9uLCB0aGUgZ2xvYmFsCj4gPiBucl9ndWVzdF9maWxlcyBp
cyBubyBsb25nZXIgYXBwcm9wcmlhdGUuIERpZmZlcmVudCBIQVJUcyBpbgo+ID4gaGV0ZXJvZ2Vu
ZW91cyBTb0NzIG1heSBoYXZlIGRpZmZlcmVudCBudW1iZXJzIG9mIGd1ZXN0IGludGVycnVwdAo+
ID4gZmlsZXMuCj4gPgo+ID4gTW92ZSBgbnJfZ3Vlc3RfZmlsZXNgIGZyb20gYHN0cnVjdCBpbXNp
Y19nbG9iYWxfY29uZmlnYCB0bwo+ID4gYHN0cnVjdCBpbXNpY19sb2NhbF9jb25maWdgLCBhbmQg
Y29tcHV0ZSBpdCBwZXItQ1BVIGluCj4gPiBpbXNpY19zZXR1cF9zdGF0ZSgpIGJhc2VkIG9uIHRo
ZSBhY3R1YWwgTU1JTyBndWVzdCBmaWxlIHJlZ2lvbiBzaXplLgo+ID4KPiA+IFVwZGF0ZSB0aGUg
cmVsYXRlZCBjb21tZW50IHRvIHJlZmxlY3QgdGhhdCBLVk0gbm93IHVzZXMgdGhlCj4gPiBwZXIt
SEFSVCB2YWx1ZS4KPiA+Cj4gPiBUaGlzIGVsaW1pbmF0ZXMgdGhlIGxhc3QgZ2xvYmFsIGFzc3Vt
cHRpb24gYWJvdXQgZ3Vlc3QgZmlsZXMgYW5kCj4gPiBjb21wbGV0ZXMgdGhlIHBlci1IQVJUIGNv
bnZlcnNpb24gc2VyaWVzIGZvciBSSVNDLVYgQUlBL0lNU0lDLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IEd1byBSZW4gKEFsaWJhYmEgREFNTyBBY2FkZW15KSA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4K
PiBBc3N1bWluZyB0aGlzIGdvZXMgdGhyb3VnaCB0aGUgcmlzYy12IHRyZWU6Cj4KPiBBY2tlZC1i
eTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGtlcm5lbC5vcmc+CgpHb3QgaXQgJiBUaHggVGhvbWFz
LgoKSSB0aGluayBpdCdsbCBnbyB0aHJvdWdoIHRoZSBrdm0tcmlzY3YgdHJlZSBiZWNhdXNlIGl0
J3MgYWxsIGFib3V0IGt2bQppbXByb3ZlbWVudHMuCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVu
CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
