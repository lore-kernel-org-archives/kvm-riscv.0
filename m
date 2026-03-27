Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8360810ED674
	for <kvm-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 12:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lfL0RVB6dP8qyUpvOvMdZKDHtLWbz1N3Raa0VNJeqro=; b=w6CzlOo6Q/Hlc3
	JhEf9OuexlMqnGfRZyCLvlJgxxZdyVgCxvhc7/lC6a1v+WHdEQqbrF+lpgguzeMblhX9KAGimw1Av
	FiFbFHnzvMlgMyLrY4Wx86xL2t/QTbyoppZROnuFqdmV0nq6L0m1MrYEekEMW51k8dn0eyrm3Iaqx
	upWA5sZwfxa5RpzEOWpTivR+YihFQPveeysl/w9lc2hf7AUZGJREwnPvOPJe1hZPzEruwgWA2qqFE
	keiOeA60N1w0LdPfJNRGjPialYocokvjOGpk8NKX79wLG9CS5RsJJjk2xb4QrJevoQvBP7E5NR4h4
	fkpCIwUmim88bn/YsKLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66mx-00000007Ngo-3pPA;
	Fri, 27 Mar 2026 12:59:47 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66mv-00000007Ng0-1NDC
	for kvm-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 12:59:46 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-67e09232daeso1238290eaf.2
        for <kvm-riscv@lists.infradead.org>; Fri, 27 Mar 2026 05:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774616384; cv=none;
        d=google.com; s=arc-20240605;
        b=HQ6muunMA4VSppGhcWwh++7uOmQqXeqhjsH+BVJKnusv/Ysr/NeWm6/mAeXXtsTdlA
         X59PtF+6rR6CHtDLcB5a8facd+fb33e+62I9fF6qzI6TpjXh1grpmEUQdrKNXawJfv8S
         kYk26ZUa3aXeC1haqbBhfa6crceCIuESNHWDtrm2s8zHVUsgMtzhHxEGM6hcWkmmHDek
         Mkn0HdRVur0UznH7d3kaTdh5e4MUE2v4AflsF5QJF+hu+bh3RPMhlNlDA2LBRPAoYyRb
         6ib0zTM1K6Tkzzz8mMg5jDaGxohVektSRVm36fkpd/ZBGSMxjTBq4p+bK6MMJW0/3qiz
         PIyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fSJNEQ4IUrIGBafuDjT61HQhcBt0f+9/E/O9i7xBSsY=;
        fh=KC2H2tMz8AIS64kjhM10nxd+qBJAXM3u3o3asdSgLbc=;
        b=Z6/ENFlu+/Fw6qzDbZUOG1ei1R4YIBsFnC/RzpCcU8SYBoEbjEiXITzkBO/IWUu1cb
         jrA0XU6MheD0e5ZIC0IoCx20VSI5mjIovyzoE+zhUaryF5wEKhLoWeCZEIoymzue9qVa
         RP4aWd+99M+nsewiXkT0h3zPrFmJqOo320wlrmdeNH8mZKKBe6taKDen7eOMD1KyGDKI
         YMjYVMpcXppPVVPL6m4sofYf3ST/7GQf60EZCzrXnOnN6OUm0/cntgceDNc2RdSWkvFp
         2loxuuCoNCqEtvKe0LnR3XWBLAE3kOcfjjdUCV9lKurizpjKMz2NHCcpvghDw5vUEriQ
         fXNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774616384; x=1775221184; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSJNEQ4IUrIGBafuDjT61HQhcBt0f+9/E/O9i7xBSsY=;
        b=eNzFZMyRokgODSud22G21txF+ZgQ4QZbfjnAPUlqEu7eyxxpj824eNsY0I71YvLrg3
         Tl8gy96QwrOCKdSSjARR7uILYKudDUxQG2CSKzoRHfHg0xtnDVikn6Q45KGP3EnN4uUG
         t5XgfFwH5f04gYhOlv7+IMO27uRZM+3NE0Ha1sBt+B+ZI9zG4jTpWha2Gr4OU/mQBJg8
         otFx1pG68vHi+m6r/Yp7wK9IiBx8EHpitG9LWDRny28bFH7q+czPaLp7sjG9U8/+v18B
         da/KjJ3nvKhVIWQmTinbkbI0fTEnR/Ez9gjamM2E0UqjzeLdkA15dl7DxGw6SXCjsUdK
         P2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774616384; x=1775221184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fSJNEQ4IUrIGBafuDjT61HQhcBt0f+9/E/O9i7xBSsY=;
        b=sLdtyPcA0MRk4hmRfl8iEXU/UFdSCms4fwvpy0OFqkAAl/V397pTvVc+G6inF9AfXR
         8xJal6HiFQfXRQfuXgXTVQqJNt6Ugv73sdEcWrPLcQLHV/2fpnX4jFDacndWHeZG3WJ1
         zC+gpJLSMEcX+oH9GiQHxTw5LmO93WzrieBt++nYoSk78PyknqocWEtlLPWtCzdVMHmQ
         /bFfh4ab2BHCi7vCzqBm3NkoL3dLSqGbTPvJtF7TvQomBwZVgoQ2U1Frnaz9kXlIbG4F
         UjcZ4tF+ZH90z3O/bVxOzrx5sOBqrKwC5mO6p2AHWHEZqfLeNTNjbRmT6OGxE0Ee5l3C
         XUsw==
X-Forwarded-Encrypted: i=1; AJvYcCW+JzkpW7DmuIjBzSeRnuzyIiKJ/P7JR+3zKerukTIVwnKsiUxqrUHrhsXU2PkpvmEsXi6fdELPJNc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpp4rhmIaoEJGCCeo1sNa9wXEWrOvj7I5Mi/kPlIKjW4jlkabz
	Cy1eoy90QzA2l1aH9LQlUsxkp57SLoJbsaG/NQk4R3HbCL8sNLAnVfnoLkHTYHiejbuvJYjjo6v
	s98/CuavLglH4uNsXmMKkgc+5cQgtRxEAkg/TitgqOImJsdC32lirGcs=
X-Gm-Gg: ATEYQzzncxlJiA1gd1rHx3UB6WzEv7lmn67cn6jmG/vXxRc36MhpIpZq9cZBHeS4VyV
	jk+iu4VXPyyhjYxXuQUtNXfn0QtONdCLNn5YilpEqzSPC/RzBHaSHv0TS9UTyhi02udhZIGLcfB
	tVxM5c+MWFpqn09TuClBO752XFmpdCre3CaEMuymngY8liVGjN1K5YuWwsaVyQMkOW6JaQ6JPv3
	m8KML4wt1wytC34MHBSsRUdanqtT4u8+H4WeDla69fEI6GK2UaWBY0I56Ppa2DIehMZJwjXRNkP
	vMNBd0tXzaKEmVAv3csJyZi7ltWLFm/oGoQNl5YYupcS0odxiy5UpLmL08VB2gUky9rKHjZsXWt
	HqCB5YYQxxNF6QVHcuezX9N3OPw==
X-Received: by 2002:a05:6820:221a:b0:67c:2b6b:520c with SMTP id
 006d021491bc7-67e1875a871mr1122414eaf.62.1774616383734; Fri, 27 Mar 2026
 05:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260303010859.1763177-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260303010859.1763177-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Mar 2026 18:29:31 +0530
X-Gm-Features: AQROBzCGKH8Yynm5vTwqjoLikHfT_rvE6B5eaTVPa88iE5QN8BHshTiNb-us74k
Message-ID: <CAAhSdy0Jw_XvVK5brSRN3QGvnYHNEJc=tL65z+iUnSSjFObuPA@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] RISC-V: KVM: Validate SBI STA shmem alignment
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_055945_621472_611A283F 
X-CRM114-Status: GOOD (  11.58  )
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

T24gVHVlLCBNYXIgMywgMjAyNiBhdCA2OjM54oCvQU0gSmlha2FpIFh1IDx4dWppYWthaTIwMjVA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgZml4ZXMgYSBtaXNzaW5nIHZhbGlk
YXRpb24gaW4gdGhlIFJJU0MtViBLVk0gU0JJCj4gc3RlYWwtdGltZSBhY2NvdW50aW5nIChTVEEp
IHJlZ2lzdGVyIGhhbmRsaW5nLgo+Cj4gUGF0Y2ggMSB2YWxpZGF0ZXMgdGhlIGNvbmZpZ3VyZWQg
U0JJIFNUQSBzaGFyZWQgbWVtb3J5IEdQQSBhdAo+IEtWTV9TRVRfT05FX1JFRywgZW5mb3JjaW5n
IHRoZSA2NC1ieXRlIGFsaWdubWVudCByZXF1aXJlbWVudAo+IGRlZmluZWQgYnkgdGhlIFNCSSBz
cGVjaWZpY2F0aW9uIG9yIGFsbG93aW5nIElOVkFMSURfR1BBIHRvIGV4cGxpY2l0bHkKPiBkaXNh
YmxlIHN0ZWFsLXRpbWUgYWNjb3VudGluZy4gVGhpcyBwcmV2ZW50cyBpbnZhbGlkIHVzZXJzcGFj
ZSBzdGF0ZQo+IGZyb20gcmVhY2hpbmcgcnVudGltZSBjb2RlIHBhdGhzIGFuZCBhdm9pZHMgV0FS
Tl9PTigpIHRyaWdnZXJzIGR1cmluZwo+IEtWTV9SVU4uCj4KPiBQYXRjaCAyIHJlZmFjdG9ycyBl
eGlzdGluZyBVQVBJIHRlc3RzIGZyb20gc3RlYWxfdGltZV9pbml0KCkgaW50bwo+IGEgZGVkaWNh
dGVkIGNoZWNrX3N0ZWFsX3RpbWVfdWFwaSgpIGZ1bmN0aW9uIGZvciBiZXR0ZXIgY29kZSBvcmdh
bml6YXRpb24sCj4gYW5kIGFkZHMgYW4gZW1wdHkgc3R1YiBmb3IgUklTQy1WLgo+Cj4gUGF0Y2gg
MyBmaWxscyBpbiB0aGUgUklTQy1WIHN0dWIgd2l0aCB0ZXN0cyB0aGF0IHZlcmlmeSBLVk0gY29y
cmVjdGx5Cj4gZW5mb3JjZXMgdGhlIFNUQSBhbGlnbm1lbnQgcmVxdWlyZW1lbnRzLgo+Cj4gSmlh
a2FpIFh1ICgzKToKPiAgIFJJU0MtVjogS1ZNOiBWYWxpZGF0ZSBTQkkgU1RBIHNobWVtIGFsaWdu
bWVudCBpbgo+ICAgICBrdm1fc2JpX2V4dF9zdGFfc2V0X3JlZygpCj4gICBLVk06IHNlbGZ0ZXN0
czogUmVmYWN0b3IgVUFQSSB0ZXN0cyBpbnRvIGRlZGljYXRlZCBmdW5jdGlvbgo+ICAgUklTQy1W
OiBLVk06IHNlbGZ0ZXN0czogQWRkIFJJU0MtViBTQkkgU1RBIHNobWVtIGFsaWdubWVudCB0ZXN0
cwo+Cj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0YS5jICAgICAgICAgICAgICAgICB8IDE2
ICsrLQo+ICAuLi4vc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91dGlsX3R5cGVzLmggICAgfCAg
MiArCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9zdGVhbF90aW1lLmMgICAgICB8IDk4
ICsrKysrKysrKysrKysrKystLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA5NSBpbnNlcnRpb25zKCsp
LCAyMSBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi4zNC4xCj4KClF1ZXVlZCB0aGlzIHNlcmllcyBm
b3IgTGludXgtNy4xCgpUaGFua3MsCkFudXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
