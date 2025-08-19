Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E6FCA0EFE
	for <kvm-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 11:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0nFjZDXqXfhpV1Ab3CEbiZTCrxrJAVVzdww0OT4awzI=; b=WIswciTDvv3QVP
	gF72Yx9GUtJgT5j3b4hxd4fe1KOcjHF5jJX/nzYVRcXe7Lw/2cOSJOnwis5LPaj6bXzmd70+BDA7K
	iq1i/Wc7WkzZvU8hmFqNV//jcapl88Nm/Kd8nMguFIwHRwSTxR+LhqORA/r7A3k5n66KIjuxU0YeK
	RE+pS1tscBcy2HCSBtYsZzebh0A7DGDsKX0weJFc3WgnJ4I2puBJt/8w5kwsX/WKY2HmhLPSOiVx9
	rNMAFdLYxJ97vqlCZUfLkeInBKcp1vs+/uAxOKQtE11d+gqoc3muPl7KNNIh6ul4+PbxYlW9ATJVu
	dqr5qSef55W5Au9TfiFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKdV-0000000AIwB-2QCp;
	Tue, 19 Aug 2025 11:36:17 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJ5g-0000000A3Ez-47yQ
	for kvm-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 09:57:18 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55ce508cfe0so4964041e87.0
        for <kvm-riscv@lists.infradead.org>; Tue, 19 Aug 2025 02:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755597435; x=1756202235; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B657FCRrA1HpbcN+g/vtvEIg1TfbvbOHf4kJ5LZvO5U=;
        b=TJsfggMNqF4DkuoX4A/uIJ11zg6Zt7ogsgqxsldqboApPBVFstnUbapeCHXEB8VGEh
         76zFtk3UN1FnD2rMVNiC0Ckpnrzew3SNnBvS7AUP49dzxWB6Q/VISpBFgQblB7kPudRV
         /8uOThl7F0cUgv9K+zZyANF6C7rhNm60TR8BQqWWwzKW754vh2ia4Ehty8papOgZSt9I
         BvHcSVkv/GsWs+uP8Yz2vASIFQiWQDFoG/+qLcL5LM1NiXl9dCrvAOQiu1ryKIJRjv6i
         U13g5MnwO3/UkYh7q7EwCtOjqQKH72mwptcLyREMBlje7rgCTZG7j6Iz1HiiPYJ8Fm8X
         pVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597435; x=1756202235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B657FCRrA1HpbcN+g/vtvEIg1TfbvbOHf4kJ5LZvO5U=;
        b=g+GDSSbplChg526v1lYiV16DHoblhcnVMRpT/+M5puI01nx56/C6aBywmkA9zYE9Nz
         MP2/3bV6HOJTXqeD49cQsRVlNnbvxJcuxKV+wvHmunEjxlce/DPlJUrtPifUT+us9dzp
         doqd70E6/T+wDiJDG34XSuLq5AtToRkDgyh+M5Eah09aL7n6RlIjSYAO2K3xH6Ac7Or5
         ywEw2aW5dEqRrT+cC5tm6tw3Y/ur9xVaQYsb56TJxgsq0moekDhbtAMU5a5I9w/LDYnH
         Ux2bFMqDi3REke47J21ctFW2KtKWdLftotn2ElC4uVBQNCxBntIx896InfqvGXvfukEx
         2TsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2vV87qHYcXaUdSv49JEvhOALyXWDLHlnZw46hOo5opVQeuWBALInnqj5ri5mqd8hEkx4MVdRncRo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4j4qea9iKai3H9alhngLhEAP/TpOOorGCVrnYgGhffHi+FFuw
	H0WqcVHXIT1AeUdJGFxT28mXS8DH9PZiLDlEn7YJk1WwOKVGa7qNL7UXhuZfUnhoc7ur6L7HFAK
	ugtC1yO3DA+d16K8VWmO/IGd4karhEGtHSbKAysq5iA==
X-Gm-Gg: ASbGncvUp8LCsTZujxMMDrs1a5KHMWK4xXQLF3dfO2/pHDJYdwB3GwmYHriUnBt5+QZ
	UqkjI3/sQ73NbFGXvDHHhM/lBHQ3qIWwH1z6SmKBUpyBJtLdDyhzkG71Dgf5s9ZpuVvJD/if9uQ
	UvlcR8q/MgqKWK/obMZOvOj1sS+kYmHPBNfeiwggTx+lXt5fpbU4U1m64eBE1HVBrN8QiBPu0Xg
	KkzCq0f
X-Google-Smtp-Source: AGHT+IE584Lps5ZJGPPasz2qjXvE1uln/YoeKZ+NEr5/UBb8mlMMaF+8xE4Mk12v0EiPPAIF33QJj8U3svU1V3OfZ8Y=
X-Received: by 2002:a05:6512:3411:b0:55c:e5c3:1a44 with SMTP id
 2adb3069b0e04-55e007db76bmr626581e87.48.1755597435230; Tue, 19 Aug 2025
 02:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy3omyk7YGVHNV5mgR13cON1SxdpqsxGQJsWWE1Hoyw=5A@mail.gmail.com>
 <20250819012558.88733-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20250819012558.88733-1-fangyu.yu@linux.alibaba.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 19 Aug 2025 15:27:01 +0530
X-Gm-Features: Ac12FXyTUxSpF4ciP7rx8i1SvNQzuuHLy0NA8cpXjF9T81-EV5Hi44pHTVwLXYE
Message-ID: <CAK9=C2XN3izaV_cB5dTkRD0FRD+gqdRVYWKxMAuaCG+LP3D2aw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Using user-mode pte within kvm_riscv_gstage_ioremap
To: fangyu.yu@linux.alibaba.com
Cc: anup@brainfault.org, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	atish.patra@linux.dev, guoren@linux.alibaba.com, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_025717_028548_B52409ED 
X-CRM114-Status: GOOD (  16.91  )
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

T24gVHVlLCBBdWcgMTksIDIwMjUgYXQgNjo1NuKAr0FNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gPj4KPiA+PiBGcm9tOiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51
eC5hbGliYWJhLmNvbT4KPiA+Pgo+ID4+IEN1cnJlbnRseSB3ZSB1c2Uga3ZtX3Jpc2N2X2dzdGFn
ZV9pb3JlbWFwIHRvIG1hcCBJTVNJQyBncGEgdG8gdGhlIHNwYSBvZgo+ID4+IGd1ZXN0IGludGVy
cnVwdCBmaWxlIHdpdGhpbiBJTVNJQy4KPiA+Pgo+ID4+IFRoZSBQQUdFX0tFUk5FTF9JTyBwcm9w
ZXJ0eSBkb2VzIG5vdCBpbmNsdWRlIHVzZXIgbW9kZSBzZXR0aW5ncywgc28gd2hlbgo+ID4+IGFj
Y2Vzc2luZyB0aGUgSU1TSUMgYWRkcmVzcyBpbiB0aGUgdmlydHVhbCBtYWNoaW5lLCAgYSAgZ3Vl
c3QgcGFnZSBmYXVsdAo+ID4+IHdpbGwgb2NjdXIsIHRoaXMgaXMgbm90IGV4cGVjdGVkLgo+ID4+
Cj4gPj4gQWNjb3JkaW5nIHRvIHRoZSBSSVNDLVYgUHJpdmlsZWdlZCBBcmNoaXRlY3R1cmUgU3Bl
YywgZm9yIEctc3RhZ2UgYWRkcmVzcwo+ID4+IHRyYW5zbGF0aW9uLCBhbGwgbWVtb3J5IGFjY2Vz
c2VzIGFyZSBjb25zaWRlcmVkIHRvIGJlIHVzZXItbGV2ZWwgYWNjZXNzZXMKPiA+PiBhcyB0aG91
Z2ggZXhlY3V0ZWQgaW4gVW1vZGUuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBGYW5neXUgWXUg
PGZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPk92ZXJhbGwsIGEgZ29vZCBmaXgu
IFRoYW5rcyEKPiA+Cj4gPlRoZSBwYXRjaCBzdWJqZWN0IGFuZCBkZXNjcmlwdGlvbiBuZWVkcyBp
bXByb3ZlbWVudHMuIEFsc28sIHRoZXJlIGlzIG5vCj4gPkZpeGVzIHRhZyB3aGljaCBpcyByZXF1
aXJlZCBmb3IgYmFja3BvcnRpbmcuCj4gPgo+ID5JIGhhdmUgdGFrZW4gY2FyZSBvZiB0aGUgYWJv
dmUgdGhpbmdzIGF0IHRoZSB0aW1lIG9mIG1lcmdpbmcgdGhpcyBwYXRjaC4KPiA+Cj4gPlF1ZXVl
ZCB0aGlzIHBhdGNoIGFzIGZpeGVzIGZvciBMaW51eC02LjE3Cj4gPgo+ID5UaGFua3MsCj4gPkFu
dXAKPiA+Cj4KPiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lgo+IEkgd2lsbCBzZW5kIGEgdjIgcGF0
Y2ggdG8gZml4IHRoZXNlIGNvbW1lbnRzLgoKTm8gbmVlZCwgaXQncyBhbHJlYWR5IHBhcnQgb2Yg
bXkgcmlzY3Zfa3ZtX2ZpeGVzIGJyYW5jaCBhdDoKaHR0cHMvL2dpdGh1Yi5jb20va3ZtLXJpc2N2
L2xpbnV4LmdpdAoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3Zt
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
