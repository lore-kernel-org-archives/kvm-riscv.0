Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F52C369DC
	for <kvm-riscv@archiver.kernel.org>; Thu,  1 May 2025 13:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q75QXu3s7XBbv9PztSqcMbPIs8XDlt3OsaKcfLVqPDk=; b=Dy3nybbR7EPpjx
	PEGuKqM4BC2Oe0z2zuOaLQQYg4LhJRMXXkr3PApTvctZAYfrDKQ4vCPx+NsciInwHLT+88k5rEofB
	5AJ4hK5AXGtR8iiTySFPHQeDYE6LvTS5g8Ps1IEiEvrhGZxB+GF744j+znFQDpnhtBtMzKot/Twsz
	ydMV3zzXxegZjS9HXILpT8IYkWN8whPxBCl87Lolv8lbptmX/LQ7sO8KzO/xFfZRztyOuYN/q6jZ6
	BsI9XE6Vc8gZtY8AfQlTBHJaNzmSt1oeMe4I6ABmxMg7QWLFN/my0/YsdoBp/bXzx4ecitXDrbwJF
	aMsVvCHYYhzKOZUx9afw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATj8-0000000Fn7S-3AA9;
	Thu, 01 May 2025 13:13:22 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATj6-0000000Fn6y-3ETG
	for kvm-riscv@lists.infradead.org;
	Thu, 01 May 2025 13:13:22 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3d6d6d82633so3006655ab.0
        for <kvm-riscv@lists.infradead.org>; Thu, 01 May 2025 06:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746105199; x=1746709999; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8cnw7gES+2CPKoNFqxe9oNSToGNtvAVlGUfutI0aoo=;
        b=Na8DUoFpQpWHP7GixN5BWPFB8dQcfC7iNlJjOKbskHr+vGyKhAmRizTG+cpVTlK1CL
         yUJMuUfqBaCXxHXp7cNsxBga8nx13AZ9UxA7QxgsQA/FCjG1dJmLH6dV1Qm0AKvFJZKY
         nyo9I9dLxuxpvIpydlRmyxSxHy+Jd+JcvFdw70hZO6KauI4ZeZX56Ary9YEMmvkCSnre
         FSk3ODaTRW1qrzH5S/fRUXLAZJuR48vWStCqP9nkYy+UyXgq5xP2w0PANHJ0l1Mprmt3
         sDNO3D0rPhLoBRUOFnOgybL/4yp5Vooh6OIUbzPklwICLMS5ZUiKvT6NuYiYtDzgsNTU
         WCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746105199; x=1746709999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8cnw7gES+2CPKoNFqxe9oNSToGNtvAVlGUfutI0aoo=;
        b=LKeFbqSlmBSFm9ho6Tt3Cwj1EY5s4eB/AfTmOqvhkB+5/ReLXubT4+jYgQFiAbkfnt
         5cBcjcRRZ65CvcO1TWz31T48GgrgO5+1El/9bnb9hTebxcOMSJqF9gbSKiYXSBFuOlIA
         Ihv+HIT+uWHedy3qc3xyXVwxWJcrPX2+IOf+KEJlJKY+kvGU0Ja5Vm+m8IS0N07JwYST
         D8Kl0zDI5EZyCkqYhWn3d3exy7ajJ67WhnvONLm2RxNPqAY5CQ0lZHEML5/tOPZKEV3k
         0J2D/0bBYPXi1xKDik/+lrFNdM4qy7RWPRDqJ5DoV3SiV0MCTcVL6o8e+6Vha11T1357
         g+pA==
X-Forwarded-Encrypted: i=1; AJvYcCW3duLvsBV138boVlIvmOOHeV8S3qf1Z29oSUQceJMtrE6t//7q/O7PVvBQRJR9BqZ9deW24NXyR3A=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywybi8yv3IbdQLJUq0aZAYxQAbdI9hYP2UNCXVEYRlJU2f7wNsA
	e7vfzFDjW/G+rD02OHZH0zltvsUPSb2e5gQ9TGnupvgRHGzOvWqUBhcI1M9Wf1TbY1Ailm5hdj5
	CSq1s6jrTvPzXwp8G4O5REOFKuZIDpAZ5Tnm5UQ==
X-Gm-Gg: ASbGncts6pVqt8IRxcpVYgE1vWXVG3Ex55+yCgvw/GPFAyohIrqo8gIxL4LMIuItJ3s
	/IlnfIvnE6/SSSIh9T8IdhhK52qwqPjcbukYYJD9nJpthcEJZviEiltZDWPyaIbKEJZyuPA6i4n
	WrRVpeITRu+8LZH/M86iZOG4uDXD2NaB0MvA==
X-Google-Smtp-Source: AGHT+IFYH/yz9ETM9NLPFlE2pVkQwoPg56TQHPQR5mOU/5lz7nNUj+hk9/rsWp5zS5jnU2+qLzeLlD75PGhwF7yzJJc=
X-Received: by 2002:a05:6e02:1aaf:b0:3d9:24a7:db0c with SMTP id
 e9e14a558f8ab-3d96f1b20ddmr38261815ab.8.1746105199109; Thu, 01 May 2025
 06:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250426110348.338114-1-apatel@ventanamicro.com>
In-Reply-To: <20250426110348.338114-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 1 May 2025 18:43:07 +0530
X-Gm-Features: ATxdqUFKSjteFgCBlQofgGe5rmP86z7GpzG9AH1PpGwKFUlwJL4JNjmeLly_eRQ
Message-ID: <CAAhSdy3VJUyR=9KKQrHLpn_dqnyqpDore4CCC0SGPM4pjZ3opQ@mail.gmail.com>
Subject: Re: [kvmtool PATCH v3 00/10] Add SBI system suspend and cpu-type option
To: Will Deacon <will@kernel.org>
Cc: julien.thierry.kdev@gmail.com, maz@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_061321_075559_987EBE2B 
X-CRM114-Status: GOOD (  15.08  )
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

SGkgV2lsbCwKCk9uIFNhdCwgQXByIDI2LCAyMDI1IGF0IDQ6MzPigK9QTSBBbnVwIFBhdGVsIDxh
cGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHNlcmllcyBkb2VzIHRoZSBm
b2xsb3dpbmcgaW1wcm92ZW1lbnRzOgo+IDEpIEFkZCBTdnZwdGMsIFphYmhhLCBhbmQgWmljY3Jz
ZSBleHRlbnNpb24gc3VwcG9ydCAoUEFUQ0gyIHRvIFBBVENIMykKPiAyKSBBZGQgU0JJIHN5c3Rl
bSBzdXNwZW5kIHN1cHBvcnQgKFBBVENINSB0byBQQVRDSDYpCj4gMykgQWRkICItLWNwdS10eXBl
IiBjb21tYW5kLWxpbmUgb3B0aW9uIHN1cHBvcnRpbmcgIm1pbiIgYW5kICJtYXgiCj4gICAgQ1BV
IHR5cGVzIHdoZXJlICJtYXgiIGlzIHRoZSBkZWZhdWx0IChQQVRDSDggdG8gUEFUQ0gxMCkKPgo+
IFRoZXNlIHBhdGNoZXMgY2FuIGFsc28gYmUgZm91bmQgaW4gdGhlIHJpc2N2X21vcmVfZXh0c19y
b3VuZDZfdjMgYnJhbmNoCj4gYXQ6IGh0dHBzOi8vZ2l0aHViLmNvbS9hdnBhdGVsL2t2bXRvb2wu
Z2l0Cj4KPiBDaGFuZ2VzIHNpbmNlIHYyOgo+ICAtIEFkZHJlc3NlZCBjb21tZW50cyBvbiBQQVRD
SDEwCj4KPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ICAtIFJlYmFzZWQgb24gbGF0ZXN0IEtWTVRPT0wg
Y29tbWl0IGQ0MTBkOWExNmY5MTQ1OGFlMmI5MTJjYzA4ODAxNTM5NmYyMmRmYWQKPiAgLSBBZGRy
ZXNzZWQgY29tbWVudHMgb24gUEFUQ0g4LCBQQVRDSDksIGFuZCBQQVRDSDEwCj4KPiBBbmRyZXcg
Sm9uZXMgKDMpOgo+ICAgcmlzY3Y6IEFkZCBTQkkgc3lzdGVtIHN1c3BlbmQgc3VwcG9ydAo+ICAg
cmlzY3Y6IE1ha2Ugc3lzdGVtIHN1c3BlbmQgdGltZSBjb25maWd1cmFibGUKPiAgIHJpc2N2OiBG
aXggbm8gcGFyYW1zIHdpdGggbm9kZWZhdWx0IHNlZ2ZhdWx0Cj4KPiBBbnVwIFBhdGVsICg3KToK
PiAgIFN5bmMtdXAgaGVhZGVycyB3aXRoIExpbnV4LTYuMTQga2VybmVsCj4gICByaXNjdjogQWRk
IFN2dnB0YyBleHRlbnNpb24gc3VwcG9ydAo+ICAgcmlzY3Y6IEFkZCBaYWJoYSBleHRlbnNpb24g
c3VwcG9ydAo+ICAgcmlzY3Y6IEFkZCBaaWNjcnNlIGV4dGVuc2lvbiBzdXBwb3J0Cj4gICByaXNj
djogSW5jbHVkZSBzaW5nbGUtbGV0dGVyIGV4dGVuc2lvbnMgaW4gaXNhX2luZm9fYXJyW10KPiAg
IHJpc2N2OiBBZGQgY3B1LXR5cGUgY29tbWFuZC1saW5lIG9wdGlvbgo+ICAgcmlzY3Y6IEFsbG93
IGluY2x1ZGluZyBleHRlbnNpb25zIGluIHRoZSBtaW4gQ1BVIHR5cGUgdXNpbmcKPiAgICAgY29t
bWFuZC1saW5lCj4KPiAgYXJtNjQvaW5jbHVkZS9hc20va3ZtLmggICAgICAgICAgICAgfCAgIDMg
LQo+ICBpbmNsdWRlL2xpbnV4L2t2bS5oICAgICAgICAgICAgICAgICB8ICAgOCArLQo+ICBpbmNs
dWRlL2xpbnV4L3ZpcnRpb19wY2kuaCAgICAgICAgICB8ICAxNCArKwo+ICByaXNjdi9haWEuYyAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICByaXNjdi9mZHQuYyAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDI0MCArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4gIHJpc2N2
L2luY2x1ZGUvYXNtL2t2bS5oICAgICAgICAgICAgIHwgICA3ICstCj4gIHJpc2N2L2luY2x1ZGUv
a3ZtL2t2bS1hcmNoLmggICAgICAgIHwgICAyICsKPiAgcmlzY3YvaW5jbHVkZS9rdm0va3ZtLWNv
bmZpZy1hcmNoLmggfCAgMjYgKysrCj4gIHJpc2N2L2luY2x1ZGUva3ZtL3NiaS5oICAgICAgICAg
ICAgIHwgICA5ICsrCj4gIHJpc2N2L2t2bS1jcHUuYyAgICAgICAgICAgICAgICAgICAgIHwgIDM2
ICsrKysrCj4gIHg4Ni9pbmNsdWRlL2FzbS9rdm0uaCAgICAgICAgICAgICAgIHwgICAxICsKPiAg
MTEgZmlsZXMgY2hhbmdlZCwgMjY1IGluc2VydGlvbnMoKyksIDgzIGRlbGV0aW9ucygtKQo+Cj4g
LS0KPiAyLjQzLjAKPgoKRnJpZW5kbHkgcGluZyA/CgpSZWdhcmRzLApBbnVwCgotLSAKa3ZtLXJp
c2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
