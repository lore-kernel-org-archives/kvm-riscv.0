Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08664CCF9E0
	for <kvm-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 15:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BNDUWeaZJyidxuJeVq3qCcUhY/o+ZD7UIHe27zp2M88=; b=2d9xQRikRpKsdV
	YWZ+MD71klB04rBmn8bioMxt3w16gALSijIGsiy+S065OXCxNBhQha2R7CfyfBouR3QS1Q72Numko
	2E8U+VDZQcxUGCUGBTv+OiSfaqngoLFs3sBdcS78Y4s8xdJ30xhNSflD4BURIN2ZGMGKGqyos3IHq
	ViJMgW3ImLiEu4YEZtv9Fh3aUGsFazB45EtWD2Bldmv4y0jhTw4mKLfdxq1CiNp8lW+oaVz5XgLX+
	CJ3drnLK5uXD7EhgRh7/ptMS1iVxNLgR1Q15y0Cqp35znpf4e9eXeBo7L7aGjG1/lJ3KkGUPpsnu+
	dm5TOm6edjpEPMDLtYmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJfO-00000009nt8-2ULK;
	Fri, 24 Oct 2025 15:25:22 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJfL-00000009nrc-37ew
	for kvm-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 15:25:21 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-430ae09ea23so8901225ab.0
        for <kvm-riscv@lists.infradead.org>; Fri, 24 Oct 2025 08:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761319519; x=1761924319; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yd271BqGjeS+iBsD8ybvx85gmJGIuP9wFhL3YHDZT0o=;
        b=QNl7TfswIEYjqLKQOaAZeo5wNlfwmSLZB6k/BejnqrajduJCjHmQ3Z67qDmbXtykGs
         Wf/SPQi9b4+HDGhKUUfDE84Yyz7J844OuKr0pOks5mPi7h3szM62in+J84OJnd0R2aHI
         gcs3L8cyRlFOcewwv4xhscH/VtP51coGJfOJ1mQMTEF73d1xYT/zpAlVvDwVFlq65rI5
         0xMlSLdR5l2lRJYWXWSDLK6FceqYxXzLaAgEk9up1ejKJVILgOHApMB4RG133J2l7IBJ
         khJ68YutjgdTYTKB3jAzHtk+8xce/lqL8/46Pt1sC/OlxsOOEM0djv6unJEkW6ZT/1Ny
         1mSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761319519; x=1761924319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yd271BqGjeS+iBsD8ybvx85gmJGIuP9wFhL3YHDZT0o=;
        b=lgSAaMKy3ju+MYnGWFy4bAtj2q8cxi96pbKfRyyXREchJaDCl7gzPcY2sdpPyQpdtb
         AhUx0J87jHPIW7oYNvuylcvSOLx/l6NrFeuaFULJ/rW0n2nHj2ZHvDM3XOqwY0f583fo
         r/fVxjNBNxZ8M/CnYHTa+dhH5FOtv27K+qVMzV0bNVuN6W6isDD+mpuJZxsnpgdIOgk1
         ULsUQHxsKi0Af3EdRUx0Hh29dPzv3VPlvQe5rof++50cgFPVggSTJvC240R/cSVNSRbw
         jhGmXh3CKPZCRw1xTqCHCFHVnwCY9FyKJDEks2kgbhKdpjMF0barSxOtd1ZSAlSAkzbe
         gjoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsM/i7mvR+qFnieKRZXYXVDzvs2kX2xJcFsZmVOcbG4eCEicC+seGEkgSEcqcKTY8V7cIKl/CBrrU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBQJR7NqlNnX7yiQwyeQyOr5v0dNfjcJYIfzU9Y2lFLfBv2+oJ
	WBkxBbUW4epsgw3B9NOok1LJXQBf3gVa9Yvig5oHJ7I3oGjBI9swjXNrOEllNvXn1m1aPHVbQot
	872MRdZv1OknnhRl7qI6p2b88U4VZEaiH/txfsrvpdA==
X-Gm-Gg: ASbGnctkGEE0pHbPAO4UKKCrp1dC2vCssZcqxfi0h8uFSC5VZWrCK8ulW0G6guF8U1g
	gux7ztZGIQQXDVNDtsGcv3614IM/yy+HkFMUreDSuWk2GKQbMVTSbpEOD/hKYOKooXrtsztB4kh
	nkNCMwbGctbqM5urXik+SKz0ODx+QOfZywCDZ2xjOoQsk6w7JYVyj1zMbWVdC1EeuIR+SCCarj+
	LX+rB72nox+emRA4fjF6VNRn8tQkwfKq4PO+mGPi2gRbmsPiPb90zSPp8bLngrbhWzhiw1fkVuE
	cxzVPW2yXzBOm29eng==
X-Google-Smtp-Source: AGHT+IG1wtHjPkEbu0FQUk92/3c0w05Y3QVim5/4mMrB0XZ9bClwOntryLQ8t33SRrMWa1kUgX8toMC4K2lDPbh1b2U=
X-Received: by 2002:a05:6e02:1fc6:b0:42e:2c30:285f with SMTP id
 e9e14a558f8ab-430c527dc63mr348454435ab.19.1761319518490; Fri, 24 Oct 2025
 08:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy1fCCdciZLqmoeWDG_QoOHDi9j0_ZZKYkpGJmWrf14Q-g@mail.gmail.com>
 <20251024133116.73803-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20251024133116.73803-1-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 24 Oct 2025 20:55:06 +0530
X-Gm-Features: AWmQ_bnQnnLktl5ci8mf6nQS2KPthEIzOPC5pFpxmUA9i0pi75M3qXGuzrrlyiI
Message-ID: <CAAhSdy3E7-uC=pwU3c93bj3_xykPnLUcDXgKJtJ0KYeL91tijw@mail.gmail.com>
Subject: Re: Re: [PATCH] RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, atish.patra@linux.dev, 
	guoren@kernel.org, jiangyifei@huawei.com, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pbonzini@redhat.com, 
	pjw@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_082519_957711_3FA89A01 
X-CRM114-Status: GOOD (  14.88  )
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

T24gRnJpLCBPY3QgMjQsIDIwMjUgYXQgNzowMeKAr1BNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gPj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxp
YmFiYS5jb20+Cj4gPj4KPiA+PiBBcyBvZiBjb21taXQgYWFjNmRiNzVhOWZjICgidmZpby9wY2k6
IFVzZSB1bm1hcF9tYXBwaW5nX3JhbmdlKCkiKSwKPiA+PiB2bV9wZ29mZiBtYXkgbm8gbG9uZ2Vy
IGd1YXJhbnRlZWQgdG8gaG9sZCB0aGUgUEZOIGZvciBWTV9QRk5NQVAKPiA+PiByZWdpb25zLiBV
c2luZyB2bWEtPnZtX3Bnb2ZmIHRvIGRlcml2ZSB0aGUgSFBBIGhlcmUgbWF5IHRoZXJlZm9yZQo+
ID4+IHByb2R1Y2UgaW5jb3JyZWN0IG1hcHBpbmdzLgo+ID4+Cj4gPj4gSW5zdGVhZCwgSS9PIG1h
cHBpbmdzIGZvciBzdWNoIHJlZ2lvbnMgY2FuIGJlIGVzdGFibGlzaGVkIG9uLWRlbWFuZAo+ID4+
IGR1cmluZyBnLXN0YWdlIHBhZ2UgZmF1bHRzLCBtYWtpbmcgdGhlIHVwZnJvbnQgaW9yZW1hcCBp
biB0aGlzIHBhdGgKPiA+PiBpcyB1bm5lY2Vzc2FyeS4KPiA+Pgo+ID4+IEZpeGVzOiA5ZDA1YzFm
ZWU4MzcgKCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IHN0YWdlMiBwYWdlIHRhYmxlIHByb2dyYW1t
aW5nIikKPiA+PiBTaWduZWQtb2ZmLWJ5OiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5hbGli
YWJhLmNvbT4KPiA+Cj4gPkxHVE0uCj4gPgo+ID5RdWV1ZWQgaXQgYXMgZml4IGZvciBMaW51eC02
LjE4Cj4gPgo+ID5SZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4K
PiA+Cj4gPlRoYW5rcywKPiA+QW51cAo+ID4KPgo+IEhpIEFudXA6Cj4KPiBUaGFua3MgZm9yIHRo
ZSByZXZpZXcuCj4KPiBQbGVhc2Ugbm90ZSB0aGF0IHRoaXMgcGF0Y2ggaGFzIHR3byBidWlsZCB3
YXJuaW5ncywgYW5kIEkgaGF2ZSBmaXhlZAo+IG9uIHBhdGNoIFYyOgo+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUxMDIxMTQyMTMxLjc4Nzk2LTEtZmFuZ3l1Lnl1QGxp
bnV4LmFsaWJhYmEuY29tLwo+CgpDYW4geW91IHNlbmQgYSBzZXBhcmF0ZSBwYXRjaCB3aXRoIEZp
eGVzIHRhZyB0byB0aGlzIHBhdGNoPwoKWW91IGNhbiBiYXNlIHRoZSBwYXRjaCBvbiByaXNjdl9r
dm1fbmV4dCBicmFuY2ggYXQ6Cmh0dHBzOi8vZ2l0aHViLmNvbS9rdm0tcmlzY3YvbGludXguZ2l0
CgpSZWdhcmRzLApBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2t2bS1yaXNjdgo=
