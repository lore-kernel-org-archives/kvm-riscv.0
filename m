Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD98FCFD313
	for <kvm-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 15:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nTYzXaipx3WMNIWGf8q8Dzutd7xPcqDNBmAL+5NonCc=; b=xj5xIsw/j3bn7T
	73KduRyV8sD1gqxb+0h5SS3sq2Wep2IZlo46upUBEpIsPKPsLytH/qyxPH9WauyuVLuqF91uKhwFB
	3tRUx94wqlTnl/J+IaNVOiKcK0OJvfYu64SpMXiFwXn8kA7hfh3qdZmBfALWULwzE2gw129XfU4cY
	oOpquzYXHFT2AqaOd8ThEmr3s5NapQ0oNiwQExh/zXTeA7zck1zPEffbOWEUcbdddROpMO6nTdiB7
	6Xw6pajSb1W1+QHrQ/hnAqg+fls1RzGgk1BVBPE83XSfpdHo9VLMwJq07ZDb4eWNrNyBG1dX8rHzj
	ROY/CVJWG2Dui6VGvK6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYTz-0000000BvBZ-0xwv;
	Mon, 24 Nov 2025 15:28:03 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYTx-0000000BvAL-1776
	for kvm-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 15:28:02 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-43379251ff9so25579125ab.1
        for <kvm-riscv@lists.infradead.org>; Mon, 24 Nov 2025 07:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1763998080; x=1764602880; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q1RSYP6MsAvIm0Pq2Uruz+WZQe9fgkegsjE1gjboYnk=;
        b=b5BBTp6ObLbrACYdFbo/vr5UEqRQT2NPhZGvMejyz1BaOh1vOeOKQrr3Z/9WbFAqQZ
         3siezo5pRuLP/AAk9WxuAbTJ/LWCsBE40qa6VK/MD/BahUtkd+PTXuxbN9ElMZYFoeH2
         XxLI3vfVQalNNAbll532jr9cSunUGX6CXzDLEMSp4aaF1A5N8u3TaNb87vEjpM6uejHo
         wontdpN55fpHLO+RDwFXXnKnkK5OxpmVShh3zHqvX6Qi1L1SvOOAbalW+uTWMVOwAun5
         X8y/IzJ1ZH1Qb/rr8O0qYrkWn1vn7UZ+p5li+g72wLo+uL2PMqp5ECqHJ52UOmw+dp35
         Fh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763998080; x=1764602880;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q1RSYP6MsAvIm0Pq2Uruz+WZQe9fgkegsjE1gjboYnk=;
        b=wBqdV1aChO6onVCvIEBu34RAS0AZTLaaPzSBP3dRSKY//dj+Hvh665+B/9fHnbtXrG
         c+6IzAa1PFEEh3txX23qH++BpuPsNY4VlmVZok4eMqscsluqxF/czVJcAxpp+UJffC9i
         pAf/In2y3N+Yk5/aCVx9zzC5gvy/3eLWsavlBbZejtsZgXcLafSZxGDmFsaQoEpHi5Cj
         yA8pl1/bLD4NsxEzf8janV4u6KXh4EQ9YCijJ9dwXAVYhBgqjcQTPtuQb/MMRUXQbPOB
         Vd/Okp/p7pfyEAxQ8u4m4BkloGF3ioVSTeKCKyYJDs5yg8gpaMyf3gsoToNL0SDZ6nmi
         iVRA==
X-Forwarded-Encrypted: i=1; AJvYcCV3ITJvNGr7TAGmgEt2DaJ5UsxnvF7dj2UXklsuvl1rDAVpKUcI8WcOI3AiHzNmLuvU0Gxd5xvUvow=@lists.infradead.org
X-Gm-Message-State: AOJu0YygrmbzJXPhyAAYy/SzgVAV8t6f1c/7L0qzcJu7qNCXwh0i06AM
	d9R9UlCE+IynhvBINyT6wz0dOTLjxFia3zaRdZRFTzmyG+Io7Lh1E2EUdawXIP6etsI=
X-Gm-Gg: ASbGnct2pGKkKvxTgugXR1Absj7W2B4CVKCG1Ie/86jrykpkL8mFmzR4XwUeAKyjmVO
	I/otVGVs/NLuFhcppgfePZcxk8B4bIjNk7w/EXEhTp+n2p0VRU6ZyACYDDlg+6dQeEjIHbLjMjb
	6VquH/LRxIbccQ7sIk/XcCoyhVW/CMq/dGKThcg5BzDjORukt87/vMQA3+xfzLc13Q2QGtluwCc
	tzmgyWyQaMztpUUSasz65QowJ7ZZ1JGDBnN/AO1YZi3HxEHv19oo640JDhyQG26fKPpdQxZLi97
	+ys/utV6+t5U3UfRSvxjQbRzmnwaxamVQJP9v7wNLq9Qbj5coe7sYq2Ww9yDtqi7C/Jpm46Enra
	R05oNTZqk8UZg955kuuebV9sPLvgqfpMH+AIDxcpWx02vrHgBNzoYi+M42Gm+Dez3SDcwBA4J0x
	d4oH9DfBtlf2Mm
X-Google-Smtp-Source: AGHT+IHmDpkWVE+bXi7YcFx06zdDu1mvUX5E8wtndVMa3n+flWgwc0GhUUEOVNOo3pwJ3is8DkRQDw==
X-Received: by 2002:a05:6e02:3187:b0:433:7842:7967 with SMTP id e9e14a558f8ab-435b90f7448mr96578225ab.11.1763998079832;
        Mon, 24 Nov 2025 07:27:59 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-435a90dba32sm60356135ab.28.2025.11.24.07.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 07:27:59 -0800 (PST)
Date: Mon, 24 Nov 2025 09:27:57 -0600
From: Andrew Jones <ajones@ventanamicro.com>
To: Guo Ren <guoren@kernel.org>
Cc: fangyu.yu@linux.alibaba.com, anup@brainfault.org, 
	atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: KVM: Allow to downgrade HGATP mode via SATP mode
Message-ID: <20251124-4ecf1b6b91b8f0688b762698@orel>
References: <20251122075023.27589-1-fangyu.yu@linux.alibaba.com>
 <CAJF2gTTRBFTnu2pA5rh16EWLvF_Wo=+vpZMUK9roDkDPes4Fpg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTRBFTnu2pA5rh16EWLvF_Wo=+vpZMUK9roDkDPes4Fpg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_072801_305682_67112D49 
X-CRM114-Status: GOOD (  14.72  )
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

T24gU3VuLCBOb3YgMjMsIDIwMjUgYXQgMTA6MzM6MTlBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBTYXQsIE5vdiAyMiwgMjAyNSBhdCAzOjUw4oCvUE0gPGZhbmd5dS55dUBsaW51eC5hbGli
YWJhLmNvbT4gd3JvdGU6Cj4gPgo+ID4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXgu
YWxpYmFiYS5jb20+Cj4gPgo+ID4gQ3VycmVudGx5LCBIR0FUUCBtb2RlIHVzZXMgdGhlIG1heGlt
dW0gdmFsdWUgZGV0ZWN0ZWQgYnkgdGhlIGhhcmR3YXJlCj4gPiBidXQgb2Z0ZW4gc3VjaCBhIHdp
ZGUgR1BBIGlzIHVubmVjZXNzYXJ5LCBqdXN0IGFzIGEgaG9zdCBzb21ldGltZXMKPiA+IGRvZXNu
J3QgbmVlZCBzdjU3Lgo+ID4gSXQncyBsaWtlbHkgdGhhdCBubyBhZGRpdGlvbmFsIHBhcmFtZXRl
cnMgKGxpa2Ugbm81bHZsIGFuZCBubzRsdmwpIGFyZQo+ID4gbmVlZGVkLCBhbGlnbmluZyBIR0FU
UCBtb2RlIHRvIFNBVFAgbW9kZSBzaG91bGQgbWVldCB0aGUgcmVxdWlyZW1lbnRzCj4gPiBvZiBt
b3N0IHNjZW5hcmlvcy4KPiBZZXMsIG5vNS80bHZsIGlzIG5vdCBjbGVhciBhYm91dCBzYXRwIG9y
IGhnYXRwLiBTbywgY292ZXJpbmcgSEdQQVRQIGlzCj4gcmVhc29uYWJsZS4KClRoZSBkb2N1bWVu
dGF0aW9uIHNob3VsZCBiZSBpbXByb3ZlZCwgYnV0IEkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0byBz
dGF0ZQp0aGF0IHRoZXNlIHBhcmFtZXRlcnMgYXBwbHkgdG8gYm90aCBzLSBhbmQgZy1zdGFnZS4g
SWYgd2UgbmVlZCBwYXJhbWV0ZXJzCnRvIGRpY3RhdGUgS1ZNIGJlaGF2aW9yIChnLXN0YWdlIG1h
bmFnZW1lbnQpLCB0aGVuIHdlIHNob3VsZCBhZGQgS1ZNCm1vZHVsZSBwYXJhbWV0ZXJzLgoKVGhh
bmtzLApkcmV3CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2
bS1yaXNjdgo=
